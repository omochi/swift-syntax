//===------------------------ Modifiers.swift -----------------------------===//
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

@_spi(RawSyntax) import SwiftSyntax

extension Parser {
  enum DeclModifier: SyntaxText {
    case unowned = "unowned"

    case final = "final"
    case required = "required"
    case optional = "optional"
    case lazy = "lazy"
    case dynamic = "dynamic"
    case infix = "infix"
    case prefix = "prefix"
    case postfix = "postfix"
    case compilerInitialized = "_compilerInitialized"
    case consuming = "__consuming"
    case mutating = "mutating"
    case nonmutating = "nonmutating"
    case convenience = "convenience"
    case override = "override"
    case open = "open"
    case weak = "weak"
    case indirect = "indirect"
    case isolated = "isolated"
    case async = "async"
    case nonisolated = "nonisolated"
    case distributed = "distributed"
    case const = "_const"
    case local = "_local"
  }

  @_spi(RawSyntax)
  public mutating func parseModifierList() -> RawModifierListSyntax? {
    var elements = [RawDeclModifierSyntax]()
    var modifierLoopCondition = LoopProgressCondition()
    MODIFIER_LOOP: while modifierLoopCondition.evaluate(currentToken) {
      switch self.currentToken.tokenKind {
      case .privateKeyword, .fileprivateKeyword, .internalKeyword, .publicKeyword:
        elements.append(self.parseAccessLevelModifier())
      case .staticKeyword:
        let staticKeyword = self.eat(.staticKeyword)
        elements.append(RawDeclModifierSyntax(
          name: staticKeyword, detail: nil, arena: self.arena))
      case .classKeyword:
        // If 'class' is a modifier on another decl kind, like var or func,
        // then treat it as a modifier.
        do {
          var lookahead = self.lookahead()
          lookahead.eat(.classKeyword)
          // When followed by an 'override' or CC token inside a class,
          // treat 'class' as a modifier in the case of a following CC
          // token, we cannot be sure there is no intention to override
          // or witness something static.
          guard lookahead.isStartOfDeclaration() || lookahead.currentToken.isContextualKeyword("override") else {
            // This 'class' is a real ClassDecl introducer.
            break MODIFIER_LOOP
          }
        }
        let classKeyword = self.eat(.classKeyword)
        elements.append(RawDeclModifierSyntax(
          name: classKeyword, detail: nil, arena: self.arena))
        continue
      case .identifier:
        // Context sensitive keywords.
        // FIXME: Sink this into the GYB
        switch DeclModifier(rawValue: self.currentToken.tokenText) {
        case .unowned:
          elements.append(self.parseUnownedModifier())
        case .final,
            .required,
            .optional,
            .lazy,
            .dynamic,
            .infix,
            .prefix,
            .postfix,
            .compilerInitialized,
            .consuming,
            .mutating,
            .nonmutating,
            .convenience,
            .override,
            .open,
            .weak,
            .indirect,
            .isolated,
            .async,
            .nonisolated,
            .distributed,
            .const,
            .local:
          elements.append(self.parseSimpleModifier())
        default:
          break MODIFIER_LOOP
        }

      default:
        break MODIFIER_LOOP
      }
    }
    return elements.isEmpty ? nil : RawModifierListSyntax(elements: elements, arena: arena)
  }
}

extension Parser {
  mutating func parseSimpleModifier() -> RawDeclModifierSyntax {
    let keyword = self.consume(remapping: .contextualKeyword)
    return RawDeclModifierSyntax(name: keyword, detail: nil, arena: self.arena)
  }

  mutating func parseModifierDetail() -> RawDeclModifierDetailSyntax {
    let leftParen = self.eat(.leftParen)
    let detailToken = self.consumeAnyToken()
    let rightParen = self.eat(.rightParen)
    return RawDeclModifierDetailSyntax(
      leftParen: leftParen, detail: detailToken, rightParen: rightParen,
      arena: self.arena)
  }

  mutating func parseSingleArgumentModifier() -> RawDeclModifierSyntax {
    let keyword = self.consume(remapping: .contextualKeyword)
    let detail = self.parseModifierDetail()
    return RawDeclModifierSyntax(name: keyword, detail: detail, arena: self.arena)
  }

  mutating func parseUnownedModifier() -> RawDeclModifierSyntax {
    assert(self.currentToken.tokenText == "unowned")
    let keyword = self.consume(remapping: .contextualKeyword)

    let detail: RawDeclModifierDetailSyntax?
    if self.at(.leftParen) {
      detail = self.parseModifierDetail()
    } else {
      detail = nil
    }

    return RawDeclModifierSyntax(name: keyword, detail: detail, arena: self.arena)
  }

  mutating func parseAccessLevelModifier() -> RawDeclModifierSyntax {
    assert(
      [
        RawTokenKind.privateKeyword,
        .fileprivateKeyword,
        .internalKeyword,
        .publicKeyword
      ].contains(self.currentToken.tokenKind)
    )
    let name = self.consumeAnyToken()
    let details: RawDeclModifierDetailSyntax?
    if let lparen = self.consume(if: .leftParen) {
      var beforeDetail: [RawSyntax] = []
      var detail: RawTokenSyntax? = nil
      var afterDetail: [RawSyntax] = []

      let (content, rightParen) = expect(.rightParen)
      if let content = content {
        for element in content.elements {
          if let _ = detail {
            afterDetail.append(element)
          } else if let token = element.as(RawTokenSyntax.self),
                    [RawTokenKind.identifier, .contextualKeyword].contains(token.tokenKind),
                    token.tokenText == "set"
          {
            detail = token
          } else {
            beforeDetail.append(element)
          }
        }
      }
      
      details = RawDeclModifierDetailSyntax(
        leftParen: lparen,
        beforeDetail.isEmpty ? nil :
          RawUnexpectedNodesSyntax(
            elements: beforeDetail, arena: arena
          ),
        detail: detail ?? RawTokenSyntax(
          missing: .contextualKeyword,
          text: arena.intern("set"),
          arena: arena
        ),
        afterDetail.isEmpty ? nil :
          RawUnexpectedNodesSyntax(
            elements: afterDetail, arena: arena
          ),
        rightParen: rightParen,
        arena: self.arena
      )
    } else {
      details = nil
    }
    return RawDeclModifierSyntax(
      name: name, detail: details, arena: self.arena
    )
  }
}
