//===--- ParseDiagnosticsGenerator.swift ----------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import SwiftSyntax

extension UnexpectedNodesSyntax {
  func tokens(satisfying isIncluded: (TokenSyntax) -> Bool) -> [TokenSyntax] {
    return self.children(viewMode: .sourceAccurate).compactMap({ $0.as(TokenSyntax.self) }).filter(isIncluded)
  }

  func tokens(withKind kind: TokenKind) -> [TokenSyntax] {
    return self.tokens(satisfying: { $0.tokenKind == kind })
  }
}

public class ParseDiagnosticsGenerator: SyntaxAnyVisitor {
  private var diagnostics: [Diagnostic] = []

  /// IDs of nodes for which we already generated diagnostics in a parent's visit
  /// method and that should thus not be visited.
  private var handledNodes: [SyntaxIdentifier] = []

  private init() {
    super.init(viewMode: .all)
  }

  public static func diagnostics(for tree: SyntaxProtocol) -> [Diagnostic] {
    let diagProducer = ParseDiagnosticsGenerator()
    diagProducer.walk(tree)
    return diagProducer.diagnostics
  }

  // MARK: - Private helper functions

  /// Produce a diagnostic.
  private func addDiagnostic<T: SyntaxProtocol>(_ node: T, _ message: DiagnosticMessage) {
    diagnostics.append(Diagnostic(node: Syntax(node), message: message))
  }

  /// If a diagnostic is generated that covers multiple syntax nodes, mark them as handles so they don't produce the generic diagnostics anymore.
  private func markNodesAsHandled(_ nodes: SyntaxIdentifier...) {
    handledNodes.append(contentsOf: nodes)
  }

  /// Whether the node should be skipped for diagnostic emission.
  /// Every visit method must check this at the beginning.
  private func shouldSkip<T: SyntaxProtocol>(_ node: T) -> Bool {
    return handledNodes.contains(node.id)
  }

  // MARK: - Generic diagnostic generation

  public override func visitAny(_ node: Syntax) -> SyntaxVisitorContinueKind {
    if shouldSkip(node) {
      return .skipChildren
    }
    return .visitChildren
  }

  override public func visit(_ node: UnexpectedNodesSyntax) -> SyntaxVisitorContinueKind {
    if shouldSkip(node) {
      return .skipChildren
    }
    addDiagnostic(node, UnexpectedNodesDiagnostic(unexpectedNodes: node))
    return .skipChildren
  }

  override public func visit(_ node: TokenSyntax) -> SyntaxVisitorContinueKind {
    if shouldSkip(node) {
      return .skipChildren
    }
    if node.isMissing {
      addDiagnostic(node, MissingTokenDiagnostic(missingToken: node))
    }
    return .skipChildren
  }

  // MARK: - Specialized diagnostic generation

  public override func visit(_ node: ForInStmtSyntax) -> SyntaxVisitorContinueKind {
    if shouldSkip(node) {
      return .skipChildren
    }
    // This is mostly a proof-of-concept implementation to produce more complex diagnostics.
    if let unexpectedCondition = node.body.unexpectedBeforeLeftBrace {
      // Detect C-style for loops based on two semicolons which could not be parsed between the 'for' keyword and the '{'
      if unexpectedCondition.tokens(withKind: .semicolon).count == 2 {
        addDiagnostic(node, CStyleForLoopDiagnostic())
        markNodesAsHandled(node.inKeyword.id, unexpectedCondition.id)
      }
    }
    return .visitChildren
  }

  public override func visit(_ node: FunctionSignatureSyntax) -> SyntaxVisitorContinueKind {
    if shouldSkip(node) {
      return .skipChildren
    }
    if let output = node.output, let unexpectedBeforeReturnType = output.unexpectedBetweenArrowAndReturnType {
      if let throwsInReturnPosition = unexpectedBeforeReturnType.tokens(withKind: .throwsKeyword).first {
        addDiagnostic(throwsInReturnPosition, ThrowsInReturnPositionDiagnostic())
        markNodesAsHandled(unexpectedBeforeReturnType.id, throwsInReturnPosition.id)
        return .visitChildren
      }
    }
    return .visitChildren
  }
}

