//// Automatically Generated From SyntaxNodes.swift.gyb.
//// Do Not Edit Directly!
//===------------ SyntaxNodes.swift - Syntax Node definitions -------------===//
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


// MARK: - MissingSyntax

public struct MissingSyntax: SyntaxProtocol, SyntaxHashable {

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `MissingSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .missing else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `MissingSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .missing)
    self._syntaxNode = Syntax(data)
  }

  public init(
  ) {
    let layout: [RawSyntax?] = [
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.missing,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }
}

extension MissingSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
    ])
  }
}

// MARK: - CodeBlockItemSyntax

/// 
/// A CodeBlockItem is any Syntax node that appears on its own line inside
/// a CodeBlock.
/// 
public struct CodeBlockItemSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeItem
    case item
    case unexpectedBetweenItemAndSemicolon
    case semicolon
    case unexpectedBetweenSemicolonAndErrorTokens
    case errorTokens
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CodeBlockItemSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .codeBlockItem else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CodeBlockItemSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .codeBlockItem)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeItem: UnexpectedNodesSyntax? = nil,
    item: Syntax,
    _ unexpectedBetweenItemAndSemicolon: UnexpectedNodesSyntax? = nil,
    semicolon: TokenSyntax?,
    _ unexpectedBetweenSemicolonAndErrorTokens: UnexpectedNodesSyntax? = nil,
    errorTokens: Syntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeItem?.raw,
      item.raw,
      unexpectedBetweenItemAndSemicolon?.raw,
      semicolon?.raw,
      unexpectedBetweenSemicolonAndErrorTokens?.raw,
      errorTokens?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.codeBlockItem,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeItem: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeItem,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeItem(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeItem` replaced.
  /// - param newChild: The new `unexpectedBeforeItem` to replace the node's
  ///                   current `unexpectedBeforeItem`, if present.
  public func withUnexpectedBeforeItem(
    _ newChild: UnexpectedNodesSyntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeItem)
    return CodeBlockItemSyntax(newData)
  }

  /// The underlying node inside the code block.
  public var item: Syntax {
    get {
      let childData = data.child(at: Cursor.item,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withItem(value)
    }
  }

  /// Returns a copy of the receiver with its `item` replaced.
  /// - param newChild: The new `item` to replace the node's
  ///                   current `item`, if present.
  public func withItem(
    _ newChild: Syntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.item)
    return CodeBlockItemSyntax(newData)
  }

  public var unexpectedBetweenItemAndSemicolon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenItemAndSemicolon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenItemAndSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenItemAndSemicolon` replaced.
  /// - param newChild: The new `unexpectedBetweenItemAndSemicolon` to replace the node's
  ///                   current `unexpectedBetweenItemAndSemicolon`, if present.
  public func withUnexpectedBetweenItemAndSemicolon(
    _ newChild: UnexpectedNodesSyntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenItemAndSemicolon)
    return CodeBlockItemSyntax(newData)
  }

  /// 
  /// If present, the trailing semicolon at the end of the item.
  /// 
  public var semicolon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.semicolon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `semicolon` replaced.
  /// - param newChild: The new `semicolon` to replace the node's
  ///                   current `semicolon`, if present.
  public func withSemicolon(
    _ newChild: TokenSyntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.semicolon)
    return CodeBlockItemSyntax(newData)
  }

  public var unexpectedBetweenSemicolonAndErrorTokens: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenSemicolonAndErrorTokens,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenSemicolonAndErrorTokens(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenSemicolonAndErrorTokens` replaced.
  /// - param newChild: The new `unexpectedBetweenSemicolonAndErrorTokens` to replace the node's
  ///                   current `unexpectedBetweenSemicolonAndErrorTokens`, if present.
  public func withUnexpectedBetweenSemicolonAndErrorTokens(
    _ newChild: UnexpectedNodesSyntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenSemicolonAndErrorTokens)
    return CodeBlockItemSyntax(newData)
  }

  public var errorTokens: Syntax? {
    get {
      let childData = data.child(at: Cursor.errorTokens,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return Syntax(childData!)
    }
    set(value) {
      self = withErrorTokens(value)
    }
  }

  /// Returns a copy of the receiver with its `errorTokens` replaced.
  /// - param newChild: The new `errorTokens` to replace the node's
  ///                   current `errorTokens`, if present.
  public func withErrorTokens(
    _ newChild: Syntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.errorTokens)
    return CodeBlockItemSyntax(newData)
  }
}

extension CodeBlockItemSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeItem": unexpectedBeforeItem.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "item": Syntax(item).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenItemAndSemicolon": unexpectedBetweenItemAndSemicolon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "semicolon": semicolon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenSemicolonAndErrorTokens": unexpectedBetweenSemicolonAndErrorTokens.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "errorTokens": errorTokens.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - CodeBlockSyntax

public struct CodeBlockSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftBrace
    case leftBrace
    case unexpectedBetweenLeftBraceAndStatements
    case statements
    case unexpectedBetweenStatementsAndRightBrace
    case rightBrace
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CodeBlockSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .codeBlock else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CodeBlockSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .codeBlock)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftBrace: UnexpectedNodesSyntax? = nil,
    leftBrace: TokenSyntax,
    _ unexpectedBetweenLeftBraceAndStatements: UnexpectedNodesSyntax? = nil,
    statements: CodeBlockItemListSyntax,
    _ unexpectedBetweenStatementsAndRightBrace: UnexpectedNodesSyntax? = nil,
    rightBrace: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftBrace?.raw,
      leftBrace.raw,
      unexpectedBetweenLeftBraceAndStatements?.raw,
      statements.raw,
      unexpectedBetweenStatementsAndRightBrace?.raw,
      rightBrace.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.codeBlock,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftBrace: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftBrace` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftBrace` to replace the node's
  ///                   current `unexpectedBeforeLeftBrace`, if present.
  public func withUnexpectedBeforeLeftBrace(
    _ newChild: UnexpectedNodesSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftBrace)
    return CodeBlockSyntax(newData)
  }

  public var leftBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(
    _ newChild: TokenSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftBrace, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftBrace)
    return CodeBlockSyntax(newData)
  }

  public var unexpectedBetweenLeftBraceAndStatements: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftBraceAndStatements,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftBraceAndStatements(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftBraceAndStatements` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftBraceAndStatements` to replace the node's
  ///                   current `unexpectedBetweenLeftBraceAndStatements`, if present.
  public func withUnexpectedBetweenLeftBraceAndStatements(
    _ newChild: UnexpectedNodesSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftBraceAndStatements)
    return CodeBlockSyntax(newData)
  }

  public var statements: CodeBlockItemListSyntax {
    get {
      let childData = data.child(at: Cursor.statements,
                                 parent: Syntax(self))
      return CodeBlockItemListSyntax(childData!)
    }
    set(value) {
      self = withStatements(value)
    }
  }

  /// Adds the provided `Statement` to the node's `statements`
  /// collection.
  /// - param element: The new `Statement` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `Statement`
  ///            appended to its `statements` collection.
  public func addStatement(_ element: CodeBlockItemSyntax) -> CodeBlockSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.statements] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.codeBlockItemList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.statements)
    return CodeBlockSyntax(newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.codeBlockItemList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.statements)
    return CodeBlockSyntax(newData)
  }

  public var unexpectedBetweenStatementsAndRightBrace: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenStatementsAndRightBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenStatementsAndRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenStatementsAndRightBrace` replaced.
  /// - param newChild: The new `unexpectedBetweenStatementsAndRightBrace` to replace the node's
  ///                   current `unexpectedBetweenStatementsAndRightBrace`, if present.
  public func withUnexpectedBetweenStatementsAndRightBrace(
    _ newChild: UnexpectedNodesSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenStatementsAndRightBrace)
    return CodeBlockSyntax(newData)
  }

  public var rightBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(
    _ newChild: TokenSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightBrace, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightBrace)
    return CodeBlockSyntax(newData)
  }
}

extension CodeBlockSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftBrace": unexpectedBeforeLeftBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftBrace": Syntax(leftBrace).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftBraceAndStatements": unexpectedBetweenLeftBraceAndStatements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "statements": Syntax(statements).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenStatementsAndRightBrace": unexpectedBetweenStatementsAndRightBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightBrace": Syntax(rightBrace).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DeclNameArgumentSyntax

public struct DeclNameArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeName
    case name
    case unexpectedBetweenNameAndColon
    case colon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DeclNameArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .declNameArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DeclNameArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .declNameArgument)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeName?.raw,
      name.raw,
      unexpectedBetweenNameAndColon?.raw,
      colon.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.declNameArgument,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeName` replaced.
  /// - param newChild: The new `unexpectedBeforeName` to replace the node's
  ///                   current `unexpectedBeforeName`, if present.
  public func withUnexpectedBeforeName(
    _ newChild: UnexpectedNodesSyntax?) -> DeclNameArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeName)
    return DeclNameArgumentSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> DeclNameArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.unknown(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return DeclNameArgumentSyntax(newData)
  }

  public var unexpectedBetweenNameAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndColon` to replace the node's
  ///                   current `unexpectedBetweenNameAndColon`, if present.
  public func withUnexpectedBetweenNameAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> DeclNameArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndColon)
    return DeclNameArgumentSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> DeclNameArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return DeclNameArgumentSyntax(newData)
  }
}

extension DeclNameArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeName": unexpectedBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndColon": unexpectedBetweenNameAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DeclNameArgumentsSyntax

public struct DeclNameArgumentsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndArguments
    case arguments
    case unexpectedBetweenArgumentsAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DeclNameArgumentsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .declNameArguments else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DeclNameArgumentsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .declNameArguments)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax,
    _ unexpectedBetweenLeftParenAndArguments: UnexpectedNodesSyntax? = nil,
    arguments: DeclNameArgumentListSyntax,
    _ unexpectedBetweenArgumentsAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftParen?.raw,
      leftParen.raw,
      unexpectedBetweenLeftParenAndArguments?.raw,
      arguments.raw,
      unexpectedBetweenArgumentsAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.declNameArguments,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftParen` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftParen` to replace the node's
  ///                   current `unexpectedBeforeLeftParen`, if present.
  public func withUnexpectedBeforeLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftParen)
    return DeclNameArgumentsSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return DeclNameArgumentsSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndArguments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndArguments` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndArguments` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndArguments`, if present.
  public func withUnexpectedBetweenLeftParenAndArguments(
    _ newChild: UnexpectedNodesSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndArguments)
    return DeclNameArgumentsSyntax(newData)
  }

  public var arguments: DeclNameArgumentListSyntax {
    get {
      let childData = data.child(at: Cursor.arguments,
                                 parent: Syntax(self))
      return DeclNameArgumentListSyntax(childData!)
    }
    set(value) {
      self = withArguments(value)
    }
  }

  /// Adds the provided `Argument` to the node's `arguments`
  /// collection.
  /// - param element: The new `Argument` to add to the node's
  ///                  `arguments` collection.
  /// - returns: A copy of the receiver with the provided `Argument`
  ///            appended to its `arguments` collection.
  public func addArgument(_ element: DeclNameArgumentSyntax) -> DeclNameArgumentsSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.arguments] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.declNameArgumentList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.arguments)
    return DeclNameArgumentsSyntax(newData)
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: DeclNameArgumentListSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.declNameArgumentList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.arguments)
    return DeclNameArgumentsSyntax(newData)
  }

  public var unexpectedBetweenArgumentsAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenArgumentsAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenArgumentsAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenArgumentsAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenArgumentsAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenArgumentsAndRightParen`, if present.
  public func withUnexpectedBetweenArgumentsAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenArgumentsAndRightParen)
    return DeclNameArgumentsSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return DeclNameArgumentsSyntax(newData)
  }
}

extension DeclNameArgumentsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftParen": unexpectedBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndArguments": unexpectedBetweenLeftParenAndArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arguments": Syntax(arguments).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenArgumentsAndRightParen": unexpectedBetweenArgumentsAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - TupleExprElementSyntax

public struct TupleExprElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLabel
    case label
    case unexpectedBetweenLabelAndColon
    case colon
    case unexpectedBetweenColonAndExpression
    case expression
    case unexpectedBetweenExpressionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TupleExprElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .tupleExprElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TupleExprElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tupleExprElement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLabel: UnexpectedNodesSyntax? = nil,
    label: TokenSyntax?,
    _ unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax?,
    _ unexpectedBetweenColonAndExpression: UnexpectedNodesSyntax? = nil,
    expression: ExprSyntax,
    _ unexpectedBetweenExpressionAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLabel?.raw,
      label?.raw,
      unexpectedBetweenLabelAndColon?.raw,
      colon?.raw,
      unexpectedBetweenColonAndExpression?.raw,
      expression.raw,
      unexpectedBetweenExpressionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.tupleExprElement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLabel` replaced.
  /// - param newChild: The new `unexpectedBeforeLabel` to replace the node's
  ///                   current `unexpectedBeforeLabel`, if present.
  public func withUnexpectedBeforeLabel(
    _ newChild: UnexpectedNodesSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLabel)
    return TupleExprElementSyntax(newData)
  }

  public var label: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.label)
    return TupleExprElementSyntax(newData)
  }

  public var unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLabelAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenLabelAndColon` to replace the node's
  ///                   current `unexpectedBetweenLabelAndColon`, if present.
  public func withUnexpectedBetweenLabelAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLabelAndColon)
    return TupleExprElementSyntax(newData)
  }

  public var colon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return TupleExprElementSyntax(newData)
  }

  public var unexpectedBetweenColonAndExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndExpression,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndExpression` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndExpression` to replace the node's
  ///                   current `unexpectedBetweenColonAndExpression`, if present.
  public func withUnexpectedBetweenColonAndExpression(
    _ newChild: UnexpectedNodesSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndExpression)
    return TupleExprElementSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.expression,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.expression)
    return TupleExprElementSyntax(newData)
  }

  public var unexpectedBetweenExpressionAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenExpressionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenExpressionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenExpressionAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenExpressionAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenExpressionAndTrailingComma`, if present.
  public func withUnexpectedBetweenExpressionAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenExpressionAndTrailingComma)
    return TupleExprElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> TupleExprElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return TupleExprElementSyntax(newData)
  }
}

extension TupleExprElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLabel": unexpectedBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": label.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenLabelAndColon": unexpectedBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": colon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenColonAndExpression": unexpectedBetweenColonAndExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExpressionAndTrailingComma": unexpectedBetweenExpressionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ArrayElementSyntax

public struct ArrayElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeExpression
    case expression
    case unexpectedBetweenExpressionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ArrayElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .arrayElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ArrayElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .arrayElement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeExpression: UnexpectedNodesSyntax? = nil,
    expression: ExprSyntax,
    _ unexpectedBetweenExpressionAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeExpression?.raw,
      expression.raw,
      unexpectedBetweenExpressionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.arrayElement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeExpression,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeExpression` replaced.
  /// - param newChild: The new `unexpectedBeforeExpression` to replace the node's
  ///                   current `unexpectedBeforeExpression`, if present.
  public func withUnexpectedBeforeExpression(
    _ newChild: UnexpectedNodesSyntax?) -> ArrayElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeExpression)
    return ArrayElementSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.expression,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ArrayElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.expression)
    return ArrayElementSyntax(newData)
  }

  public var unexpectedBetweenExpressionAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenExpressionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenExpressionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenExpressionAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenExpressionAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenExpressionAndTrailingComma`, if present.
  public func withUnexpectedBetweenExpressionAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> ArrayElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenExpressionAndTrailingComma)
    return ArrayElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ArrayElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return ArrayElementSyntax(newData)
  }
}

extension ArrayElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeExpression": unexpectedBeforeExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExpressionAndTrailingComma": unexpectedBetweenExpressionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DictionaryElementSyntax

public struct DictionaryElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeKeyExpression
    case keyExpression
    case unexpectedBetweenKeyExpressionAndColon
    case colon
    case unexpectedBetweenColonAndValueExpression
    case valueExpression
    case unexpectedBetweenValueExpressionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DictionaryElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .dictionaryElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DictionaryElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .dictionaryElement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeKeyExpression: UnexpectedNodesSyntax? = nil,
    keyExpression: ExprSyntax,
    _ unexpectedBetweenKeyExpressionAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndValueExpression: UnexpectedNodesSyntax? = nil,
    valueExpression: ExprSyntax,
    _ unexpectedBetweenValueExpressionAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeKeyExpression?.raw,
      keyExpression.raw,
      unexpectedBetweenKeyExpressionAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndValueExpression?.raw,
      valueExpression.raw,
      unexpectedBetweenValueExpressionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.dictionaryElement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeKeyExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeKeyExpression,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeKeyExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeKeyExpression` replaced.
  /// - param newChild: The new `unexpectedBeforeKeyExpression` to replace the node's
  ///                   current `unexpectedBeforeKeyExpression`, if present.
  public func withUnexpectedBeforeKeyExpression(
    _ newChild: UnexpectedNodesSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeKeyExpression)
    return DictionaryElementSyntax(newData)
  }

  public var keyExpression: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.keyExpression,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withKeyExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `keyExpression` replaced.
  /// - param newChild: The new `keyExpression` to replace the node's
  ///                   current `keyExpression`, if present.
  public func withKeyExpression(
    _ newChild: ExprSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.keyExpression)
    return DictionaryElementSyntax(newData)
  }

  public var unexpectedBetweenKeyExpressionAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenKeyExpressionAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenKeyExpressionAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenKeyExpressionAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenKeyExpressionAndColon` to replace the node's
  ///                   current `unexpectedBetweenKeyExpressionAndColon`, if present.
  public func withUnexpectedBetweenKeyExpressionAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenKeyExpressionAndColon)
    return DictionaryElementSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return DictionaryElementSyntax(newData)
  }

  public var unexpectedBetweenColonAndValueExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndValueExpression,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndValueExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndValueExpression` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndValueExpression` to replace the node's
  ///                   current `unexpectedBetweenColonAndValueExpression`, if present.
  public func withUnexpectedBetweenColonAndValueExpression(
    _ newChild: UnexpectedNodesSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndValueExpression)
    return DictionaryElementSyntax(newData)
  }

  public var valueExpression: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.valueExpression,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withValueExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `valueExpression` replaced.
  /// - param newChild: The new `valueExpression` to replace the node's
  ///                   current `valueExpression`, if present.
  public func withValueExpression(
    _ newChild: ExprSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.valueExpression)
    return DictionaryElementSyntax(newData)
  }

  public var unexpectedBetweenValueExpressionAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenValueExpressionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenValueExpressionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenValueExpressionAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenValueExpressionAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenValueExpressionAndTrailingComma`, if present.
  public func withUnexpectedBetweenValueExpressionAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenValueExpressionAndTrailingComma)
    return DictionaryElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return DictionaryElementSyntax(newData)
  }
}

extension DictionaryElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeKeyExpression": unexpectedBeforeKeyExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "keyExpression": Syntax(keyExpression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenKeyExpressionAndColon": unexpectedBetweenKeyExpressionAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndValueExpression": unexpectedBetweenColonAndValueExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "valueExpression": Syntax(valueExpression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenValueExpressionAndTrailingComma": unexpectedBetweenValueExpressionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ClosureCaptureItemSyntax

public struct ClosureCaptureItemSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeSpecifier
    case specifier
    case unexpectedBetweenSpecifierAndName
    case name
    case unexpectedBetweenNameAndAssignToken
    case assignToken
    case unexpectedBetweenAssignTokenAndExpression
    case expression
    case unexpectedBetweenExpressionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ClosureCaptureItemSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .closureCaptureItem else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ClosureCaptureItemSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .closureCaptureItem)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeSpecifier: UnexpectedNodesSyntax? = nil,
    specifier: TokenListSyntax?,
    _ unexpectedBetweenSpecifierAndName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax?,
    _ unexpectedBetweenNameAndAssignToken: UnexpectedNodesSyntax? = nil,
    assignToken: TokenSyntax?,
    _ unexpectedBetweenAssignTokenAndExpression: UnexpectedNodesSyntax? = nil,
    expression: ExprSyntax,
    _ unexpectedBetweenExpressionAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeSpecifier?.raw,
      specifier?.raw,
      unexpectedBetweenSpecifierAndName?.raw,
      name?.raw,
      unexpectedBetweenNameAndAssignToken?.raw,
      assignToken?.raw,
      unexpectedBetweenAssignTokenAndExpression?.raw,
      expression.raw,
      unexpectedBetweenExpressionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.closureCaptureItem,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeSpecifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeSpecifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeSpecifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeSpecifier` replaced.
  /// - param newChild: The new `unexpectedBeforeSpecifier` to replace the node's
  ///                   current `unexpectedBeforeSpecifier`, if present.
  public func withUnexpectedBeforeSpecifier(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeSpecifier)
    return ClosureCaptureItemSyntax(newData)
  }

  public var specifier: TokenListSyntax? {
    get {
      let childData = data.child(at: Cursor.specifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenListSyntax(childData!)
    }
    set(value) {
      self = withSpecifier(value)
    }
  }

  /// Adds the provided `SpecifierToken` to the node's `specifier`
  /// collection.
  /// - param element: The new `SpecifierToken` to add to the node's
  ///                  `specifier` collection.
  /// - returns: A copy of the receiver with the provided `SpecifierToken`
  ///            appended to its `specifier` collection.
  public func addSpecifierToken(_ element: TokenSyntax) -> ClosureCaptureItemSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.specifier] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tokenList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.specifier)
    return ClosureCaptureItemSyntax(newData)
  }

  /// Returns a copy of the receiver with its `specifier` replaced.
  /// - param newChild: The new `specifier` to replace the node's
  ///                   current `specifier`, if present.
  public func withSpecifier(
    _ newChild: TokenListSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.specifier)
    return ClosureCaptureItemSyntax(newData)
  }

  public var unexpectedBetweenSpecifierAndName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenSpecifierAndName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenSpecifierAndName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenSpecifierAndName` replaced.
  /// - param newChild: The new `unexpectedBetweenSpecifierAndName` to replace the node's
  ///                   current `unexpectedBetweenSpecifierAndName`, if present.
  public func withUnexpectedBetweenSpecifierAndName(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenSpecifierAndName)
    return ClosureCaptureItemSyntax(newData)
  }

  public var name: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.name)
    return ClosureCaptureItemSyntax(newData)
  }

  public var unexpectedBetweenNameAndAssignToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndAssignToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndAssignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndAssignToken` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndAssignToken` to replace the node's
  ///                   current `unexpectedBetweenNameAndAssignToken`, if present.
  public func withUnexpectedBetweenNameAndAssignToken(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndAssignToken)
    return ClosureCaptureItemSyntax(newData)
  }

  public var assignToken: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.assignToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAssignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `assignToken` replaced.
  /// - param newChild: The new `assignToken` to replace the node's
  ///                   current `assignToken`, if present.
  public func withAssignToken(
    _ newChild: TokenSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.assignToken)
    return ClosureCaptureItemSyntax(newData)
  }

  public var unexpectedBetweenAssignTokenAndExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAssignTokenAndExpression,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAssignTokenAndExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAssignTokenAndExpression` replaced.
  /// - param newChild: The new `unexpectedBetweenAssignTokenAndExpression` to replace the node's
  ///                   current `unexpectedBetweenAssignTokenAndExpression`, if present.
  public func withUnexpectedBetweenAssignTokenAndExpression(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAssignTokenAndExpression)
    return ClosureCaptureItemSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.expression,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.expression)
    return ClosureCaptureItemSyntax(newData)
  }

  public var unexpectedBetweenExpressionAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenExpressionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenExpressionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenExpressionAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenExpressionAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenExpressionAndTrailingComma`, if present.
  public func withUnexpectedBetweenExpressionAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenExpressionAndTrailingComma)
    return ClosureCaptureItemSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return ClosureCaptureItemSyntax(newData)
  }
}

extension ClosureCaptureItemSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeSpecifier": unexpectedBeforeSpecifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "specifier": specifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenSpecifierAndName": unexpectedBetweenSpecifierAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": name.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenNameAndAssignToken": unexpectedBetweenNameAndAssignToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "assignToken": assignToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAssignTokenAndExpression": unexpectedBetweenAssignTokenAndExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExpressionAndTrailingComma": unexpectedBetweenExpressionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ClosureCaptureSignatureSyntax

public struct ClosureCaptureSignatureSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftSquare
    case leftSquare
    case unexpectedBetweenLeftSquareAndItems
    case items
    case unexpectedBetweenItemsAndRightSquare
    case rightSquare
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ClosureCaptureSignatureSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .closureCaptureSignature else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ClosureCaptureSignatureSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .closureCaptureSignature)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftSquare: UnexpectedNodesSyntax? = nil,
    leftSquare: TokenSyntax,
    _ unexpectedBetweenLeftSquareAndItems: UnexpectedNodesSyntax? = nil,
    items: ClosureCaptureItemListSyntax?,
    _ unexpectedBetweenItemsAndRightSquare: UnexpectedNodesSyntax? = nil,
    rightSquare: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftSquare?.raw,
      leftSquare.raw,
      unexpectedBetweenLeftSquareAndItems?.raw,
      items?.raw,
      unexpectedBetweenItemsAndRightSquare?.raw,
      rightSquare.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.closureCaptureSignature,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftSquare: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftSquare,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftSquare` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftSquare` to replace the node's
  ///                   current `unexpectedBeforeLeftSquare`, if present.
  public func withUnexpectedBeforeLeftSquare(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftSquare)
    return ClosureCaptureSignatureSyntax(newData)
  }

  public var leftSquare: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftSquare,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `leftSquare` replaced.
  /// - param newChild: The new `leftSquare` to replace the node's
  ///                   current `leftSquare`, if present.
  public func withLeftSquare(
    _ newChild: TokenSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftSquareBracket, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftSquare)
    return ClosureCaptureSignatureSyntax(newData)
  }

  public var unexpectedBetweenLeftSquareAndItems: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftSquareAndItems,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftSquareAndItems(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftSquareAndItems` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftSquareAndItems` to replace the node's
  ///                   current `unexpectedBetweenLeftSquareAndItems`, if present.
  public func withUnexpectedBetweenLeftSquareAndItems(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftSquareAndItems)
    return ClosureCaptureSignatureSyntax(newData)
  }

  public var items: ClosureCaptureItemListSyntax? {
    get {
      let childData = data.child(at: Cursor.items,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ClosureCaptureItemListSyntax(childData!)
    }
    set(value) {
      self = withItems(value)
    }
  }

  /// Adds the provided `Item` to the node's `items`
  /// collection.
  /// - param element: The new `Item` to add to the node's
  ///                  `items` collection.
  /// - returns: A copy of the receiver with the provided `Item`
  ///            appended to its `items` collection.
  public func addItem(_ element: ClosureCaptureItemSyntax) -> ClosureCaptureSignatureSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.items] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.closureCaptureItemList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.items)
    return ClosureCaptureSignatureSyntax(newData)
  }

  /// Returns a copy of the receiver with its `items` replaced.
  /// - param newChild: The new `items` to replace the node's
  ///                   current `items`, if present.
  public func withItems(
    _ newChild: ClosureCaptureItemListSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.items)
    return ClosureCaptureSignatureSyntax(newData)
  }

  public var unexpectedBetweenItemsAndRightSquare: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenItemsAndRightSquare,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenItemsAndRightSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenItemsAndRightSquare` replaced.
  /// - param newChild: The new `unexpectedBetweenItemsAndRightSquare` to replace the node's
  ///                   current `unexpectedBetweenItemsAndRightSquare`, if present.
  public func withUnexpectedBetweenItemsAndRightSquare(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenItemsAndRightSquare)
    return ClosureCaptureSignatureSyntax(newData)
  }

  public var rightSquare: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightSquare,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `rightSquare` replaced.
  /// - param newChild: The new `rightSquare` to replace the node's
  ///                   current `rightSquare`, if present.
  public func withRightSquare(
    _ newChild: TokenSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightSquareBracket, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightSquare)
    return ClosureCaptureSignatureSyntax(newData)
  }
}

extension ClosureCaptureSignatureSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftSquare": unexpectedBeforeLeftSquare.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftSquare": Syntax(leftSquare).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftSquareAndItems": unexpectedBetweenLeftSquareAndItems.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "items": items.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenItemsAndRightSquare": unexpectedBetweenItemsAndRightSquare.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightSquare": Syntax(rightSquare).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ClosureParamSyntax

public struct ClosureParamSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeName
    case name
    case unexpectedBetweenNameAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ClosureParamSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .closureParam else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ClosureParamSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .closureParam)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeName?.raw,
      name.raw,
      unexpectedBetweenNameAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.closureParam,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeName` replaced.
  /// - param newChild: The new `unexpectedBeforeName` to replace the node's
  ///                   current `unexpectedBeforeName`, if present.
  public func withUnexpectedBeforeName(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeName)
    return ClosureParamSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ClosureParamSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return ClosureParamSyntax(newData)
  }

  public var unexpectedBetweenNameAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenNameAndTrailingComma`, if present.
  public func withUnexpectedBetweenNameAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndTrailingComma)
    return ClosureParamSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ClosureParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return ClosureParamSyntax(newData)
  }
}

extension ClosureParamSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeName": unexpectedBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndTrailingComma": unexpectedBetweenNameAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ClosureSignatureSyntax

public struct ClosureSignatureSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeAttributes
    case attributes
    case unexpectedBetweenAttributesAndCapture
    case capture
    case unexpectedBetweenCaptureAndInput
    case input
    case unexpectedBetweenInputAndAsyncKeyword
    case asyncKeyword
    case unexpectedBetweenAsyncKeywordAndThrowsTok
    case throwsTok
    case unexpectedBetweenThrowsTokAndOutput
    case output
    case unexpectedBetweenOutputAndInTok
    case inTok
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ClosureSignatureSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .closureSignature else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ClosureSignatureSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .closureSignature)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax?,
    _ unexpectedBetweenAttributesAndCapture: UnexpectedNodesSyntax? = nil,
    capture: ClosureCaptureSignatureSyntax?,
    _ unexpectedBetweenCaptureAndInput: UnexpectedNodesSyntax? = nil,
    input: Syntax?,
    _ unexpectedBetweenInputAndAsyncKeyword: UnexpectedNodesSyntax? = nil,
    asyncKeyword: TokenSyntax?,
    _ unexpectedBetweenAsyncKeywordAndThrowsTok: UnexpectedNodesSyntax? = nil,
    throwsTok: TokenSyntax?,
    _ unexpectedBetweenThrowsTokAndOutput: UnexpectedNodesSyntax? = nil,
    output: ReturnClauseSyntax?,
    _ unexpectedBetweenOutputAndInTok: UnexpectedNodesSyntax? = nil,
    inTok: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAttributes?.raw,
      attributes?.raw,
      unexpectedBetweenAttributesAndCapture?.raw,
      capture?.raw,
      unexpectedBetweenCaptureAndInput?.raw,
      input?.raw,
      unexpectedBetweenInputAndAsyncKeyword?.raw,
      asyncKeyword?.raw,
      unexpectedBetweenAsyncKeywordAndThrowsTok?.raw,
      throwsTok?.raw,
      unexpectedBetweenThrowsTokAndOutput?.raw,
      output?.raw,
      unexpectedBetweenOutputAndInTok?.raw,
      inTok.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.closureSignature,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeAttributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAttributes(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAttributes` replaced.
  /// - param newChild: The new `unexpectedBeforeAttributes` to replace the node's
  ///                   current `unexpectedBeforeAttributes`, if present.
  public func withUnexpectedBeforeAttributes(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeAttributes)
    return ClosureSignatureSyntax(newData)
  }

  public var attributes: AttributeListSyntax? {
    get {
      let childData = data.child(at: Cursor.attributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return AttributeListSyntax(childData!)
    }
    set(value) {
      self = withAttributes(value)
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> ClosureSignatureSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.attributes] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.attributes)
    return ClosureSignatureSyntax(newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.attributes)
    return ClosureSignatureSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndCapture: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAttributesAndCapture,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAttributesAndCapture(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAttributesAndCapture` replaced.
  /// - param newChild: The new `unexpectedBetweenAttributesAndCapture` to replace the node's
  ///                   current `unexpectedBetweenAttributesAndCapture`, if present.
  public func withUnexpectedBetweenAttributesAndCapture(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAttributesAndCapture)
    return ClosureSignatureSyntax(newData)
  }

  public var capture: ClosureCaptureSignatureSyntax? {
    get {
      let childData = data.child(at: Cursor.capture,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ClosureCaptureSignatureSyntax(childData!)
    }
    set(value) {
      self = withCapture(value)
    }
  }

  /// Returns a copy of the receiver with its `capture` replaced.
  /// - param newChild: The new `capture` to replace the node's
  ///                   current `capture`, if present.
  public func withCapture(
    _ newChild: ClosureCaptureSignatureSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.capture)
    return ClosureSignatureSyntax(newData)
  }

  public var unexpectedBetweenCaptureAndInput: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenCaptureAndInput,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCaptureAndInput(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCaptureAndInput` replaced.
  /// - param newChild: The new `unexpectedBetweenCaptureAndInput` to replace the node's
  ///                   current `unexpectedBetweenCaptureAndInput`, if present.
  public func withUnexpectedBetweenCaptureAndInput(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenCaptureAndInput)
    return ClosureSignatureSyntax(newData)
  }

  public var input: Syntax? {
    get {
      let childData = data.child(at: Cursor.input,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return Syntax(childData!)
    }
    set(value) {
      self = withInput(value)
    }
  }

  /// Returns a copy of the receiver with its `input` replaced.
  /// - param newChild: The new `input` to replace the node's
  ///                   current `input`, if present.
  public func withInput(
    _ newChild: Syntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.input)
    return ClosureSignatureSyntax(newData)
  }

  public var unexpectedBetweenInputAndAsyncKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenInputAndAsyncKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenInputAndAsyncKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenInputAndAsyncKeyword` replaced.
  /// - param newChild: The new `unexpectedBetweenInputAndAsyncKeyword` to replace the node's
  ///                   current `unexpectedBetweenInputAndAsyncKeyword`, if present.
  public func withUnexpectedBetweenInputAndAsyncKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenInputAndAsyncKeyword)
    return ClosureSignatureSyntax(newData)
  }

  public var asyncKeyword: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.asyncKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAsyncKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `asyncKeyword` replaced.
  /// - param newChild: The new `asyncKeyword` to replace the node's
  ///                   current `asyncKeyword`, if present.
  public func withAsyncKeyword(
    _ newChild: TokenSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.asyncKeyword)
    return ClosureSignatureSyntax(newData)
  }

  public var unexpectedBetweenAsyncKeywordAndThrowsTok: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAsyncKeywordAndThrowsTok,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAsyncKeywordAndThrowsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAsyncKeywordAndThrowsTok` replaced.
  /// - param newChild: The new `unexpectedBetweenAsyncKeywordAndThrowsTok` to replace the node's
  ///                   current `unexpectedBetweenAsyncKeywordAndThrowsTok`, if present.
  public func withUnexpectedBetweenAsyncKeywordAndThrowsTok(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAsyncKeywordAndThrowsTok)
    return ClosureSignatureSyntax(newData)
  }

  public var throwsTok: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.throwsTok,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withThrowsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `throwsTok` replaced.
  /// - param newChild: The new `throwsTok` to replace the node's
  ///                   current `throwsTok`, if present.
  public func withThrowsTok(
    _ newChild: TokenSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.throwsTok)
    return ClosureSignatureSyntax(newData)
  }

  public var unexpectedBetweenThrowsTokAndOutput: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenThrowsTokAndOutput,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenThrowsTokAndOutput(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenThrowsTokAndOutput` replaced.
  /// - param newChild: The new `unexpectedBetweenThrowsTokAndOutput` to replace the node's
  ///                   current `unexpectedBetweenThrowsTokAndOutput`, if present.
  public func withUnexpectedBetweenThrowsTokAndOutput(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenThrowsTokAndOutput)
    return ClosureSignatureSyntax(newData)
  }

  public var output: ReturnClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.output,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ReturnClauseSyntax(childData!)
    }
    set(value) {
      self = withOutput(value)
    }
  }

  /// Returns a copy of the receiver with its `output` replaced.
  /// - param newChild: The new `output` to replace the node's
  ///                   current `output`, if present.
  public func withOutput(
    _ newChild: ReturnClauseSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.output)
    return ClosureSignatureSyntax(newData)
  }

  public var unexpectedBetweenOutputAndInTok: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenOutputAndInTok,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenOutputAndInTok(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenOutputAndInTok` replaced.
  /// - param newChild: The new `unexpectedBetweenOutputAndInTok` to replace the node's
  ///                   current `unexpectedBetweenOutputAndInTok`, if present.
  public func withUnexpectedBetweenOutputAndInTok(
    _ newChild: UnexpectedNodesSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenOutputAndInTok)
    return ClosureSignatureSyntax(newData)
  }

  public var inTok: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.inTok,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withInTok(value)
    }
  }

  /// Returns a copy of the receiver with its `inTok` replaced.
  /// - param newChild: The new `inTok` to replace the node's
  ///                   current `inTok`, if present.
  public func withInTok(
    _ newChild: TokenSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.inKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.inTok)
    return ClosureSignatureSyntax(newData)
  }
}

extension ClosureSignatureSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndCapture": unexpectedBetweenAttributesAndCapture.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "capture": capture.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenCaptureAndInput": unexpectedBetweenCaptureAndInput.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "input": input.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInputAndAsyncKeyword": unexpectedBetweenInputAndAsyncKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "asyncKeyword": asyncKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAsyncKeywordAndThrowsTok": unexpectedBetweenAsyncKeywordAndThrowsTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "throwsTok": throwsTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenThrowsTokAndOutput": unexpectedBetweenThrowsTokAndOutput.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "output": output.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenOutputAndInTok": unexpectedBetweenOutputAndInTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inTok": Syntax(inTok).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - MultipleTrailingClosureElementSyntax

public struct MultipleTrailingClosureElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLabel
    case label
    case unexpectedBetweenLabelAndColon
    case colon
    case unexpectedBetweenColonAndClosure
    case closure
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `MultipleTrailingClosureElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .multipleTrailingClosureElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `MultipleTrailingClosureElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .multipleTrailingClosureElement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLabel: UnexpectedNodesSyntax? = nil,
    label: TokenSyntax,
    _ unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndClosure: UnexpectedNodesSyntax? = nil,
    closure: ClosureExprSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLabel?.raw,
      label.raw,
      unexpectedBetweenLabelAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndClosure?.raw,
      closure.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.multipleTrailingClosureElement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLabel` replaced.
  /// - param newChild: The new `unexpectedBeforeLabel` to replace the node's
  ///                   current `unexpectedBeforeLabel`, if present.
  public func withUnexpectedBeforeLabel(
    _ newChild: UnexpectedNodesSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLabel)
    return MultipleTrailingClosureElementSyntax(newData)
  }

  public var label: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.label)
    return MultipleTrailingClosureElementSyntax(newData)
  }

  public var unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLabelAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenLabelAndColon` to replace the node's
  ///                   current `unexpectedBetweenLabelAndColon`, if present.
  public func withUnexpectedBetweenLabelAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLabelAndColon)
    return MultipleTrailingClosureElementSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return MultipleTrailingClosureElementSyntax(newData)
  }

  public var unexpectedBetweenColonAndClosure: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndClosure,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndClosure(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndClosure` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndClosure` to replace the node's
  ///                   current `unexpectedBetweenColonAndClosure`, if present.
  public func withUnexpectedBetweenColonAndClosure(
    _ newChild: UnexpectedNodesSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndClosure)
    return MultipleTrailingClosureElementSyntax(newData)
  }

  public var closure: ClosureExprSyntax {
    get {
      let childData = data.child(at: Cursor.closure,
                                 parent: Syntax(self))
      return ClosureExprSyntax(childData!)
    }
    set(value) {
      self = withClosure(value)
    }
  }

  /// Returns a copy of the receiver with its `closure` replaced.
  /// - param newChild: The new `closure` to replace the node's
  ///                   current `closure`, if present.
  public func withClosure(
    _ newChild: ClosureExprSyntax?) -> MultipleTrailingClosureElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.closureExpr, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.closure)
    return MultipleTrailingClosureElementSyntax(newData)
  }
}

extension MultipleTrailingClosureElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLabel": unexpectedBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLabelAndColon": unexpectedBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndClosure": unexpectedBetweenColonAndClosure.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "closure": Syntax(closure).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - StringSegmentSyntax

public struct StringSegmentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeContent
    case content
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `StringSegmentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .stringSegment else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `StringSegmentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .stringSegment)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeContent: UnexpectedNodesSyntax? = nil,
    content: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeContent?.raw,
      content.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.stringSegment,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeContent: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeContent,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeContent(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeContent` replaced.
  /// - param newChild: The new `unexpectedBeforeContent` to replace the node's
  ///                   current `unexpectedBeforeContent`, if present.
  public func withUnexpectedBeforeContent(
    _ newChild: UnexpectedNodesSyntax?) -> StringSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeContent)
    return StringSegmentSyntax(newData)
  }

  public var content: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.content,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withContent(value)
    }
  }

  /// Returns a copy of the receiver with its `content` replaced.
  /// - param newChild: The new `content` to replace the node's
  ///                   current `content`, if present.
  public func withContent(
    _ newChild: TokenSyntax?) -> StringSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.stringSegment(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.content)
    return StringSegmentSyntax(newData)
  }
}

extension StringSegmentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeContent": unexpectedBeforeContent.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "content": Syntax(content).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ExpressionSegmentSyntax

public struct ExpressionSegmentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeBackslash
    case backslash
    case unexpectedBetweenBackslashAndDelimiter
    case delimiter
    case unexpectedBetweenDelimiterAndLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndExpressions
    case expressions
    case unexpectedBetweenExpressionsAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ExpressionSegmentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .expressionSegment else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ExpressionSegmentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .expressionSegment)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeBackslash: UnexpectedNodesSyntax? = nil,
    backslash: TokenSyntax,
    _ unexpectedBetweenBackslashAndDelimiter: UnexpectedNodesSyntax? = nil,
    delimiter: TokenSyntax?,
    _ unexpectedBetweenDelimiterAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax,
    _ unexpectedBetweenLeftParenAndExpressions: UnexpectedNodesSyntax? = nil,
    expressions: TupleExprElementListSyntax,
    _ unexpectedBetweenExpressionsAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeBackslash?.raw,
      backslash.raw,
      unexpectedBetweenBackslashAndDelimiter?.raw,
      delimiter?.raw,
      unexpectedBetweenDelimiterAndLeftParen?.raw,
      leftParen.raw,
      unexpectedBetweenLeftParenAndExpressions?.raw,
      expressions.raw,
      unexpectedBetweenExpressionsAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.expressionSegment,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeBackslash: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeBackslash,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeBackslash(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeBackslash` replaced.
  /// - param newChild: The new `unexpectedBeforeBackslash` to replace the node's
  ///                   current `unexpectedBeforeBackslash`, if present.
  public func withUnexpectedBeforeBackslash(
    _ newChild: UnexpectedNodesSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeBackslash)
    return ExpressionSegmentSyntax(newData)
  }

  public var backslash: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.backslash,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withBackslash(value)
    }
  }

  /// Returns a copy of the receiver with its `backslash` replaced.
  /// - param newChild: The new `backslash` to replace the node's
  ///                   current `backslash`, if present.
  public func withBackslash(
    _ newChild: TokenSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.backslash, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.backslash)
    return ExpressionSegmentSyntax(newData)
  }

  public var unexpectedBetweenBackslashAndDelimiter: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenBackslashAndDelimiter,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenBackslashAndDelimiter(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenBackslashAndDelimiter` replaced.
  /// - param newChild: The new `unexpectedBetweenBackslashAndDelimiter` to replace the node's
  ///                   current `unexpectedBetweenBackslashAndDelimiter`, if present.
  public func withUnexpectedBetweenBackslashAndDelimiter(
    _ newChild: UnexpectedNodesSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenBackslashAndDelimiter)
    return ExpressionSegmentSyntax(newData)
  }

  public var delimiter: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.delimiter,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDelimiter(value)
    }
  }

  /// Returns a copy of the receiver with its `delimiter` replaced.
  /// - param newChild: The new `delimiter` to replace the node's
  ///                   current `delimiter`, if present.
  public func withDelimiter(
    _ newChild: TokenSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.delimiter)
    return ExpressionSegmentSyntax(newData)
  }

  public var unexpectedBetweenDelimiterAndLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDelimiterAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDelimiterAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDelimiterAndLeftParen` replaced.
  /// - param newChild: The new `unexpectedBetweenDelimiterAndLeftParen` to replace the node's
  ///                   current `unexpectedBetweenDelimiterAndLeftParen`, if present.
  public func withUnexpectedBetweenDelimiterAndLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDelimiterAndLeftParen)
    return ExpressionSegmentSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return ExpressionSegmentSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndExpressions: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndExpressions,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndExpressions(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndExpressions` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndExpressions` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndExpressions`, if present.
  public func withUnexpectedBetweenLeftParenAndExpressions(
    _ newChild: UnexpectedNodesSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndExpressions)
    return ExpressionSegmentSyntax(newData)
  }

  public var expressions: TupleExprElementListSyntax {
    get {
      let childData = data.child(at: Cursor.expressions,
                                 parent: Syntax(self))
      return TupleExprElementListSyntax(childData!)
    }
    set(value) {
      self = withExpressions(value)
    }
  }

  /// Adds the provided `Expression` to the node's `expressions`
  /// collection.
  /// - param element: The new `Expression` to add to the node's
  ///                  `expressions` collection.
  /// - returns: A copy of the receiver with the provided `Expression`
  ///            appended to its `expressions` collection.
  public func addExpression(_ element: TupleExprElementSyntax) -> ExpressionSegmentSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.expressions] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tupleExprElementList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.expressions)
    return ExpressionSegmentSyntax(newData)
  }

  /// Returns a copy of the receiver with its `expressions` replaced.
  /// - param newChild: The new `expressions` to replace the node's
  ///                   current `expressions`, if present.
  public func withExpressions(
    _ newChild: TupleExprElementListSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.tupleExprElementList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.expressions)
    return ExpressionSegmentSyntax(newData)
  }

  public var unexpectedBetweenExpressionsAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenExpressionsAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenExpressionsAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenExpressionsAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenExpressionsAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenExpressionsAndRightParen`, if present.
  public func withUnexpectedBetweenExpressionsAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenExpressionsAndRightParen)
    return ExpressionSegmentSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.stringInterpolationAnchor, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return ExpressionSegmentSyntax(newData)
  }
}

extension ExpressionSegmentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeBackslash": unexpectedBeforeBackslash.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "backslash": Syntax(backslash).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenBackslashAndDelimiter": unexpectedBetweenBackslashAndDelimiter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "delimiter": delimiter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenDelimiterAndLeftParen": unexpectedBetweenDelimiterAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndExpressions": unexpectedBetweenLeftParenAndExpressions.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expressions": Syntax(expressions).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExpressionsAndRightParen": unexpectedBetweenExpressionsAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ObjcNamePieceSyntax

public struct ObjcNamePieceSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeName
    case name
    case unexpectedBetweenNameAndDot
    case dot
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ObjcNamePieceSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .objcNamePiece else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ObjcNamePieceSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .objcNamePiece)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndDot: UnexpectedNodesSyntax? = nil,
    dot: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeName?.raw,
      name.raw,
      unexpectedBetweenNameAndDot?.raw,
      dot?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.objcNamePiece,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeName` replaced.
  /// - param newChild: The new `unexpectedBeforeName` to replace the node's
  ///                   current `unexpectedBeforeName`, if present.
  public func withUnexpectedBeforeName(
    _ newChild: UnexpectedNodesSyntax?) -> ObjcNamePieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeName)
    return ObjcNamePieceSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ObjcNamePieceSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return ObjcNamePieceSyntax(newData)
  }

  public var unexpectedBetweenNameAndDot: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndDot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndDot(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndDot` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndDot` to replace the node's
  ///                   current `unexpectedBetweenNameAndDot`, if present.
  public func withUnexpectedBetweenNameAndDot(
    _ newChild: UnexpectedNodesSyntax?) -> ObjcNamePieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndDot)
    return ObjcNamePieceSyntax(newData)
  }

  public var dot: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.dot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDot(value)
    }
  }

  /// Returns a copy of the receiver with its `dot` replaced.
  /// - param newChild: The new `dot` to replace the node's
  ///                   current `dot`, if present.
  public func withDot(
    _ newChild: TokenSyntax?) -> ObjcNamePieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.dot)
    return ObjcNamePieceSyntax(newData)
  }
}

extension ObjcNamePieceSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeName": unexpectedBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndDot": unexpectedBetweenNameAndDot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "dot": dot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TypeInitializerClauseSyntax

public struct TypeInitializerClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeEqual
    case equal
    case unexpectedBetweenEqualAndValue
    case value
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TypeInitializerClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .typeInitializerClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TypeInitializerClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .typeInitializerClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeEqual: UnexpectedNodesSyntax? = nil,
    equal: TokenSyntax,
    _ unexpectedBetweenEqualAndValue: UnexpectedNodesSyntax? = nil,
    value: TypeSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeEqual?.raw,
      equal.raw,
      unexpectedBetweenEqualAndValue?.raw,
      value.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.typeInitializerClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeEqual: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeEqual,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeEqual(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeEqual` replaced.
  /// - param newChild: The new `unexpectedBeforeEqual` to replace the node's
  ///                   current `unexpectedBeforeEqual`, if present.
  public func withUnexpectedBeforeEqual(
    _ newChild: UnexpectedNodesSyntax?) -> TypeInitializerClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeEqual)
    return TypeInitializerClauseSyntax(newData)
  }

  public var equal: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.equal,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEqual(value)
    }
  }

  /// Returns a copy of the receiver with its `equal` replaced.
  /// - param newChild: The new `equal` to replace the node's
  ///                   current `equal`, if present.
  public func withEqual(
    _ newChild: TokenSyntax?) -> TypeInitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.equal, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.equal)
    return TypeInitializerClauseSyntax(newData)
  }

  public var unexpectedBetweenEqualAndValue: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenEqualAndValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenEqualAndValue(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenEqualAndValue` replaced.
  /// - param newChild: The new `unexpectedBetweenEqualAndValue` to replace the node's
  ///                   current `unexpectedBetweenEqualAndValue`, if present.
  public func withUnexpectedBetweenEqualAndValue(
    _ newChild: UnexpectedNodesSyntax?) -> TypeInitializerClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenEqualAndValue)
    return TypeInitializerClauseSyntax(newData)
  }

  public var value: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.value,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withValue(value)
    }
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: TypeSyntax?) -> TypeInitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.value)
    return TypeInitializerClauseSyntax(newData)
  }
}

extension TypeInitializerClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeEqual": unexpectedBeforeEqual.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "equal": Syntax(equal).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenEqualAndValue": unexpectedBetweenEqualAndValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "value": Syntax(value).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ParameterClauseSyntax

public struct ParameterClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndParameterList
    case parameterList
    case unexpectedBetweenParameterListAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ParameterClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .parameterClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ParameterClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .parameterClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax,
    _ unexpectedBetweenLeftParenAndParameterList: UnexpectedNodesSyntax? = nil,
    parameterList: FunctionParameterListSyntax,
    _ unexpectedBetweenParameterListAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftParen?.raw,
      leftParen.raw,
      unexpectedBetweenLeftParenAndParameterList?.raw,
      parameterList.raw,
      unexpectedBetweenParameterListAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.parameterClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftParen` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftParen` to replace the node's
  ///                   current `unexpectedBeforeLeftParen`, if present.
  public func withUnexpectedBeforeLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftParen)
    return ParameterClauseSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return ParameterClauseSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndParameterList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndParameterList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndParameterList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndParameterList` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndParameterList` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndParameterList`, if present.
  public func withUnexpectedBetweenLeftParenAndParameterList(
    _ newChild: UnexpectedNodesSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndParameterList)
    return ParameterClauseSyntax(newData)
  }

  public var parameterList: FunctionParameterListSyntax {
    get {
      let childData = data.child(at: Cursor.parameterList,
                                 parent: Syntax(self))
      return FunctionParameterListSyntax(childData!)
    }
    set(value) {
      self = withParameterList(value)
    }
  }

  /// Adds the provided `Parameter` to the node's `parameterList`
  /// collection.
  /// - param element: The new `Parameter` to add to the node's
  ///                  `parameterList` collection.
  /// - returns: A copy of the receiver with the provided `Parameter`
  ///            appended to its `parameterList` collection.
  public func addParameter(_ element: FunctionParameterSyntax) -> ParameterClauseSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.parameterList] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.functionParameterList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.parameterList)
    return ParameterClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `parameterList` replaced.
  /// - param newChild: The new `parameterList` to replace the node's
  ///                   current `parameterList`, if present.
  public func withParameterList(
    _ newChild: FunctionParameterListSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.functionParameterList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.parameterList)
    return ParameterClauseSyntax(newData)
  }

  public var unexpectedBetweenParameterListAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenParameterListAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenParameterListAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenParameterListAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenParameterListAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenParameterListAndRightParen`, if present.
  public func withUnexpectedBetweenParameterListAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenParameterListAndRightParen)
    return ParameterClauseSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return ParameterClauseSyntax(newData)
  }
}

extension ParameterClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftParen": unexpectedBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndParameterList": unexpectedBetweenLeftParenAndParameterList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "parameterList": Syntax(parameterList).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenParameterListAndRightParen": unexpectedBetweenParameterListAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ReturnClauseSyntax

public struct ReturnClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeArrow
    case arrow
    case unexpectedBetweenArrowAndReturnType
    case returnType
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ReturnClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .returnClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ReturnClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .returnClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeArrow: UnexpectedNodesSyntax? = nil,
    arrow: TokenSyntax,
    _ unexpectedBetweenArrowAndReturnType: UnexpectedNodesSyntax? = nil,
    returnType: TypeSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeArrow?.raw,
      arrow.raw,
      unexpectedBetweenArrowAndReturnType?.raw,
      returnType.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.returnClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeArrow: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeArrow,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeArrow(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeArrow` replaced.
  /// - param newChild: The new `unexpectedBeforeArrow` to replace the node's
  ///                   current `unexpectedBeforeArrow`, if present.
  public func withUnexpectedBeforeArrow(
    _ newChild: UnexpectedNodesSyntax?) -> ReturnClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeArrow)
    return ReturnClauseSyntax(newData)
  }

  public var arrow: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.arrow,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withArrow(value)
    }
  }

  /// Returns a copy of the receiver with its `arrow` replaced.
  /// - param newChild: The new `arrow` to replace the node's
  ///                   current `arrow`, if present.
  public func withArrow(
    _ newChild: TokenSyntax?) -> ReturnClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.arrow, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.arrow)
    return ReturnClauseSyntax(newData)
  }

  public var unexpectedBetweenArrowAndReturnType: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenArrowAndReturnType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenArrowAndReturnType(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenArrowAndReturnType` replaced.
  /// - param newChild: The new `unexpectedBetweenArrowAndReturnType` to replace the node's
  ///                   current `unexpectedBetweenArrowAndReturnType`, if present.
  public func withUnexpectedBetweenArrowAndReturnType(
    _ newChild: UnexpectedNodesSyntax?) -> ReturnClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenArrowAndReturnType)
    return ReturnClauseSyntax(newData)
  }

  public var returnType: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.returnType,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withReturnType(value)
    }
  }

  /// Returns a copy of the receiver with its `returnType` replaced.
  /// - param newChild: The new `returnType` to replace the node's
  ///                   current `returnType`, if present.
  public func withReturnType(
    _ newChild: TypeSyntax?) -> ReturnClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.returnType)
    return ReturnClauseSyntax(newData)
  }
}

extension ReturnClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeArrow": unexpectedBeforeArrow.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arrow": Syntax(arrow).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenArrowAndReturnType": unexpectedBetweenArrowAndReturnType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "returnType": Syntax(returnType).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - FunctionSignatureSyntax

public struct FunctionSignatureSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeInput
    case input
    case unexpectedBetweenInputAndAsyncOrReasyncKeyword
    case asyncOrReasyncKeyword
    case unexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword
    case throwsOrRethrowsKeyword
    case unexpectedBetweenThrowsOrRethrowsKeywordAndOutput
    case output
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `FunctionSignatureSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .functionSignature else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `FunctionSignatureSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .functionSignature)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeInput: UnexpectedNodesSyntax? = nil,
    input: ParameterClauseSyntax,
    _ unexpectedBetweenInputAndAsyncOrReasyncKeyword: UnexpectedNodesSyntax? = nil,
    asyncOrReasyncKeyword: TokenSyntax?,
    _ unexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword: UnexpectedNodesSyntax? = nil,
    throwsOrRethrowsKeyword: TokenSyntax?,
    _ unexpectedBetweenThrowsOrRethrowsKeywordAndOutput: UnexpectedNodesSyntax? = nil,
    output: ReturnClauseSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeInput?.raw,
      input.raw,
      unexpectedBetweenInputAndAsyncOrReasyncKeyword?.raw,
      asyncOrReasyncKeyword?.raw,
      unexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword?.raw,
      throwsOrRethrowsKeyword?.raw,
      unexpectedBetweenThrowsOrRethrowsKeywordAndOutput?.raw,
      output?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.functionSignature,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeInput: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeInput,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeInput(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeInput` replaced.
  /// - param newChild: The new `unexpectedBeforeInput` to replace the node's
  ///                   current `unexpectedBeforeInput`, if present.
  public func withUnexpectedBeforeInput(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeInput)
    return FunctionSignatureSyntax(newData)
  }

  public var input: ParameterClauseSyntax {
    get {
      let childData = data.child(at: Cursor.input,
                                 parent: Syntax(self))
      return ParameterClauseSyntax(childData!)
    }
    set(value) {
      self = withInput(value)
    }
  }

  /// Returns a copy of the receiver with its `input` replaced.
  /// - param newChild: The new `input` to replace the node's
  ///                   current `input`, if present.
  public func withInput(
    _ newChild: ParameterClauseSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.parameterClause, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.input)
    return FunctionSignatureSyntax(newData)
  }

  public var unexpectedBetweenInputAndAsyncOrReasyncKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenInputAndAsyncOrReasyncKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenInputAndAsyncOrReasyncKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenInputAndAsyncOrReasyncKeyword` replaced.
  /// - param newChild: The new `unexpectedBetweenInputAndAsyncOrReasyncKeyword` to replace the node's
  ///                   current `unexpectedBetweenInputAndAsyncOrReasyncKeyword`, if present.
  public func withUnexpectedBetweenInputAndAsyncOrReasyncKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenInputAndAsyncOrReasyncKeyword)
    return FunctionSignatureSyntax(newData)
  }

  public var asyncOrReasyncKeyword: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.asyncOrReasyncKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAsyncOrReasyncKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `asyncOrReasyncKeyword` replaced.
  /// - param newChild: The new `asyncOrReasyncKeyword` to replace the node's
  ///                   current `asyncOrReasyncKeyword`, if present.
  public func withAsyncOrReasyncKeyword(
    _ newChild: TokenSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.asyncOrReasyncKeyword)
    return FunctionSignatureSyntax(newData)
  }

  public var unexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword` replaced.
  /// - param newChild: The new `unexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword` to replace the node's
  ///                   current `unexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword`, if present.
  public func withUnexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword)
    return FunctionSignatureSyntax(newData)
  }

  public var throwsOrRethrowsKeyword: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.throwsOrRethrowsKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withThrowsOrRethrowsKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `throwsOrRethrowsKeyword` replaced.
  /// - param newChild: The new `throwsOrRethrowsKeyword` to replace the node's
  ///                   current `throwsOrRethrowsKeyword`, if present.
  public func withThrowsOrRethrowsKeyword(
    _ newChild: TokenSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.throwsOrRethrowsKeyword)
    return FunctionSignatureSyntax(newData)
  }

  public var unexpectedBetweenThrowsOrRethrowsKeywordAndOutput: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenThrowsOrRethrowsKeywordAndOutput,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenThrowsOrRethrowsKeywordAndOutput(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenThrowsOrRethrowsKeywordAndOutput` replaced.
  /// - param newChild: The new `unexpectedBetweenThrowsOrRethrowsKeywordAndOutput` to replace the node's
  ///                   current `unexpectedBetweenThrowsOrRethrowsKeywordAndOutput`, if present.
  public func withUnexpectedBetweenThrowsOrRethrowsKeywordAndOutput(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenThrowsOrRethrowsKeywordAndOutput)
    return FunctionSignatureSyntax(newData)
  }

  public var output: ReturnClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.output,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ReturnClauseSyntax(childData!)
    }
    set(value) {
      self = withOutput(value)
    }
  }

  /// Returns a copy of the receiver with its `output` replaced.
  /// - param newChild: The new `output` to replace the node's
  ///                   current `output`, if present.
  public func withOutput(
    _ newChild: ReturnClauseSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.output)
    return FunctionSignatureSyntax(newData)
  }
}

extension FunctionSignatureSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeInput": unexpectedBeforeInput.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "input": Syntax(input).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenInputAndAsyncOrReasyncKeyword": unexpectedBetweenInputAndAsyncOrReasyncKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "asyncOrReasyncKeyword": asyncOrReasyncKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword": unexpectedBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "throwsOrRethrowsKeyword": throwsOrRethrowsKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenThrowsOrRethrowsKeywordAndOutput": unexpectedBetweenThrowsOrRethrowsKeywordAndOutput.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "output": output.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - IfConfigClauseSyntax

public struct IfConfigClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforePoundKeyword
    case poundKeyword
    case unexpectedBetweenPoundKeywordAndCondition
    case condition
    case unexpectedBetweenConditionAndElements
    case elements
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `IfConfigClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .ifConfigClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `IfConfigClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .ifConfigClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforePoundKeyword: UnexpectedNodesSyntax? = nil,
    poundKeyword: TokenSyntax,
    _ unexpectedBetweenPoundKeywordAndCondition: UnexpectedNodesSyntax? = nil,
    condition: ExprSyntax?,
    _ unexpectedBetweenConditionAndElements: UnexpectedNodesSyntax? = nil,
    elements: Syntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforePoundKeyword?.raw,
      poundKeyword.raw,
      unexpectedBetweenPoundKeywordAndCondition?.raw,
      condition?.raw,
      unexpectedBetweenConditionAndElements?.raw,
      elements.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.ifConfigClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforePoundKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforePoundKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforePoundKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforePoundKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforePoundKeyword` to replace the node's
  ///                   current `unexpectedBeforePoundKeyword`, if present.
  public func withUnexpectedBeforePoundKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforePoundKeyword)
    return IfConfigClauseSyntax(newData)
  }

  public var poundKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.poundKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPoundKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `poundKeyword` replaced.
  /// - param newChild: The new `poundKeyword` to replace the node's
  ///                   current `poundKeyword`, if present.
  public func withPoundKeyword(
    _ newChild: TokenSyntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.poundIfKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.poundKeyword)
    return IfConfigClauseSyntax(newData)
  }

  public var unexpectedBetweenPoundKeywordAndCondition: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPoundKeywordAndCondition,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPoundKeywordAndCondition(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPoundKeywordAndCondition` replaced.
  /// - param newChild: The new `unexpectedBetweenPoundKeywordAndCondition` to replace the node's
  ///                   current `unexpectedBetweenPoundKeywordAndCondition`, if present.
  public func withUnexpectedBetweenPoundKeywordAndCondition(
    _ newChild: UnexpectedNodesSyntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPoundKeywordAndCondition)
    return IfConfigClauseSyntax(newData)
  }

  public var condition: ExprSyntax? {
    get {
      let childData = data.child(at: Cursor.condition,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withCondition(value)
    }
  }

  /// Returns a copy of the receiver with its `condition` replaced.
  /// - param newChild: The new `condition` to replace the node's
  ///                   current `condition`, if present.
  public func withCondition(
    _ newChild: ExprSyntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.condition)
    return IfConfigClauseSyntax(newData)
  }

  public var unexpectedBetweenConditionAndElements: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenConditionAndElements,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenConditionAndElements(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenConditionAndElements` replaced.
  /// - param newChild: The new `unexpectedBetweenConditionAndElements` to replace the node's
  ///                   current `unexpectedBetweenConditionAndElements`, if present.
  public func withUnexpectedBetweenConditionAndElements(
    _ newChild: UnexpectedNodesSyntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenConditionAndElements)
    return IfConfigClauseSyntax(newData)
  }

  public var elements: Syntax {
    get {
      let childData = data.child(at: Cursor.elements,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withElements(value)
    }
  }

  /// Returns a copy of the receiver with its `elements` replaced.
  /// - param newChild: The new `elements` to replace the node's
  ///                   current `elements`, if present.
  public func withElements(
    _ newChild: Syntax?) -> IfConfigClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.elements)
    return IfConfigClauseSyntax(newData)
  }
}

extension IfConfigClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePoundKeyword": unexpectedBeforePoundKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundKeyword": Syntax(poundKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPoundKeywordAndCondition": unexpectedBetweenPoundKeywordAndCondition.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "condition": condition.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenConditionAndElements": unexpectedBetweenConditionAndElements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elements": Syntax(elements).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PoundSourceLocationArgsSyntax

public struct PoundSourceLocationArgsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeFileArgLabel
    case fileArgLabel
    case unexpectedBetweenFileArgLabelAndFileArgColon
    case fileArgColon
    case unexpectedBetweenFileArgColonAndFileName
    case fileName
    case unexpectedBetweenFileNameAndComma
    case comma
    case unexpectedBetweenCommaAndLineArgLabel
    case lineArgLabel
    case unexpectedBetweenLineArgLabelAndLineArgColon
    case lineArgColon
    case unexpectedBetweenLineArgColonAndLineNumber
    case lineNumber
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PoundSourceLocationArgsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .poundSourceLocationArgs else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PoundSourceLocationArgsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .poundSourceLocationArgs)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeFileArgLabel: UnexpectedNodesSyntax? = nil,
    fileArgLabel: TokenSyntax,
    _ unexpectedBetweenFileArgLabelAndFileArgColon: UnexpectedNodesSyntax? = nil,
    fileArgColon: TokenSyntax,
    _ unexpectedBetweenFileArgColonAndFileName: UnexpectedNodesSyntax? = nil,
    fileName: TokenSyntax,
    _ unexpectedBetweenFileNameAndComma: UnexpectedNodesSyntax? = nil,
    comma: TokenSyntax,
    _ unexpectedBetweenCommaAndLineArgLabel: UnexpectedNodesSyntax? = nil,
    lineArgLabel: TokenSyntax,
    _ unexpectedBetweenLineArgLabelAndLineArgColon: UnexpectedNodesSyntax? = nil,
    lineArgColon: TokenSyntax,
    _ unexpectedBetweenLineArgColonAndLineNumber: UnexpectedNodesSyntax? = nil,
    lineNumber: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeFileArgLabel?.raw,
      fileArgLabel.raw,
      unexpectedBetweenFileArgLabelAndFileArgColon?.raw,
      fileArgColon.raw,
      unexpectedBetweenFileArgColonAndFileName?.raw,
      fileName.raw,
      unexpectedBetweenFileNameAndComma?.raw,
      comma.raw,
      unexpectedBetweenCommaAndLineArgLabel?.raw,
      lineArgLabel.raw,
      unexpectedBetweenLineArgLabelAndLineArgColon?.raw,
      lineArgColon.raw,
      unexpectedBetweenLineArgColonAndLineNumber?.raw,
      lineNumber.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.poundSourceLocationArgs,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeFileArgLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeFileArgLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeFileArgLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeFileArgLabel` replaced.
  /// - param newChild: The new `unexpectedBeforeFileArgLabel` to replace the node's
  ///                   current `unexpectedBeforeFileArgLabel`, if present.
  public func withUnexpectedBeforeFileArgLabel(
    _ newChild: UnexpectedNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeFileArgLabel)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var fileArgLabel: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.fileArgLabel,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withFileArgLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `fileArgLabel` replaced.
  /// - param newChild: The new `fileArgLabel` to replace the node's
  ///                   current `fileArgLabel`, if present.
  public func withFileArgLabel(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.fileArgLabel)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var unexpectedBetweenFileArgLabelAndFileArgColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenFileArgLabelAndFileArgColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenFileArgLabelAndFileArgColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenFileArgLabelAndFileArgColon` replaced.
  /// - param newChild: The new `unexpectedBetweenFileArgLabelAndFileArgColon` to replace the node's
  ///                   current `unexpectedBetweenFileArgLabelAndFileArgColon`, if present.
  public func withUnexpectedBetweenFileArgLabelAndFileArgColon(
    _ newChild: UnexpectedNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenFileArgLabelAndFileArgColon)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var fileArgColon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.fileArgColon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withFileArgColon(value)
    }
  }

  /// Returns a copy of the receiver with its `fileArgColon` replaced.
  /// - param newChild: The new `fileArgColon` to replace the node's
  ///                   current `fileArgColon`, if present.
  public func withFileArgColon(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.fileArgColon)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var unexpectedBetweenFileArgColonAndFileName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenFileArgColonAndFileName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenFileArgColonAndFileName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenFileArgColonAndFileName` replaced.
  /// - param newChild: The new `unexpectedBetweenFileArgColonAndFileName` to replace the node's
  ///                   current `unexpectedBetweenFileArgColonAndFileName`, if present.
  public func withUnexpectedBetweenFileArgColonAndFileName(
    _ newChild: UnexpectedNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenFileArgColonAndFileName)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var fileName: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.fileName,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withFileName(value)
    }
  }

  /// Returns a copy of the receiver with its `fileName` replaced.
  /// - param newChild: The new `fileName` to replace the node's
  ///                   current `fileName`, if present.
  public func withFileName(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.stringLiteral(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.fileName)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var unexpectedBetweenFileNameAndComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenFileNameAndComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenFileNameAndComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenFileNameAndComma` replaced.
  /// - param newChild: The new `unexpectedBetweenFileNameAndComma` to replace the node's
  ///                   current `unexpectedBetweenFileNameAndComma`, if present.
  public func withUnexpectedBetweenFileNameAndComma(
    _ newChild: UnexpectedNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenFileNameAndComma)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var comma: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.comma,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withComma(value)
    }
  }

  /// Returns a copy of the receiver with its `comma` replaced.
  /// - param newChild: The new `comma` to replace the node's
  ///                   current `comma`, if present.
  public func withComma(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.comma, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.comma)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var unexpectedBetweenCommaAndLineArgLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenCommaAndLineArgLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCommaAndLineArgLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCommaAndLineArgLabel` replaced.
  /// - param newChild: The new `unexpectedBetweenCommaAndLineArgLabel` to replace the node's
  ///                   current `unexpectedBetweenCommaAndLineArgLabel`, if present.
  public func withUnexpectedBetweenCommaAndLineArgLabel(
    _ newChild: UnexpectedNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenCommaAndLineArgLabel)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var lineArgLabel: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.lineArgLabel,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLineArgLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `lineArgLabel` replaced.
  /// - param newChild: The new `lineArgLabel` to replace the node's
  ///                   current `lineArgLabel`, if present.
  public func withLineArgLabel(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.lineArgLabel)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var unexpectedBetweenLineArgLabelAndLineArgColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLineArgLabelAndLineArgColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLineArgLabelAndLineArgColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLineArgLabelAndLineArgColon` replaced.
  /// - param newChild: The new `unexpectedBetweenLineArgLabelAndLineArgColon` to replace the node's
  ///                   current `unexpectedBetweenLineArgLabelAndLineArgColon`, if present.
  public func withUnexpectedBetweenLineArgLabelAndLineArgColon(
    _ newChild: UnexpectedNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLineArgLabelAndLineArgColon)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var lineArgColon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.lineArgColon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLineArgColon(value)
    }
  }

  /// Returns a copy of the receiver with its `lineArgColon` replaced.
  /// - param newChild: The new `lineArgColon` to replace the node's
  ///                   current `lineArgColon`, if present.
  public func withLineArgColon(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.lineArgColon)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var unexpectedBetweenLineArgColonAndLineNumber: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLineArgColonAndLineNumber,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLineArgColonAndLineNumber(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLineArgColonAndLineNumber` replaced.
  /// - param newChild: The new `unexpectedBetweenLineArgColonAndLineNumber` to replace the node's
  ///                   current `unexpectedBetweenLineArgColonAndLineNumber`, if present.
  public func withUnexpectedBetweenLineArgColonAndLineNumber(
    _ newChild: UnexpectedNodesSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLineArgColonAndLineNumber)
    return PoundSourceLocationArgsSyntax(newData)
  }

  public var lineNumber: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.lineNumber,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLineNumber(value)
    }
  }

  /// Returns a copy of the receiver with its `lineNumber` replaced.
  /// - param newChild: The new `lineNumber` to replace the node's
  ///                   current `lineNumber`, if present.
  public func withLineNumber(
    _ newChild: TokenSyntax?) -> PoundSourceLocationArgsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.integerLiteral(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.lineNumber)
    return PoundSourceLocationArgsSyntax(newData)
  }
}

extension PoundSourceLocationArgsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeFileArgLabel": unexpectedBeforeFileArgLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "fileArgLabel": Syntax(fileArgLabel).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenFileArgLabelAndFileArgColon": unexpectedBetweenFileArgLabelAndFileArgColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "fileArgColon": Syntax(fileArgColon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenFileArgColonAndFileName": unexpectedBetweenFileArgColonAndFileName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "fileName": Syntax(fileName).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenFileNameAndComma": unexpectedBetweenFileNameAndComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "comma": Syntax(comma).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenCommaAndLineArgLabel": unexpectedBetweenCommaAndLineArgLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "lineArgLabel": Syntax(lineArgLabel).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLineArgLabelAndLineArgColon": unexpectedBetweenLineArgLabelAndLineArgColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "lineArgColon": Syntax(lineArgColon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLineArgColonAndLineNumber": unexpectedBetweenLineArgColonAndLineNumber.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "lineNumber": Syntax(lineNumber).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DeclModifierDetailSyntax

public struct DeclModifierDetailSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndDetail
    case detail
    case unexpectedBetweenDetailAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DeclModifierDetailSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .declModifierDetail else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DeclModifierDetailSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .declModifierDetail)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax,
    _ unexpectedBetweenLeftParenAndDetail: UnexpectedNodesSyntax? = nil,
    detail: TokenSyntax,
    _ unexpectedBetweenDetailAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftParen?.raw,
      leftParen.raw,
      unexpectedBetweenLeftParenAndDetail?.raw,
      detail.raw,
      unexpectedBetweenDetailAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.declModifierDetail,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftParen` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftParen` to replace the node's
  ///                   current `unexpectedBeforeLeftParen`, if present.
  public func withUnexpectedBeforeLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftParen)
    return DeclModifierDetailSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return DeclModifierDetailSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndDetail: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndDetail,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndDetail(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndDetail` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndDetail` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndDetail`, if present.
  public func withUnexpectedBetweenLeftParenAndDetail(
    _ newChild: UnexpectedNodesSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndDetail)
    return DeclModifierDetailSyntax(newData)
  }

  public var detail: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.detail,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDetail(value)
    }
  }

  /// Returns a copy of the receiver with its `detail` replaced.
  /// - param newChild: The new `detail` to replace the node's
  ///                   current `detail`, if present.
  public func withDetail(
    _ newChild: TokenSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.detail)
    return DeclModifierDetailSyntax(newData)
  }

  public var unexpectedBetweenDetailAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDetailAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDetailAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDetailAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenDetailAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenDetailAndRightParen`, if present.
  public func withUnexpectedBetweenDetailAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDetailAndRightParen)
    return DeclModifierDetailSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> DeclModifierDetailSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return DeclModifierDetailSyntax(newData)
  }
}

extension DeclModifierDetailSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftParen": unexpectedBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndDetail": unexpectedBetweenLeftParenAndDetail.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "detail": Syntax(detail).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenDetailAndRightParen": unexpectedBetweenDetailAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DeclModifierSyntax

public struct DeclModifierSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeName
    case name
    case unexpectedBetweenNameAndDetail
    case detail
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DeclModifierSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .declModifier else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DeclModifierSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .declModifier)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndDetail: UnexpectedNodesSyntax? = nil,
    detail: DeclModifierDetailSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeName?.raw,
      name.raw,
      unexpectedBetweenNameAndDetail?.raw,
      detail?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.declModifier,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeName` replaced.
  /// - param newChild: The new `unexpectedBeforeName` to replace the node's
  ///                   current `unexpectedBeforeName`, if present.
  public func withUnexpectedBeforeName(
    _ newChild: UnexpectedNodesSyntax?) -> DeclModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeName)
    return DeclModifierSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> DeclModifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.unknown(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return DeclModifierSyntax(newData)
  }

  public var unexpectedBetweenNameAndDetail: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndDetail,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndDetail(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndDetail` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndDetail` to replace the node's
  ///                   current `unexpectedBetweenNameAndDetail`, if present.
  public func withUnexpectedBetweenNameAndDetail(
    _ newChild: UnexpectedNodesSyntax?) -> DeclModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndDetail)
    return DeclModifierSyntax(newData)
  }

  public var detail: DeclModifierDetailSyntax? {
    get {
      let childData = data.child(at: Cursor.detail,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclModifierDetailSyntax(childData!)
    }
    set(value) {
      self = withDetail(value)
    }
  }

  /// Returns a copy of the receiver with its `detail` replaced.
  /// - param newChild: The new `detail` to replace the node's
  ///                   current `detail`, if present.
  public func withDetail(
    _ newChild: DeclModifierDetailSyntax?) -> DeclModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.detail)
    return DeclModifierSyntax(newData)
  }
}

extension DeclModifierSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeName": unexpectedBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndDetail": unexpectedBetweenNameAndDetail.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "detail": detail.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - InheritedTypeSyntax

public struct InheritedTypeSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeTypeName
    case typeName
    case unexpectedBetweenTypeNameAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `InheritedTypeSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .inheritedType else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `InheritedTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .inheritedType)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeTypeName: UnexpectedNodesSyntax? = nil,
    typeName: TypeSyntax,
    _ unexpectedBetweenTypeNameAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeTypeName?.raw,
      typeName.raw,
      unexpectedBetweenTypeNameAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.inheritedType,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeTypeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeTypeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeTypeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeTypeName` replaced.
  /// - param newChild: The new `unexpectedBeforeTypeName` to replace the node's
  ///                   current `unexpectedBeforeTypeName`, if present.
  public func withUnexpectedBeforeTypeName(
    _ newChild: UnexpectedNodesSyntax?) -> InheritedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeTypeName)
    return InheritedTypeSyntax(newData)
  }

  public var typeName: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.typeName,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withTypeName(value)
    }
  }

  /// Returns a copy of the receiver with its `typeName` replaced.
  /// - param newChild: The new `typeName` to replace the node's
  ///                   current `typeName`, if present.
  public func withTypeName(
    _ newChild: TypeSyntax?) -> InheritedTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.typeName)
    return InheritedTypeSyntax(newData)
  }

  public var unexpectedBetweenTypeNameAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenTypeNameAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTypeNameAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTypeNameAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenTypeNameAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenTypeNameAndTrailingComma`, if present.
  public func withUnexpectedBetweenTypeNameAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> InheritedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenTypeNameAndTrailingComma)
    return InheritedTypeSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> InheritedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return InheritedTypeSyntax(newData)
  }
}

extension InheritedTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeTypeName": unexpectedBeforeTypeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeName": Syntax(typeName).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenTypeNameAndTrailingComma": unexpectedBetweenTypeNameAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TypeInheritanceClauseSyntax

public struct TypeInheritanceClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeColon
    case colon
    case unexpectedBetweenColonAndInheritedTypeCollection
    case inheritedTypeCollection
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TypeInheritanceClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .typeInheritanceClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TypeInheritanceClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .typeInheritanceClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndInheritedTypeCollection: UnexpectedNodesSyntax? = nil,
    inheritedTypeCollection: InheritedTypeListSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndInheritedTypeCollection?.raw,
      inheritedTypeCollection.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.typeInheritanceClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeColon` replaced.
  /// - param newChild: The new `unexpectedBeforeColon` to replace the node's
  ///                   current `unexpectedBeforeColon`, if present.
  public func withUnexpectedBeforeColon(
    _ newChild: UnexpectedNodesSyntax?) -> TypeInheritanceClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeColon)
    return TypeInheritanceClauseSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TypeInheritanceClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return TypeInheritanceClauseSyntax(newData)
  }

  public var unexpectedBetweenColonAndInheritedTypeCollection: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndInheritedTypeCollection,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndInheritedTypeCollection(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndInheritedTypeCollection` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndInheritedTypeCollection` to replace the node's
  ///                   current `unexpectedBetweenColonAndInheritedTypeCollection`, if present.
  public func withUnexpectedBetweenColonAndInheritedTypeCollection(
    _ newChild: UnexpectedNodesSyntax?) -> TypeInheritanceClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndInheritedTypeCollection)
    return TypeInheritanceClauseSyntax(newData)
  }

  public var inheritedTypeCollection: InheritedTypeListSyntax {
    get {
      let childData = data.child(at: Cursor.inheritedTypeCollection,
                                 parent: Syntax(self))
      return InheritedTypeListSyntax(childData!)
    }
    set(value) {
      self = withInheritedTypeCollection(value)
    }
  }

  /// Adds the provided `InheritedType` to the node's `inheritedTypeCollection`
  /// collection.
  /// - param element: The new `InheritedType` to add to the node's
  ///                  `inheritedTypeCollection` collection.
  /// - returns: A copy of the receiver with the provided `InheritedType`
  ///            appended to its `inheritedTypeCollection` collection.
  public func addInheritedType(_ element: InheritedTypeSyntax) -> TypeInheritanceClauseSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.inheritedTypeCollection] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.inheritedTypeList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.inheritedTypeCollection)
    return TypeInheritanceClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `inheritedTypeCollection` replaced.
  /// - param newChild: The new `inheritedTypeCollection` to replace the node's
  ///                   current `inheritedTypeCollection`, if present.
  public func withInheritedTypeCollection(
    _ newChild: InheritedTypeListSyntax?) -> TypeInheritanceClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.inheritedTypeList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.inheritedTypeCollection)
    return TypeInheritanceClauseSyntax(newData)
  }
}

extension TypeInheritanceClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeColon": unexpectedBeforeColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndInheritedTypeCollection": unexpectedBetweenColonAndInheritedTypeCollection.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inheritedTypeCollection": Syntax(inheritedTypeCollection).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - MemberDeclBlockSyntax

public struct MemberDeclBlockSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftBrace
    case leftBrace
    case unexpectedBetweenLeftBraceAndMembers
    case members
    case unexpectedBetweenMembersAndRightBrace
    case rightBrace
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `MemberDeclBlockSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .memberDeclBlock else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `MemberDeclBlockSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .memberDeclBlock)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftBrace: UnexpectedNodesSyntax? = nil,
    leftBrace: TokenSyntax,
    _ unexpectedBetweenLeftBraceAndMembers: UnexpectedNodesSyntax? = nil,
    members: MemberDeclListSyntax,
    _ unexpectedBetweenMembersAndRightBrace: UnexpectedNodesSyntax? = nil,
    rightBrace: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftBrace?.raw,
      leftBrace.raw,
      unexpectedBetweenLeftBraceAndMembers?.raw,
      members.raw,
      unexpectedBetweenMembersAndRightBrace?.raw,
      rightBrace.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.memberDeclBlock,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftBrace: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftBrace` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftBrace` to replace the node's
  ///                   current `unexpectedBeforeLeftBrace`, if present.
  public func withUnexpectedBeforeLeftBrace(
    _ newChild: UnexpectedNodesSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftBrace)
    return MemberDeclBlockSyntax(newData)
  }

  public var leftBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(
    _ newChild: TokenSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftBrace, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftBrace)
    return MemberDeclBlockSyntax(newData)
  }

  public var unexpectedBetweenLeftBraceAndMembers: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftBraceAndMembers,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftBraceAndMembers(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftBraceAndMembers` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftBraceAndMembers` to replace the node's
  ///                   current `unexpectedBetweenLeftBraceAndMembers`, if present.
  public func withUnexpectedBetweenLeftBraceAndMembers(
    _ newChild: UnexpectedNodesSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftBraceAndMembers)
    return MemberDeclBlockSyntax(newData)
  }

  public var members: MemberDeclListSyntax {
    get {
      let childData = data.child(at: Cursor.members,
                                 parent: Syntax(self))
      return MemberDeclListSyntax(childData!)
    }
    set(value) {
      self = withMembers(value)
    }
  }

  /// Adds the provided `Member` to the node's `members`
  /// collection.
  /// - param element: The new `Member` to add to the node's
  ///                  `members` collection.
  /// - returns: A copy of the receiver with the provided `Member`
  ///            appended to its `members` collection.
  public func addMember(_ element: MemberDeclListItemSyntax) -> MemberDeclBlockSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.members] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.memberDeclList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.members)
    return MemberDeclBlockSyntax(newData)
  }

  /// Returns a copy of the receiver with its `members` replaced.
  /// - param newChild: The new `members` to replace the node's
  ///                   current `members`, if present.
  public func withMembers(
    _ newChild: MemberDeclListSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.memberDeclList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.members)
    return MemberDeclBlockSyntax(newData)
  }

  public var unexpectedBetweenMembersAndRightBrace: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenMembersAndRightBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenMembersAndRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenMembersAndRightBrace` replaced.
  /// - param newChild: The new `unexpectedBetweenMembersAndRightBrace` to replace the node's
  ///                   current `unexpectedBetweenMembersAndRightBrace`, if present.
  public func withUnexpectedBetweenMembersAndRightBrace(
    _ newChild: UnexpectedNodesSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenMembersAndRightBrace)
    return MemberDeclBlockSyntax(newData)
  }

  public var rightBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(
    _ newChild: TokenSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightBrace, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightBrace)
    return MemberDeclBlockSyntax(newData)
  }
}

extension MemberDeclBlockSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftBrace": unexpectedBeforeLeftBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftBrace": Syntax(leftBrace).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftBraceAndMembers": unexpectedBetweenLeftBraceAndMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "members": Syntax(members).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenMembersAndRightBrace": unexpectedBetweenMembersAndRightBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightBrace": Syntax(rightBrace).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - MemberDeclListItemSyntax

/// 
/// A member declaration of a type consisting of a declaration and an
/// optional semicolon;
/// 
public struct MemberDeclListItemSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeDecl
    case decl
    case unexpectedBetweenDeclAndSemicolon
    case semicolon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `MemberDeclListItemSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .memberDeclListItem else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `MemberDeclListItemSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .memberDeclListItem)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeDecl: UnexpectedNodesSyntax? = nil,
    decl: DeclSyntax,
    _ unexpectedBetweenDeclAndSemicolon: UnexpectedNodesSyntax? = nil,
    semicolon: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeDecl?.raw,
      decl.raw,
      unexpectedBetweenDeclAndSemicolon?.raw,
      semicolon?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.memberDeclListItem,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeDecl: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeDecl,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeDecl(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeDecl` replaced.
  /// - param newChild: The new `unexpectedBeforeDecl` to replace the node's
  ///                   current `unexpectedBeforeDecl`, if present.
  public func withUnexpectedBeforeDecl(
    _ newChild: UnexpectedNodesSyntax?) -> MemberDeclListItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeDecl)
    return MemberDeclListItemSyntax(newData)
  }

  /// The declaration of the type member.
  public var decl: DeclSyntax {
    get {
      let childData = data.child(at: Cursor.decl,
                                 parent: Syntax(self))
      return DeclSyntax(childData!)
    }
    set(value) {
      self = withDecl(value)
    }
  }

  /// Returns a copy of the receiver with its `decl` replaced.
  /// - param newChild: The new `decl` to replace the node's
  ///                   current `decl`, if present.
  public func withDecl(
    _ newChild: DeclSyntax?) -> MemberDeclListItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingDecl, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.decl)
    return MemberDeclListItemSyntax(newData)
  }

  public var unexpectedBetweenDeclAndSemicolon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDeclAndSemicolon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDeclAndSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDeclAndSemicolon` replaced.
  /// - param newChild: The new `unexpectedBetweenDeclAndSemicolon` to replace the node's
  ///                   current `unexpectedBetweenDeclAndSemicolon`, if present.
  public func withUnexpectedBetweenDeclAndSemicolon(
    _ newChild: UnexpectedNodesSyntax?) -> MemberDeclListItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDeclAndSemicolon)
    return MemberDeclListItemSyntax(newData)
  }

  /// An optional trailing semicolon.
  public var semicolon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.semicolon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `semicolon` replaced.
  /// - param newChild: The new `semicolon` to replace the node's
  ///                   current `semicolon`, if present.
  public func withSemicolon(
    _ newChild: TokenSyntax?) -> MemberDeclListItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.semicolon)
    return MemberDeclListItemSyntax(newData)
  }
}

extension MemberDeclListItemSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeDecl": unexpectedBeforeDecl.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "decl": Syntax(decl).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenDeclAndSemicolon": unexpectedBetweenDeclAndSemicolon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "semicolon": semicolon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SourceFileSyntax

public struct SourceFileSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeStatements
    case statements
    case unexpectedBetweenStatementsAndEOFToken
    case eofToken
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SourceFileSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .sourceFile else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `SourceFileSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .sourceFile)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeStatements: UnexpectedNodesSyntax? = nil,
    statements: CodeBlockItemListSyntax,
    _ unexpectedBetweenStatementsAndEOFToken: UnexpectedNodesSyntax? = nil,
    eofToken: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeStatements?.raw,
      statements.raw,
      unexpectedBetweenStatementsAndEOFToken?.raw,
      eofToken.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.sourceFile,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeStatements: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeStatements,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeStatements(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeStatements` replaced.
  /// - param newChild: The new `unexpectedBeforeStatements` to replace the node's
  ///                   current `unexpectedBeforeStatements`, if present.
  public func withUnexpectedBeforeStatements(
    _ newChild: UnexpectedNodesSyntax?) -> SourceFileSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeStatements)
    return SourceFileSyntax(newData)
  }

  public var statements: CodeBlockItemListSyntax {
    get {
      let childData = data.child(at: Cursor.statements,
                                 parent: Syntax(self))
      return CodeBlockItemListSyntax(childData!)
    }
    set(value) {
      self = withStatements(value)
    }
  }

  /// Adds the provided `Statement` to the node's `statements`
  /// collection.
  /// - param element: The new `Statement` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `Statement`
  ///            appended to its `statements` collection.
  public func addStatement(_ element: CodeBlockItemSyntax) -> SourceFileSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.statements] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.codeBlockItemList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.statements)
    return SourceFileSyntax(newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> SourceFileSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.codeBlockItemList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.statements)
    return SourceFileSyntax(newData)
  }

  public var unexpectedBetweenStatementsAndEOFToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenStatementsAndEOFToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenStatementsAndEOFToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenStatementsAndEOFToken` replaced.
  /// - param newChild: The new `unexpectedBetweenStatementsAndEOFToken` to replace the node's
  ///                   current `unexpectedBetweenStatementsAndEOFToken`, if present.
  public func withUnexpectedBetweenStatementsAndEOFToken(
    _ newChild: UnexpectedNodesSyntax?) -> SourceFileSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenStatementsAndEOFToken)
    return SourceFileSyntax(newData)
  }

  public var eofToken: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.eofToken,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEOFToken(value)
    }
  }

  /// Returns a copy of the receiver with its `eofToken` replaced.
  /// - param newChild: The new `eofToken` to replace the node's
  ///                   current `eofToken`, if present.
  public func withEOFToken(
    _ newChild: TokenSyntax?) -> SourceFileSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.unknown(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.eofToken)
    return SourceFileSyntax(newData)
  }
}

extension SourceFileSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeStatements": unexpectedBeforeStatements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "statements": Syntax(statements).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenStatementsAndEOFToken": unexpectedBetweenStatementsAndEOFToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "eofToken": Syntax(eofToken).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - InitializerClauseSyntax

public struct InitializerClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeEqual
    case equal
    case unexpectedBetweenEqualAndValue
    case value
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `InitializerClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .initializerClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `InitializerClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .initializerClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeEqual: UnexpectedNodesSyntax? = nil,
    equal: TokenSyntax,
    _ unexpectedBetweenEqualAndValue: UnexpectedNodesSyntax? = nil,
    value: ExprSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeEqual?.raw,
      equal.raw,
      unexpectedBetweenEqualAndValue?.raw,
      value.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.initializerClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeEqual: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeEqual,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeEqual(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeEqual` replaced.
  /// - param newChild: The new `unexpectedBeforeEqual` to replace the node's
  ///                   current `unexpectedBeforeEqual`, if present.
  public func withUnexpectedBeforeEqual(
    _ newChild: UnexpectedNodesSyntax?) -> InitializerClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeEqual)
    return InitializerClauseSyntax(newData)
  }

  public var equal: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.equal,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEqual(value)
    }
  }

  /// Returns a copy of the receiver with its `equal` replaced.
  /// - param newChild: The new `equal` to replace the node's
  ///                   current `equal`, if present.
  public func withEqual(
    _ newChild: TokenSyntax?) -> InitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.equal, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.equal)
    return InitializerClauseSyntax(newData)
  }

  public var unexpectedBetweenEqualAndValue: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenEqualAndValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenEqualAndValue(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenEqualAndValue` replaced.
  /// - param newChild: The new `unexpectedBetweenEqualAndValue` to replace the node's
  ///                   current `unexpectedBetweenEqualAndValue`, if present.
  public func withUnexpectedBetweenEqualAndValue(
    _ newChild: UnexpectedNodesSyntax?) -> InitializerClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenEqualAndValue)
    return InitializerClauseSyntax(newData)
  }

  public var value: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.value,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withValue(value)
    }
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: ExprSyntax?) -> InitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.value)
    return InitializerClauseSyntax(newData)
  }
}

extension InitializerClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeEqual": unexpectedBeforeEqual.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "equal": Syntax(equal).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenEqualAndValue": unexpectedBetweenEqualAndValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "value": Syntax(value).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - FunctionParameterSyntax

public struct FunctionParameterSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeAttributes
    case attributes
    case unexpectedBetweenAttributesAndFirstName
    case firstName
    case unexpectedBetweenFirstNameAndSecondName
    case secondName
    case unexpectedBetweenSecondNameAndColon
    case colon
    case unexpectedBetweenColonAndType
    case type
    case unexpectedBetweenTypeAndEllipsis
    case ellipsis
    case unexpectedBetweenEllipsisAndDefaultArgument
    case defaultArgument
    case unexpectedBetweenDefaultArgumentAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `FunctionParameterSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .functionParameter else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `FunctionParameterSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .functionParameter)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax?,
    _ unexpectedBetweenAttributesAndFirstName: UnexpectedNodesSyntax? = nil,
    firstName: TokenSyntax?,
    _ unexpectedBetweenFirstNameAndSecondName: UnexpectedNodesSyntax? = nil,
    secondName: TokenSyntax?,
    _ unexpectedBetweenSecondNameAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax?,
    _ unexpectedBetweenColonAndType: UnexpectedNodesSyntax? = nil,
    type: TypeSyntax?,
    _ unexpectedBetweenTypeAndEllipsis: UnexpectedNodesSyntax? = nil,
    ellipsis: TokenSyntax?,
    _ unexpectedBetweenEllipsisAndDefaultArgument: UnexpectedNodesSyntax? = nil,
    defaultArgument: InitializerClauseSyntax?,
    _ unexpectedBetweenDefaultArgumentAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAttributes?.raw,
      attributes?.raw,
      unexpectedBetweenAttributesAndFirstName?.raw,
      firstName?.raw,
      unexpectedBetweenFirstNameAndSecondName?.raw,
      secondName?.raw,
      unexpectedBetweenSecondNameAndColon?.raw,
      colon?.raw,
      unexpectedBetweenColonAndType?.raw,
      type?.raw,
      unexpectedBetweenTypeAndEllipsis?.raw,
      ellipsis?.raw,
      unexpectedBetweenEllipsisAndDefaultArgument?.raw,
      defaultArgument?.raw,
      unexpectedBetweenDefaultArgumentAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.functionParameter,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeAttributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAttributes(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAttributes` replaced.
  /// - param newChild: The new `unexpectedBeforeAttributes` to replace the node's
  ///                   current `unexpectedBeforeAttributes`, if present.
  public func withUnexpectedBeforeAttributes(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeAttributes)
    return FunctionParameterSyntax(newData)
  }

  public var attributes: AttributeListSyntax? {
    get {
      let childData = data.child(at: Cursor.attributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return AttributeListSyntax(childData!)
    }
    set(value) {
      self = withAttributes(value)
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> FunctionParameterSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.attributes] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.attributes)
    return FunctionParameterSyntax(newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.attributes)
    return FunctionParameterSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndFirstName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAttributesAndFirstName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAttributesAndFirstName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAttributesAndFirstName` replaced.
  /// - param newChild: The new `unexpectedBetweenAttributesAndFirstName` to replace the node's
  ///                   current `unexpectedBetweenAttributesAndFirstName`, if present.
  public func withUnexpectedBetweenAttributesAndFirstName(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAttributesAndFirstName)
    return FunctionParameterSyntax(newData)
  }

  public var firstName: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.firstName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withFirstName(value)
    }
  }

  /// Returns a copy of the receiver with its `firstName` replaced.
  /// - param newChild: The new `firstName` to replace the node's
  ///                   current `firstName`, if present.
  public func withFirstName(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.firstName)
    return FunctionParameterSyntax(newData)
  }

  public var unexpectedBetweenFirstNameAndSecondName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenFirstNameAndSecondName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenFirstNameAndSecondName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenFirstNameAndSecondName` replaced.
  /// - param newChild: The new `unexpectedBetweenFirstNameAndSecondName` to replace the node's
  ///                   current `unexpectedBetweenFirstNameAndSecondName`, if present.
  public func withUnexpectedBetweenFirstNameAndSecondName(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenFirstNameAndSecondName)
    return FunctionParameterSyntax(newData)
  }

  public var secondName: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.secondName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSecondName(value)
    }
  }

  /// Returns a copy of the receiver with its `secondName` replaced.
  /// - param newChild: The new `secondName` to replace the node's
  ///                   current `secondName`, if present.
  public func withSecondName(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.secondName)
    return FunctionParameterSyntax(newData)
  }

  public var unexpectedBetweenSecondNameAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenSecondNameAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenSecondNameAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenSecondNameAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenSecondNameAndColon` to replace the node's
  ///                   current `unexpectedBetweenSecondNameAndColon`, if present.
  public func withUnexpectedBetweenSecondNameAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenSecondNameAndColon)
    return FunctionParameterSyntax(newData)
  }

  public var colon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return FunctionParameterSyntax(newData)
  }

  public var unexpectedBetweenColonAndType: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndType(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndType` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndType` to replace the node's
  ///                   current `unexpectedBetweenColonAndType`, if present.
  public func withUnexpectedBetweenColonAndType(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndType)
    return FunctionParameterSyntax(newData)
  }

  public var type: TypeSyntax? {
    get {
      let childData = data.child(at: Cursor.type,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withType(value)
    }
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.type)
    return FunctionParameterSyntax(newData)
  }

  public var unexpectedBetweenTypeAndEllipsis: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenTypeAndEllipsis,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTypeAndEllipsis(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTypeAndEllipsis` replaced.
  /// - param newChild: The new `unexpectedBetweenTypeAndEllipsis` to replace the node's
  ///                   current `unexpectedBetweenTypeAndEllipsis`, if present.
  public func withUnexpectedBetweenTypeAndEllipsis(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenTypeAndEllipsis)
    return FunctionParameterSyntax(newData)
  }

  public var ellipsis: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.ellipsis,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEllipsis(value)
    }
  }

  /// Returns a copy of the receiver with its `ellipsis` replaced.
  /// - param newChild: The new `ellipsis` to replace the node's
  ///                   current `ellipsis`, if present.
  public func withEllipsis(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.ellipsis)
    return FunctionParameterSyntax(newData)
  }

  public var unexpectedBetweenEllipsisAndDefaultArgument: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenEllipsisAndDefaultArgument,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenEllipsisAndDefaultArgument(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenEllipsisAndDefaultArgument` replaced.
  /// - param newChild: The new `unexpectedBetweenEllipsisAndDefaultArgument` to replace the node's
  ///                   current `unexpectedBetweenEllipsisAndDefaultArgument`, if present.
  public func withUnexpectedBetweenEllipsisAndDefaultArgument(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenEllipsisAndDefaultArgument)
    return FunctionParameterSyntax(newData)
  }

  public var defaultArgument: InitializerClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.defaultArgument,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withDefaultArgument(value)
    }
  }

  /// Returns a copy of the receiver with its `defaultArgument` replaced.
  /// - param newChild: The new `defaultArgument` to replace the node's
  ///                   current `defaultArgument`, if present.
  public func withDefaultArgument(
    _ newChild: InitializerClauseSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.defaultArgument)
    return FunctionParameterSyntax(newData)
  }

  public var unexpectedBetweenDefaultArgumentAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDefaultArgumentAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDefaultArgumentAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDefaultArgumentAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenDefaultArgumentAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenDefaultArgumentAndTrailingComma`, if present.
  public func withUnexpectedBetweenDefaultArgumentAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDefaultArgumentAndTrailingComma)
    return FunctionParameterSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return FunctionParameterSyntax(newData)
  }
}

extension FunctionParameterSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndFirstName": unexpectedBetweenAttributesAndFirstName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "firstName": firstName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenFirstNameAndSecondName": unexpectedBetweenFirstNameAndSecondName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "secondName": secondName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenSecondNameAndColon": unexpectedBetweenSecondNameAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": colon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenColonAndType": unexpectedBetweenColonAndType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": type.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenTypeAndEllipsis": unexpectedBetweenTypeAndEllipsis.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "ellipsis": ellipsis.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenEllipsisAndDefaultArgument": unexpectedBetweenEllipsisAndDefaultArgument.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "defaultArgument": defaultArgument.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenDefaultArgumentAndTrailingComma": unexpectedBetweenDefaultArgumentAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AccessLevelModifierSyntax

public struct AccessLevelModifierSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeName
    case name
    case unexpectedBetweenNameAndModifier
    case modifier
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AccessLevelModifierSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .accessLevelModifier else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AccessLevelModifierSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .accessLevelModifier)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndModifier: UnexpectedNodesSyntax? = nil,
    modifier: DeclModifierDetailSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeName?.raw,
      name.raw,
      unexpectedBetweenNameAndModifier?.raw,
      modifier?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.accessLevelModifier,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeName` replaced.
  /// - param newChild: The new `unexpectedBeforeName` to replace the node's
  ///                   current `unexpectedBeforeName`, if present.
  public func withUnexpectedBeforeName(
    _ newChild: UnexpectedNodesSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeName)
    return AccessLevelModifierSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return AccessLevelModifierSyntax(newData)
  }

  public var unexpectedBetweenNameAndModifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndModifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndModifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndModifier` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndModifier` to replace the node's
  ///                   current `unexpectedBetweenNameAndModifier`, if present.
  public func withUnexpectedBetweenNameAndModifier(
    _ newChild: UnexpectedNodesSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndModifier)
    return AccessLevelModifierSyntax(newData)
  }

  public var modifier: DeclModifierDetailSyntax? {
    get {
      let childData = data.child(at: Cursor.modifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclModifierDetailSyntax(childData!)
    }
    set(value) {
      self = withModifier(value)
    }
  }

  /// Returns a copy of the receiver with its `modifier` replaced.
  /// - param newChild: The new `modifier` to replace the node's
  ///                   current `modifier`, if present.
  public func withModifier(
    _ newChild: DeclModifierDetailSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.modifier)
    return AccessLevelModifierSyntax(newData)
  }
}

extension AccessLevelModifierSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeName": unexpectedBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndModifier": unexpectedBetweenNameAndModifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifier": modifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AccessPathComponentSyntax

public struct AccessPathComponentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeName
    case name
    case unexpectedBetweenNameAndTrailingDot
    case trailingDot
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AccessPathComponentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .accessPathComponent else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AccessPathComponentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .accessPathComponent)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndTrailingDot: UnexpectedNodesSyntax? = nil,
    trailingDot: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeName?.raw,
      name.raw,
      unexpectedBetweenNameAndTrailingDot?.raw,
      trailingDot?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.accessPathComponent,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeName` replaced.
  /// - param newChild: The new `unexpectedBeforeName` to replace the node's
  ///                   current `unexpectedBeforeName`, if present.
  public func withUnexpectedBeforeName(
    _ newChild: UnexpectedNodesSyntax?) -> AccessPathComponentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeName)
    return AccessPathComponentSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> AccessPathComponentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return AccessPathComponentSyntax(newData)
  }

  public var unexpectedBetweenNameAndTrailingDot: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndTrailingDot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndTrailingDot(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndTrailingDot` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndTrailingDot` to replace the node's
  ///                   current `unexpectedBetweenNameAndTrailingDot`, if present.
  public func withUnexpectedBetweenNameAndTrailingDot(
    _ newChild: UnexpectedNodesSyntax?) -> AccessPathComponentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndTrailingDot)
    return AccessPathComponentSyntax(newData)
  }

  public var trailingDot: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingDot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingDot(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingDot` replaced.
  /// - param newChild: The new `trailingDot` to replace the node's
  ///                   current `trailingDot`, if present.
  public func withTrailingDot(
    _ newChild: TokenSyntax?) -> AccessPathComponentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingDot)
    return AccessPathComponentSyntax(newData)
  }
}

extension AccessPathComponentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeName": unexpectedBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndTrailingDot": unexpectedBetweenNameAndTrailingDot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingDot": trailingDot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AccessorParameterSyntax

public struct AccessorParameterSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndName
    case name
    case unexpectedBetweenNameAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AccessorParameterSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .accessorParameter else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AccessorParameterSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .accessorParameter)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax,
    _ unexpectedBetweenLeftParenAndName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftParen?.raw,
      leftParen.raw,
      unexpectedBetweenLeftParenAndName?.raw,
      name.raw,
      unexpectedBetweenNameAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.accessorParameter,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftParen` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftParen` to replace the node's
  ///                   current `unexpectedBeforeLeftParen`, if present.
  public func withUnexpectedBeforeLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftParen)
    return AccessorParameterSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return AccessorParameterSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndName` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndName` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndName`, if present.
  public func withUnexpectedBetweenLeftParenAndName(
    _ newChild: UnexpectedNodesSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndName)
    return AccessorParameterSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return AccessorParameterSyntax(newData)
  }

  public var unexpectedBetweenNameAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenNameAndRightParen`, if present.
  public func withUnexpectedBetweenNameAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndRightParen)
    return AccessorParameterSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return AccessorParameterSyntax(newData)
  }
}

extension AccessorParameterSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftParen": unexpectedBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndName": unexpectedBetweenLeftParenAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndRightParen": unexpectedBetweenNameAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - AccessorBlockSyntax

public struct AccessorBlockSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftBrace
    case leftBrace
    case unexpectedBetweenLeftBraceAndAccessors
    case accessors
    case unexpectedBetweenAccessorsAndRightBrace
    case rightBrace
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AccessorBlockSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .accessorBlock else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AccessorBlockSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .accessorBlock)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftBrace: UnexpectedNodesSyntax? = nil,
    leftBrace: TokenSyntax,
    _ unexpectedBetweenLeftBraceAndAccessors: UnexpectedNodesSyntax? = nil,
    accessors: AccessorListSyntax,
    _ unexpectedBetweenAccessorsAndRightBrace: UnexpectedNodesSyntax? = nil,
    rightBrace: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftBrace?.raw,
      leftBrace.raw,
      unexpectedBetweenLeftBraceAndAccessors?.raw,
      accessors.raw,
      unexpectedBetweenAccessorsAndRightBrace?.raw,
      rightBrace.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.accessorBlock,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftBrace: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftBrace` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftBrace` to replace the node's
  ///                   current `unexpectedBeforeLeftBrace`, if present.
  public func withUnexpectedBeforeLeftBrace(
    _ newChild: UnexpectedNodesSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftBrace)
    return AccessorBlockSyntax(newData)
  }

  public var leftBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(
    _ newChild: TokenSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftBrace, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftBrace)
    return AccessorBlockSyntax(newData)
  }

  public var unexpectedBetweenLeftBraceAndAccessors: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftBraceAndAccessors,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftBraceAndAccessors(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftBraceAndAccessors` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftBraceAndAccessors` to replace the node's
  ///                   current `unexpectedBetweenLeftBraceAndAccessors`, if present.
  public func withUnexpectedBetweenLeftBraceAndAccessors(
    _ newChild: UnexpectedNodesSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftBraceAndAccessors)
    return AccessorBlockSyntax(newData)
  }

  public var accessors: AccessorListSyntax {
    get {
      let childData = data.child(at: Cursor.accessors,
                                 parent: Syntax(self))
      return AccessorListSyntax(childData!)
    }
    set(value) {
      self = withAccessors(value)
    }
  }

  /// Adds the provided `Accessor` to the node's `accessors`
  /// collection.
  /// - param element: The new `Accessor` to add to the node's
  ///                  `accessors` collection.
  /// - returns: A copy of the receiver with the provided `Accessor`
  ///            appended to its `accessors` collection.
  public func addAccessor(_ element: AccessorDeclSyntax) -> AccessorBlockSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.accessors] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.accessorList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.accessors)
    return AccessorBlockSyntax(newData)
  }

  /// Returns a copy of the receiver with its `accessors` replaced.
  /// - param newChild: The new `accessors` to replace the node's
  ///                   current `accessors`, if present.
  public func withAccessors(
    _ newChild: AccessorListSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.accessorList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.accessors)
    return AccessorBlockSyntax(newData)
  }

  public var unexpectedBetweenAccessorsAndRightBrace: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAccessorsAndRightBrace,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAccessorsAndRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAccessorsAndRightBrace` replaced.
  /// - param newChild: The new `unexpectedBetweenAccessorsAndRightBrace` to replace the node's
  ///                   current `unexpectedBetweenAccessorsAndRightBrace`, if present.
  public func withUnexpectedBetweenAccessorsAndRightBrace(
    _ newChild: UnexpectedNodesSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAccessorsAndRightBrace)
    return AccessorBlockSyntax(newData)
  }

  public var rightBrace: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightBrace,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(
    _ newChild: TokenSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightBrace, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightBrace)
    return AccessorBlockSyntax(newData)
  }
}

extension AccessorBlockSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftBrace": unexpectedBeforeLeftBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftBrace": Syntax(leftBrace).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftBraceAndAccessors": unexpectedBetweenLeftBraceAndAccessors.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "accessors": Syntax(accessors).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAccessorsAndRightBrace": unexpectedBetweenAccessorsAndRightBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightBrace": Syntax(rightBrace).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PatternBindingSyntax

public struct PatternBindingSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforePattern
    case pattern
    case unexpectedBetweenPatternAndTypeAnnotation
    case typeAnnotation
    case unexpectedBetweenTypeAnnotationAndInitializer
    case initializer
    case unexpectedBetweenInitializerAndAccessor
    case accessor
    case unexpectedBetweenAccessorAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PatternBindingSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .patternBinding else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PatternBindingSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .patternBinding)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforePattern: UnexpectedNodesSyntax? = nil,
    pattern: PatternSyntax,
    _ unexpectedBetweenPatternAndTypeAnnotation: UnexpectedNodesSyntax? = nil,
    typeAnnotation: TypeAnnotationSyntax?,
    _ unexpectedBetweenTypeAnnotationAndInitializer: UnexpectedNodesSyntax? = nil,
    initializer: InitializerClauseSyntax?,
    _ unexpectedBetweenInitializerAndAccessor: UnexpectedNodesSyntax? = nil,
    accessor: Syntax?,
    _ unexpectedBetweenAccessorAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforePattern?.raw,
      pattern.raw,
      unexpectedBetweenPatternAndTypeAnnotation?.raw,
      typeAnnotation?.raw,
      unexpectedBetweenTypeAnnotationAndInitializer?.raw,
      initializer?.raw,
      unexpectedBetweenInitializerAndAccessor?.raw,
      accessor?.raw,
      unexpectedBetweenAccessorAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.patternBinding,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforePattern: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforePattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforePattern(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforePattern` replaced.
  /// - param newChild: The new `unexpectedBeforePattern` to replace the node's
  ///                   current `unexpectedBeforePattern`, if present.
  public func withUnexpectedBeforePattern(
    _ newChild: UnexpectedNodesSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforePattern)
    return PatternBindingSyntax(newData)
  }

  public var pattern: PatternSyntax {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingPattern, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return PatternBindingSyntax(newData)
  }

  public var unexpectedBetweenPatternAndTypeAnnotation: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPatternAndTypeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPatternAndTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPatternAndTypeAnnotation` replaced.
  /// - param newChild: The new `unexpectedBetweenPatternAndTypeAnnotation` to replace the node's
  ///                   current `unexpectedBetweenPatternAndTypeAnnotation`, if present.
  public func withUnexpectedBetweenPatternAndTypeAnnotation(
    _ newChild: UnexpectedNodesSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPatternAndTypeAnnotation)
    return PatternBindingSyntax(newData)
  }

  public var typeAnnotation: TypeAnnotationSyntax? {
    get {
      let childData = data.child(at: Cursor.typeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeAnnotationSyntax(childData!)
    }
    set(value) {
      self = withTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeAnnotationSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.typeAnnotation)
    return PatternBindingSyntax(newData)
  }

  public var unexpectedBetweenTypeAnnotationAndInitializer: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenTypeAnnotationAndInitializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTypeAnnotationAndInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTypeAnnotationAndInitializer` replaced.
  /// - param newChild: The new `unexpectedBetweenTypeAnnotationAndInitializer` to replace the node's
  ///                   current `unexpectedBetweenTypeAnnotationAndInitializer`, if present.
  public func withUnexpectedBetweenTypeAnnotationAndInitializer(
    _ newChild: UnexpectedNodesSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenTypeAnnotationAndInitializer)
    return PatternBindingSyntax(newData)
  }

  public var initializer: InitializerClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.initializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.initializer)
    return PatternBindingSyntax(newData)
  }

  public var unexpectedBetweenInitializerAndAccessor: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenInitializerAndAccessor,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenInitializerAndAccessor(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenInitializerAndAccessor` replaced.
  /// - param newChild: The new `unexpectedBetweenInitializerAndAccessor` to replace the node's
  ///                   current `unexpectedBetweenInitializerAndAccessor`, if present.
  public func withUnexpectedBetweenInitializerAndAccessor(
    _ newChild: UnexpectedNodesSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenInitializerAndAccessor)
    return PatternBindingSyntax(newData)
  }

  public var accessor: Syntax? {
    get {
      let childData = data.child(at: Cursor.accessor,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return Syntax(childData!)
    }
    set(value) {
      self = withAccessor(value)
    }
  }

  /// Returns a copy of the receiver with its `accessor` replaced.
  /// - param newChild: The new `accessor` to replace the node's
  ///                   current `accessor`, if present.
  public func withAccessor(
    _ newChild: Syntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.accessor)
    return PatternBindingSyntax(newData)
  }

  public var unexpectedBetweenAccessorAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAccessorAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAccessorAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAccessorAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenAccessorAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenAccessorAndTrailingComma`, if present.
  public func withUnexpectedBetweenAccessorAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAccessorAndTrailingComma)
    return PatternBindingSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return PatternBindingSyntax(newData)
  }
}

extension PatternBindingSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePattern": unexpectedBeforePattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": Syntax(pattern).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPatternAndTypeAnnotation": unexpectedBetweenPatternAndTypeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeAnnotation": typeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenTypeAnnotationAndInitializer": unexpectedBetweenTypeAnnotationAndInitializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "initializer": initializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInitializerAndAccessor": unexpectedBetweenInitializerAndAccessor.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "accessor": accessor.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAccessorAndTrailingComma": unexpectedBetweenAccessorAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - EnumCaseElementSyntax

/// 
/// An element of an enum case, containing the name of the case and,
/// optionally, either associated values or an assignment to a raw value.
/// 
public struct EnumCaseElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeIdentifier
    case identifier
    case unexpectedBetweenIdentifierAndAssociatedValue
    case associatedValue
    case unexpectedBetweenAssociatedValueAndRawValue
    case rawValue
    case unexpectedBetweenRawValueAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `EnumCaseElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .enumCaseElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `EnumCaseElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .enumCaseElement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndAssociatedValue: UnexpectedNodesSyntax? = nil,
    associatedValue: ParameterClauseSyntax?,
    _ unexpectedBetweenAssociatedValueAndRawValue: UnexpectedNodesSyntax? = nil,
    rawValue: InitializerClauseSyntax?,
    _ unexpectedBetweenRawValueAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeIdentifier?.raw,
      identifier.raw,
      unexpectedBetweenIdentifierAndAssociatedValue?.raw,
      associatedValue?.raw,
      unexpectedBetweenAssociatedValueAndRawValue?.raw,
      rawValue?.raw,
      unexpectedBetweenRawValueAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.enumCaseElement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeIdentifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeIdentifier` replaced.
  /// - param newChild: The new `unexpectedBeforeIdentifier` to replace the node's
  ///                   current `unexpectedBeforeIdentifier`, if present.
  public func withUnexpectedBeforeIdentifier(
    _ newChild: UnexpectedNodesSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeIdentifier)
    return EnumCaseElementSyntax(newData)
  }

  /// The name of this case.
  public var identifier: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.identifier,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.identifier)
    return EnumCaseElementSyntax(newData)
  }

  public var unexpectedBetweenIdentifierAndAssociatedValue: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenIdentifierAndAssociatedValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenIdentifierAndAssociatedValue(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenIdentifierAndAssociatedValue` replaced.
  /// - param newChild: The new `unexpectedBetweenIdentifierAndAssociatedValue` to replace the node's
  ///                   current `unexpectedBetweenIdentifierAndAssociatedValue`, if present.
  public func withUnexpectedBetweenIdentifierAndAssociatedValue(
    _ newChild: UnexpectedNodesSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenIdentifierAndAssociatedValue)
    return EnumCaseElementSyntax(newData)
  }

  /// The set of associated values of the case.
  public var associatedValue: ParameterClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.associatedValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return ParameterClauseSyntax(childData!)
    }
    set(value) {
      self = withAssociatedValue(value)
    }
  }

  /// Returns a copy of the receiver with its `associatedValue` replaced.
  /// - param newChild: The new `associatedValue` to replace the node's
  ///                   current `associatedValue`, if present.
  public func withAssociatedValue(
    _ newChild: ParameterClauseSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.associatedValue)
    return EnumCaseElementSyntax(newData)
  }

  public var unexpectedBetweenAssociatedValueAndRawValue: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAssociatedValueAndRawValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAssociatedValueAndRawValue(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAssociatedValueAndRawValue` replaced.
  /// - param newChild: The new `unexpectedBetweenAssociatedValueAndRawValue` to replace the node's
  ///                   current `unexpectedBetweenAssociatedValueAndRawValue`, if present.
  public func withUnexpectedBetweenAssociatedValueAndRawValue(
    _ newChild: UnexpectedNodesSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAssociatedValueAndRawValue)
    return EnumCaseElementSyntax(newData)
  }

  /// 
  /// The raw value of this enum element, if present.
  /// 
  public var rawValue: InitializerClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.rawValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withRawValue(value)
    }
  }

  /// Returns a copy of the receiver with its `rawValue` replaced.
  /// - param newChild: The new `rawValue` to replace the node's
  ///                   current `rawValue`, if present.
  public func withRawValue(
    _ newChild: InitializerClauseSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.rawValue)
    return EnumCaseElementSyntax(newData)
  }

  public var unexpectedBetweenRawValueAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenRawValueAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenRawValueAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenRawValueAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenRawValueAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenRawValueAndTrailingComma`, if present.
  public func withUnexpectedBetweenRawValueAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenRawValueAndTrailingComma)
    return EnumCaseElementSyntax(newData)
  }

  /// 
  /// The trailing comma of this element, if the case has
  /// multiple elements.
  /// 
  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> EnumCaseElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return EnumCaseElementSyntax(newData)
  }
}

extension EnumCaseElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeIdentifier": unexpectedBeforeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndAssociatedValue": unexpectedBetweenIdentifierAndAssociatedValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "associatedValue": associatedValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAssociatedValueAndRawValue": unexpectedBetweenAssociatedValueAndRawValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rawValue": rawValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenRawValueAndTrailingComma": unexpectedBetweenRawValueAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - OperatorPrecedenceAndTypesSyntax

/// 
/// A clause to specify precedence group in infix operator declarations, and designated types in any operator declaration.
/// 
public struct OperatorPrecedenceAndTypesSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeColon
    case colon
    case unexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes
    case precedenceGroupAndDesignatedTypes
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `OperatorPrecedenceAndTypesSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .operatorPrecedenceAndTypes else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `OperatorPrecedenceAndTypesSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .operatorPrecedenceAndTypes)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes: UnexpectedNodesSyntax? = nil,
    precedenceGroupAndDesignatedTypes: IdentifierListSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes?.raw,
      precedenceGroupAndDesignatedTypes.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.operatorPrecedenceAndTypes,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeColon` replaced.
  /// - param newChild: The new `unexpectedBeforeColon` to replace the node's
  ///                   current `unexpectedBeforeColon`, if present.
  public func withUnexpectedBeforeColon(
    _ newChild: UnexpectedNodesSyntax?) -> OperatorPrecedenceAndTypesSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeColon)
    return OperatorPrecedenceAndTypesSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> OperatorPrecedenceAndTypesSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return OperatorPrecedenceAndTypesSyntax(newData)
  }

  public var unexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes` to replace the node's
  ///                   current `unexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes`, if present.
  public func withUnexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes(
    _ newChild: UnexpectedNodesSyntax?) -> OperatorPrecedenceAndTypesSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes)
    return OperatorPrecedenceAndTypesSyntax(newData)
  }

  /// 
  /// The precedence group and designated types for this operator
  /// 
  public var precedenceGroupAndDesignatedTypes: IdentifierListSyntax {
    get {
      let childData = data.child(at: Cursor.precedenceGroupAndDesignatedTypes,
                                 parent: Syntax(self))
      return IdentifierListSyntax(childData!)
    }
    set(value) {
      self = withPrecedenceGroupAndDesignatedTypes(value)
    }
  }

  /// Adds the provided `PrecedenceGroupAndDesignatedType` to the node's `precedenceGroupAndDesignatedTypes`
  /// collection.
  /// - param element: The new `PrecedenceGroupAndDesignatedType` to add to the node's
  ///                  `precedenceGroupAndDesignatedTypes` collection.
  /// - returns: A copy of the receiver with the provided `PrecedenceGroupAndDesignatedType`
  ///            appended to its `precedenceGroupAndDesignatedTypes` collection.
  public func addPrecedenceGroupAndDesignatedType(_ element: TokenSyntax) -> OperatorPrecedenceAndTypesSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.precedenceGroupAndDesignatedTypes] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.identifierList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.precedenceGroupAndDesignatedTypes)
    return OperatorPrecedenceAndTypesSyntax(newData)
  }

  /// Returns a copy of the receiver with its `precedenceGroupAndDesignatedTypes` replaced.
  /// - param newChild: The new `precedenceGroupAndDesignatedTypes` to replace the node's
  ///                   current `precedenceGroupAndDesignatedTypes`, if present.
  public func withPrecedenceGroupAndDesignatedTypes(
    _ newChild: IdentifierListSyntax?) -> OperatorPrecedenceAndTypesSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.identifierList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.precedenceGroupAndDesignatedTypes)
    return OperatorPrecedenceAndTypesSyntax(newData)
  }
}

extension OperatorPrecedenceAndTypesSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeColon": unexpectedBeforeColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes": unexpectedBetweenColonAndPrecedenceGroupAndDesignatedTypes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "precedenceGroupAndDesignatedTypes": Syntax(precedenceGroupAndDesignatedTypes).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PrecedenceGroupRelationSyntax

/// 
/// Specify the new precedence group's relation to existing precedence
/// groups.
/// 
public struct PrecedenceGroupRelationSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeHigherThanOrLowerThan
    case higherThanOrLowerThan
    case unexpectedBetweenHigherThanOrLowerThanAndColon
    case colon
    case unexpectedBetweenColonAndOtherNames
    case otherNames
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrecedenceGroupRelationSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .precedenceGroupRelation else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrecedenceGroupRelationSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .precedenceGroupRelation)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeHigherThanOrLowerThan: UnexpectedNodesSyntax? = nil,
    higherThanOrLowerThan: TokenSyntax,
    _ unexpectedBetweenHigherThanOrLowerThanAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndOtherNames: UnexpectedNodesSyntax? = nil,
    otherNames: PrecedenceGroupNameListSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeHigherThanOrLowerThan?.raw,
      higherThanOrLowerThan.raw,
      unexpectedBetweenHigherThanOrLowerThanAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndOtherNames?.raw,
      otherNames.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.precedenceGroupRelation,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeHigherThanOrLowerThan: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeHigherThanOrLowerThan,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeHigherThanOrLowerThan(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeHigherThanOrLowerThan` replaced.
  /// - param newChild: The new `unexpectedBeforeHigherThanOrLowerThan` to replace the node's
  ///                   current `unexpectedBeforeHigherThanOrLowerThan`, if present.
  public func withUnexpectedBeforeHigherThanOrLowerThan(
    _ newChild: UnexpectedNodesSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeHigherThanOrLowerThan)
    return PrecedenceGroupRelationSyntax(newData)
  }

  /// 
  /// The relation to specified other precedence groups.
  /// 
  public var higherThanOrLowerThan: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.higherThanOrLowerThan,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withHigherThanOrLowerThan(value)
    }
  }

  /// Returns a copy of the receiver with its `higherThanOrLowerThan` replaced.
  /// - param newChild: The new `higherThanOrLowerThan` to replace the node's
  ///                   current `higherThanOrLowerThan`, if present.
  public func withHigherThanOrLowerThan(
    _ newChild: TokenSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.higherThanOrLowerThan)
    return PrecedenceGroupRelationSyntax(newData)
  }

  public var unexpectedBetweenHigherThanOrLowerThanAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenHigherThanOrLowerThanAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenHigherThanOrLowerThanAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenHigherThanOrLowerThanAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenHigherThanOrLowerThanAndColon` to replace the node's
  ///                   current `unexpectedBetweenHigherThanOrLowerThanAndColon`, if present.
  public func withUnexpectedBetweenHigherThanOrLowerThanAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenHigherThanOrLowerThanAndColon)
    return PrecedenceGroupRelationSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return PrecedenceGroupRelationSyntax(newData)
  }

  public var unexpectedBetweenColonAndOtherNames: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndOtherNames,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndOtherNames(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndOtherNames` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndOtherNames` to replace the node's
  ///                   current `unexpectedBetweenColonAndOtherNames`, if present.
  public func withUnexpectedBetweenColonAndOtherNames(
    _ newChild: UnexpectedNodesSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndOtherNames)
    return PrecedenceGroupRelationSyntax(newData)
  }

  /// 
  /// The name of other precedence group to which this precedence
  /// group relates.
  /// 
  public var otherNames: PrecedenceGroupNameListSyntax {
    get {
      let childData = data.child(at: Cursor.otherNames,
                                 parent: Syntax(self))
      return PrecedenceGroupNameListSyntax(childData!)
    }
    set(value) {
      self = withOtherNames(value)
    }
  }

  /// Adds the provided `OtherName` to the node's `otherNames`
  /// collection.
  /// - param element: The new `OtherName` to add to the node's
  ///                  `otherNames` collection.
  /// - returns: A copy of the receiver with the provided `OtherName`
  ///            appended to its `otherNames` collection.
  public func addOtherName(_ element: PrecedenceGroupNameElementSyntax) -> PrecedenceGroupRelationSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.otherNames] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.precedenceGroupNameList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.otherNames)
    return PrecedenceGroupRelationSyntax(newData)
  }

  /// Returns a copy of the receiver with its `otherNames` replaced.
  /// - param newChild: The new `otherNames` to replace the node's
  ///                   current `otherNames`, if present.
  public func withOtherNames(
    _ newChild: PrecedenceGroupNameListSyntax?) -> PrecedenceGroupRelationSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.precedenceGroupNameList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.otherNames)
    return PrecedenceGroupRelationSyntax(newData)
  }
}

extension PrecedenceGroupRelationSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeHigherThanOrLowerThan": unexpectedBeforeHigherThanOrLowerThan.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "higherThanOrLowerThan": Syntax(higherThanOrLowerThan).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenHigherThanOrLowerThanAndColon": unexpectedBetweenHigherThanOrLowerThanAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndOtherNames": unexpectedBetweenColonAndOtherNames.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "otherNames": Syntax(otherNames).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PrecedenceGroupNameElementSyntax

public struct PrecedenceGroupNameElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeName
    case name
    case unexpectedBetweenNameAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrecedenceGroupNameElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .precedenceGroupNameElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrecedenceGroupNameElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .precedenceGroupNameElement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeName?.raw,
      name.raw,
      unexpectedBetweenNameAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.precedenceGroupNameElement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeName` replaced.
  /// - param newChild: The new `unexpectedBeforeName` to replace the node's
  ///                   current `unexpectedBeforeName`, if present.
  public func withUnexpectedBeforeName(
    _ newChild: UnexpectedNodesSyntax?) -> PrecedenceGroupNameElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeName)
    return PrecedenceGroupNameElementSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> PrecedenceGroupNameElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return PrecedenceGroupNameElementSyntax(newData)
  }

  public var unexpectedBetweenNameAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenNameAndTrailingComma`, if present.
  public func withUnexpectedBetweenNameAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> PrecedenceGroupNameElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndTrailingComma)
    return PrecedenceGroupNameElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> PrecedenceGroupNameElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return PrecedenceGroupNameElementSyntax(newData)
  }
}

extension PrecedenceGroupNameElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeName": unexpectedBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndTrailingComma": unexpectedBetweenNameAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PrecedenceGroupAssignmentSyntax

/// 
/// Specifies the precedence of an operator when used in an operation
/// that includes optional chaining.
/// 
public struct PrecedenceGroupAssignmentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeAssignmentKeyword
    case assignmentKeyword
    case unexpectedBetweenAssignmentKeywordAndColon
    case colon
    case unexpectedBetweenColonAndFlag
    case flag
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrecedenceGroupAssignmentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .precedenceGroupAssignment else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrecedenceGroupAssignmentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .precedenceGroupAssignment)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeAssignmentKeyword: UnexpectedNodesSyntax? = nil,
    assignmentKeyword: TokenSyntax,
    _ unexpectedBetweenAssignmentKeywordAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndFlag: UnexpectedNodesSyntax? = nil,
    flag: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAssignmentKeyword?.raw,
      assignmentKeyword.raw,
      unexpectedBetweenAssignmentKeywordAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndFlag?.raw,
      flag.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.precedenceGroupAssignment,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeAssignmentKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeAssignmentKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAssignmentKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAssignmentKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeAssignmentKeyword` to replace the node's
  ///                   current `unexpectedBeforeAssignmentKeyword`, if present.
  public func withUnexpectedBeforeAssignmentKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeAssignmentKeyword)
    return PrecedenceGroupAssignmentSyntax(newData)
  }

  public var assignmentKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.assignmentKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAssignmentKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `assignmentKeyword` replaced.
  /// - param newChild: The new `assignmentKeyword` to replace the node's
  ///                   current `assignmentKeyword`, if present.
  public func withAssignmentKeyword(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.assignmentKeyword)
    return PrecedenceGroupAssignmentSyntax(newData)
  }

  public var unexpectedBetweenAssignmentKeywordAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAssignmentKeywordAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAssignmentKeywordAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAssignmentKeywordAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenAssignmentKeywordAndColon` to replace the node's
  ///                   current `unexpectedBetweenAssignmentKeywordAndColon`, if present.
  public func withUnexpectedBetweenAssignmentKeywordAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAssignmentKeywordAndColon)
    return PrecedenceGroupAssignmentSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return PrecedenceGroupAssignmentSyntax(newData)
  }

  public var unexpectedBetweenColonAndFlag: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndFlag,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndFlag(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndFlag` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndFlag` to replace the node's
  ///                   current `unexpectedBetweenColonAndFlag`, if present.
  public func withUnexpectedBetweenColonAndFlag(
    _ newChild: UnexpectedNodesSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndFlag)
    return PrecedenceGroupAssignmentSyntax(newData)
  }

  /// 
  /// When true, an operator in the corresponding precedence group
  /// uses the same grouping rules during optional chaining as the
  /// assignment operators from the standard library. Otherwise,
  /// operators in the precedence group follows the same optional
  /// chaining rules as operators that don't perform assignment.
  /// 
  public var flag: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.flag,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withFlag(value)
    }
  }

  /// Returns a copy of the receiver with its `flag` replaced.
  /// - param newChild: The new `flag` to replace the node's
  ///                   current `flag`, if present.
  public func withFlag(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssignmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.trueKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.flag)
    return PrecedenceGroupAssignmentSyntax(newData)
  }
}

extension PrecedenceGroupAssignmentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAssignmentKeyword": unexpectedBeforeAssignmentKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "assignmentKeyword": Syntax(assignmentKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAssignmentKeywordAndColon": unexpectedBetweenAssignmentKeywordAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndFlag": unexpectedBetweenColonAndFlag.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "flag": Syntax(flag).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PrecedenceGroupAssociativitySyntax

/// 
/// Specifies how a sequence of operators with the same precedence level
/// are grouped together in the absence of grouping parentheses.
/// 
public struct PrecedenceGroupAssociativitySyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeAssociativityKeyword
    case associativityKeyword
    case unexpectedBetweenAssociativityKeywordAndColon
    case colon
    case unexpectedBetweenColonAndValue
    case value
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrecedenceGroupAssociativitySyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .precedenceGroupAssociativity else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrecedenceGroupAssociativitySyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .precedenceGroupAssociativity)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeAssociativityKeyword: UnexpectedNodesSyntax? = nil,
    associativityKeyword: TokenSyntax,
    _ unexpectedBetweenAssociativityKeywordAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndValue: UnexpectedNodesSyntax? = nil,
    value: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAssociativityKeyword?.raw,
      associativityKeyword.raw,
      unexpectedBetweenAssociativityKeywordAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndValue?.raw,
      value.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.precedenceGroupAssociativity,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeAssociativityKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeAssociativityKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAssociativityKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAssociativityKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeAssociativityKeyword` to replace the node's
  ///                   current `unexpectedBeforeAssociativityKeyword`, if present.
  public func withUnexpectedBeforeAssociativityKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeAssociativityKeyword)
    return PrecedenceGroupAssociativitySyntax(newData)
  }

  public var associativityKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.associativityKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAssociativityKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `associativityKeyword` replaced.
  /// - param newChild: The new `associativityKeyword` to replace the node's
  ///                   current `associativityKeyword`, if present.
  public func withAssociativityKeyword(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.associativityKeyword)
    return PrecedenceGroupAssociativitySyntax(newData)
  }

  public var unexpectedBetweenAssociativityKeywordAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAssociativityKeywordAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAssociativityKeywordAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAssociativityKeywordAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenAssociativityKeywordAndColon` to replace the node's
  ///                   current `unexpectedBetweenAssociativityKeywordAndColon`, if present.
  public func withUnexpectedBetweenAssociativityKeywordAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAssociativityKeywordAndColon)
    return PrecedenceGroupAssociativitySyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return PrecedenceGroupAssociativitySyntax(newData)
  }

  public var unexpectedBetweenColonAndValue: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndValue(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndValue` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndValue` to replace the node's
  ///                   current `unexpectedBetweenColonAndValue`, if present.
  public func withUnexpectedBetweenColonAndValue(
    _ newChild: UnexpectedNodesSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndValue)
    return PrecedenceGroupAssociativitySyntax(newData)
  }

  /// 
  /// Operators that are `left`-associative group left-to-right.
  /// Operators that are `right`-associative group right-to-left.
  /// Operators that are specified with an associativity of `none`
  /// don't associate at all
  /// 
  public var value: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.value,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withValue(value)
    }
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: TokenSyntax?) -> PrecedenceGroupAssociativitySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.value)
    return PrecedenceGroupAssociativitySyntax(newData)
  }
}

extension PrecedenceGroupAssociativitySyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAssociativityKeyword": unexpectedBeforeAssociativityKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "associativityKeyword": Syntax(associativityKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAssociativityKeywordAndColon": unexpectedBetweenAssociativityKeywordAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndValue": unexpectedBetweenColonAndValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "value": Syntax(value).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - CustomAttributeSyntax

/// 
/// A custom `@` attribute.
/// 
public struct CustomAttributeSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeAtSignToken
    case atSignToken
    case unexpectedBetweenAtSignTokenAndAttributeName
    case attributeName
    case unexpectedBetweenAttributeNameAndLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndArgumentList
    case argumentList
    case unexpectedBetweenArgumentListAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CustomAttributeSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .customAttribute else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CustomAttributeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .customAttribute)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeAtSignToken: UnexpectedNodesSyntax? = nil,
    atSignToken: TokenSyntax,
    _ unexpectedBetweenAtSignTokenAndAttributeName: UnexpectedNodesSyntax? = nil,
    attributeName: TypeSyntax,
    _ unexpectedBetweenAttributeNameAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax?,
    _ unexpectedBetweenLeftParenAndArgumentList: UnexpectedNodesSyntax? = nil,
    argumentList: TupleExprElementListSyntax?,
    _ unexpectedBetweenArgumentListAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAtSignToken?.raw,
      atSignToken.raw,
      unexpectedBetweenAtSignTokenAndAttributeName?.raw,
      attributeName.raw,
      unexpectedBetweenAttributeNameAndLeftParen?.raw,
      leftParen?.raw,
      unexpectedBetweenLeftParenAndArgumentList?.raw,
      argumentList?.raw,
      unexpectedBetweenArgumentListAndRightParen?.raw,
      rightParen?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.customAttribute,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeAtSignToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeAtSignToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAtSignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAtSignToken` replaced.
  /// - param newChild: The new `unexpectedBeforeAtSignToken` to replace the node's
  ///                   current `unexpectedBeforeAtSignToken`, if present.
  public func withUnexpectedBeforeAtSignToken(
    _ newChild: UnexpectedNodesSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeAtSignToken)
    return CustomAttributeSyntax(newData)
  }

  /// The `@` sign.
  public var atSignToken: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.atSignToken,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAtSignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `atSignToken` replaced.
  /// - param newChild: The new `atSignToken` to replace the node's
  ///                   current `atSignToken`, if present.
  public func withAtSignToken(
    _ newChild: TokenSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.atSign, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.atSignToken)
    return CustomAttributeSyntax(newData)
  }

  public var unexpectedBetweenAtSignTokenAndAttributeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAtSignTokenAndAttributeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAtSignTokenAndAttributeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAtSignTokenAndAttributeName` replaced.
  /// - param newChild: The new `unexpectedBetweenAtSignTokenAndAttributeName` to replace the node's
  ///                   current `unexpectedBetweenAtSignTokenAndAttributeName`, if present.
  public func withUnexpectedBetweenAtSignTokenAndAttributeName(
    _ newChild: UnexpectedNodesSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAtSignTokenAndAttributeName)
    return CustomAttributeSyntax(newData)
  }

  /// The name of the attribute.
  public var attributeName: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.attributeName,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withAttributeName(value)
    }
  }

  /// Returns a copy of the receiver with its `attributeName` replaced.
  /// - param newChild: The new `attributeName` to replace the node's
  ///                   current `attributeName`, if present.
  public func withAttributeName(
    _ newChild: TypeSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.attributeName)
    return CustomAttributeSyntax(newData)
  }

  public var unexpectedBetweenAttributeNameAndLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAttributeNameAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAttributeNameAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAttributeNameAndLeftParen` replaced.
  /// - param newChild: The new `unexpectedBetweenAttributeNameAndLeftParen` to replace the node's
  ///                   current `unexpectedBetweenAttributeNameAndLeftParen`, if present.
  public func withUnexpectedBetweenAttributeNameAndLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAttributeNameAndLeftParen)
    return CustomAttributeSyntax(newData)
  }

  public var leftParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return CustomAttributeSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndArgumentList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndArgumentList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndArgumentList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndArgumentList` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndArgumentList` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndArgumentList`, if present.
  public func withUnexpectedBetweenLeftParenAndArgumentList(
    _ newChild: UnexpectedNodesSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndArgumentList)
    return CustomAttributeSyntax(newData)
  }

  public var argumentList: TupleExprElementListSyntax? {
    get {
      let childData = data.child(at: Cursor.argumentList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TupleExprElementListSyntax(childData!)
    }
    set(value) {
      self = withArgumentList(value)
    }
  }

  /// Adds the provided `Argument` to the node's `argumentList`
  /// collection.
  /// - param element: The new `Argument` to add to the node's
  ///                  `argumentList` collection.
  /// - returns: A copy of the receiver with the provided `Argument`
  ///            appended to its `argumentList` collection.
  public func addArgument(_ element: TupleExprElementSyntax) -> CustomAttributeSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.argumentList] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tupleExprElementList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.argumentList)
    return CustomAttributeSyntax(newData)
  }

  /// Returns a copy of the receiver with its `argumentList` replaced.
  /// - param newChild: The new `argumentList` to replace the node's
  ///                   current `argumentList`, if present.
  public func withArgumentList(
    _ newChild: TupleExprElementListSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.argumentList)
    return CustomAttributeSyntax(newData)
  }

  public var unexpectedBetweenArgumentListAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenArgumentListAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenArgumentListAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenArgumentListAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenArgumentListAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenArgumentListAndRightParen`, if present.
  public func withUnexpectedBetweenArgumentListAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenArgumentListAndRightParen)
    return CustomAttributeSyntax(newData)
  }

  public var rightParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> CustomAttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return CustomAttributeSyntax(newData)
  }
}

extension CustomAttributeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAtSignToken": unexpectedBeforeAtSignToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "atSignToken": Syntax(atSignToken).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAtSignTokenAndAttributeName": unexpectedBetweenAtSignTokenAndAttributeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributeName": Syntax(attributeName).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAttributeNameAndLeftParen": unexpectedBetweenAttributeNameAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": leftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenLeftParenAndArgumentList": unexpectedBetweenLeftParenAndArgumentList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "argumentList": argumentList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenArgumentListAndRightParen": unexpectedBetweenArgumentListAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": rightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AttributeSyntax

/// 
/// An `@` attribute.
/// 
public struct AttributeSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeAtSignToken
    case atSignToken
    case unexpectedBetweenAtSignTokenAndAttributeName
    case attributeName
    case unexpectedBetweenAttributeNameAndLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndArgument
    case argument
    case unexpectedBetweenArgumentAndRightParen
    case rightParen
    case unexpectedBetweenRightParenAndTokenList
    case tokenList
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AttributeSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .attribute else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AttributeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .attribute)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeAtSignToken: UnexpectedNodesSyntax? = nil,
    atSignToken: TokenSyntax,
    _ unexpectedBetweenAtSignTokenAndAttributeName: UnexpectedNodesSyntax? = nil,
    attributeName: TokenSyntax,
    _ unexpectedBetweenAttributeNameAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax?,
    _ unexpectedBetweenLeftParenAndArgument: UnexpectedNodesSyntax? = nil,
    argument: Syntax?,
    _ unexpectedBetweenArgumentAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax?,
    _ unexpectedBetweenRightParenAndTokenList: UnexpectedNodesSyntax? = nil,
    tokenList: TokenListSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAtSignToken?.raw,
      atSignToken.raw,
      unexpectedBetweenAtSignTokenAndAttributeName?.raw,
      attributeName.raw,
      unexpectedBetweenAttributeNameAndLeftParen?.raw,
      leftParen?.raw,
      unexpectedBetweenLeftParenAndArgument?.raw,
      argument?.raw,
      unexpectedBetweenArgumentAndRightParen?.raw,
      rightParen?.raw,
      unexpectedBetweenRightParenAndTokenList?.raw,
      tokenList?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.attribute,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeAtSignToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeAtSignToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAtSignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAtSignToken` replaced.
  /// - param newChild: The new `unexpectedBeforeAtSignToken` to replace the node's
  ///                   current `unexpectedBeforeAtSignToken`, if present.
  public func withUnexpectedBeforeAtSignToken(
    _ newChild: UnexpectedNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeAtSignToken)
    return AttributeSyntax(newData)
  }

  /// The `@` sign.
  public var atSignToken: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.atSignToken,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAtSignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `atSignToken` replaced.
  /// - param newChild: The new `atSignToken` to replace the node's
  ///                   current `atSignToken`, if present.
  public func withAtSignToken(
    _ newChild: TokenSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.atSign, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.atSignToken)
    return AttributeSyntax(newData)
  }

  public var unexpectedBetweenAtSignTokenAndAttributeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAtSignTokenAndAttributeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAtSignTokenAndAttributeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAtSignTokenAndAttributeName` replaced.
  /// - param newChild: The new `unexpectedBetweenAtSignTokenAndAttributeName` to replace the node's
  ///                   current `unexpectedBetweenAtSignTokenAndAttributeName`, if present.
  public func withUnexpectedBetweenAtSignTokenAndAttributeName(
    _ newChild: UnexpectedNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAtSignTokenAndAttributeName)
    return AttributeSyntax(newData)
  }

  /// The name of the attribute.
  public var attributeName: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.attributeName,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAttributeName(value)
    }
  }

  /// Returns a copy of the receiver with its `attributeName` replaced.
  /// - param newChild: The new `attributeName` to replace the node's
  ///                   current `attributeName`, if present.
  public func withAttributeName(
    _ newChild: TokenSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.unknown(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.attributeName)
    return AttributeSyntax(newData)
  }

  public var unexpectedBetweenAttributeNameAndLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAttributeNameAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAttributeNameAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAttributeNameAndLeftParen` replaced.
  /// - param newChild: The new `unexpectedBetweenAttributeNameAndLeftParen` to replace the node's
  ///                   current `unexpectedBetweenAttributeNameAndLeftParen`, if present.
  public func withUnexpectedBetweenAttributeNameAndLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAttributeNameAndLeftParen)
    return AttributeSyntax(newData)
  }

  /// 
  /// If the attribute takes arguments, the opening parenthesis.
  /// 
  public var leftParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return AttributeSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndArgument: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndArgument,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndArgument(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndArgument` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndArgument` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndArgument`, if present.
  public func withUnexpectedBetweenLeftParenAndArgument(
    _ newChild: UnexpectedNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndArgument)
    return AttributeSyntax(newData)
  }

  /// 
  /// The arguments of the attribute. In case the attribute
  /// takes multiple arguments, they are gather in the
  /// appropriate takes first.
  /// 
  public var argument: Syntax? {
    get {
      let childData = data.child(at: Cursor.argument,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return Syntax(childData!)
    }
    set(value) {
      self = withArgument(value)
    }
  }

  /// Returns a copy of the receiver with its `argument` replaced.
  /// - param newChild: The new `argument` to replace the node's
  ///                   current `argument`, if present.
  public func withArgument(
    _ newChild: Syntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.argument)
    return AttributeSyntax(newData)
  }

  public var unexpectedBetweenArgumentAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenArgumentAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenArgumentAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenArgumentAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenArgumentAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenArgumentAndRightParen`, if present.
  public func withUnexpectedBetweenArgumentAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenArgumentAndRightParen)
    return AttributeSyntax(newData)
  }

  /// 
  /// If the attribute takes arguments, the closing parenthesis.
  /// 
  public var rightParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return AttributeSyntax(newData)
  }

  public var unexpectedBetweenRightParenAndTokenList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenRightParenAndTokenList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenRightParenAndTokenList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenRightParenAndTokenList` replaced.
  /// - param newChild: The new `unexpectedBetweenRightParenAndTokenList` to replace the node's
  ///                   current `unexpectedBetweenRightParenAndTokenList`, if present.
  public func withUnexpectedBetweenRightParenAndTokenList(
    _ newChild: UnexpectedNodesSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenRightParenAndTokenList)
    return AttributeSyntax(newData)
  }

  public var tokenList: TokenListSyntax? {
    get {
      let childData = data.child(at: Cursor.tokenList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenListSyntax(childData!)
    }
    set(value) {
      self = withTokenList(value)
    }
  }

  /// Adds the provided `Token` to the node's `tokenList`
  /// collection.
  /// - param element: The new `Token` to add to the node's
  ///                  `tokenList` collection.
  /// - returns: A copy of the receiver with the provided `Token`
  ///            appended to its `tokenList` collection.
  public func addToken(_ element: TokenSyntax) -> AttributeSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.tokenList] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tokenList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.tokenList)
    return AttributeSyntax(newData)
  }

  /// Returns a copy of the receiver with its `tokenList` replaced.
  /// - param newChild: The new `tokenList` to replace the node's
  ///                   current `tokenList`, if present.
  public func withTokenList(
    _ newChild: TokenListSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.tokenList)
    return AttributeSyntax(newData)
  }
}

extension AttributeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAtSignToken": unexpectedBeforeAtSignToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "atSignToken": Syntax(atSignToken).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAtSignTokenAndAttributeName": unexpectedBetweenAtSignTokenAndAttributeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributeName": Syntax(attributeName).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAttributeNameAndLeftParen": unexpectedBetweenAttributeNameAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": leftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenLeftParenAndArgument": unexpectedBetweenLeftParenAndArgument.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "argument": argument.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenArgumentAndRightParen": unexpectedBetweenArgumentAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": rightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenRightParenAndTokenList": unexpectedBetweenRightParenAndTokenList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "tokenList": tokenList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AvailabilityEntrySyntax

/// 
/// The availability argument for the _specialize attribute
/// 
public struct AvailabilityEntrySyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLabel
    case label
    case unexpectedBetweenLabelAndColon
    case colon
    case unexpectedBetweenColonAndAvailabilityList
    case availabilityList
    case unexpectedBetweenAvailabilityListAndSemicolon
    case semicolon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AvailabilityEntrySyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .availabilityEntry else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AvailabilityEntrySyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .availabilityEntry)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLabel: UnexpectedNodesSyntax? = nil,
    label: TokenSyntax,
    _ unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndAvailabilityList: UnexpectedNodesSyntax? = nil,
    availabilityList: AvailabilitySpecListSyntax,
    _ unexpectedBetweenAvailabilityListAndSemicolon: UnexpectedNodesSyntax? = nil,
    semicolon: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLabel?.raw,
      label.raw,
      unexpectedBetweenLabelAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndAvailabilityList?.raw,
      availabilityList.raw,
      unexpectedBetweenAvailabilityListAndSemicolon?.raw,
      semicolon.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.availabilityEntry,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLabel` replaced.
  /// - param newChild: The new `unexpectedBeforeLabel` to replace the node's
  ///                   current `unexpectedBeforeLabel`, if present.
  public func withUnexpectedBeforeLabel(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLabel)
    return AvailabilityEntrySyntax(newData)
  }

  /// The label of the argument
  public var label: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.label)
    return AvailabilityEntrySyntax(newData)
  }

  public var unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLabelAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenLabelAndColon` to replace the node's
  ///                   current `unexpectedBetweenLabelAndColon`, if present.
  public func withUnexpectedBetweenLabelAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLabelAndColon)
    return AvailabilityEntrySyntax(newData)
  }

  /// The colon separating the label and the value
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return AvailabilityEntrySyntax(newData)
  }

  public var unexpectedBetweenColonAndAvailabilityList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndAvailabilityList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndAvailabilityList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndAvailabilityList` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndAvailabilityList` to replace the node's
  ///                   current `unexpectedBetweenColonAndAvailabilityList`, if present.
  public func withUnexpectedBetweenColonAndAvailabilityList(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndAvailabilityList)
    return AvailabilityEntrySyntax(newData)
  }

  public var availabilityList: AvailabilitySpecListSyntax {
    get {
      let childData = data.child(at: Cursor.availabilityList,
                                 parent: Syntax(self))
      return AvailabilitySpecListSyntax(childData!)
    }
    set(value) {
      self = withAvailabilityList(value)
    }
  }

  /// Adds the provided `Availability` to the node's `availabilityList`
  /// collection.
  /// - param element: The new `Availability` to add to the node's
  ///                  `availabilityList` collection.
  /// - returns: A copy of the receiver with the provided `Availability`
  ///            appended to its `availabilityList` collection.
  public func addAvailability(_ element: AvailabilityArgumentSyntax) -> AvailabilityEntrySyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.availabilityList] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.availabilitySpecList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.availabilityList)
    return AvailabilityEntrySyntax(newData)
  }

  /// Returns a copy of the receiver with its `availabilityList` replaced.
  /// - param newChild: The new `availabilityList` to replace the node's
  ///                   current `availabilityList`, if present.
  public func withAvailabilityList(
    _ newChild: AvailabilitySpecListSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.availabilitySpecList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.availabilityList)
    return AvailabilityEntrySyntax(newData)
  }

  public var unexpectedBetweenAvailabilityListAndSemicolon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAvailabilityListAndSemicolon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAvailabilityListAndSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAvailabilityListAndSemicolon` replaced.
  /// - param newChild: The new `unexpectedBetweenAvailabilityListAndSemicolon` to replace the node's
  ///                   current `unexpectedBetweenAvailabilityListAndSemicolon`, if present.
  public func withUnexpectedBetweenAvailabilityListAndSemicolon(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAvailabilityListAndSemicolon)
    return AvailabilityEntrySyntax(newData)
  }

  public var semicolon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.semicolon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSemicolon(value)
    }
  }

  /// Returns a copy of the receiver with its `semicolon` replaced.
  /// - param newChild: The new `semicolon` to replace the node's
  ///                   current `semicolon`, if present.
  public func withSemicolon(
    _ newChild: TokenSyntax?) -> AvailabilityEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.semicolon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.semicolon)
    return AvailabilityEntrySyntax(newData)
  }
}

extension AvailabilityEntrySyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLabel": unexpectedBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLabelAndColon": unexpectedBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndAvailabilityList": unexpectedBetweenColonAndAvailabilityList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "availabilityList": Syntax(availabilityList).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAvailabilityListAndSemicolon": unexpectedBetweenAvailabilityListAndSemicolon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "semicolon": Syntax(semicolon).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - LabeledSpecializeEntrySyntax

/// 
/// A labeled argument for the `@_specialize` attribute like
/// `exported: true`
/// 
public struct LabeledSpecializeEntrySyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLabel
    case label
    case unexpectedBetweenLabelAndColon
    case colon
    case unexpectedBetweenColonAndValue
    case value
    case unexpectedBetweenValueAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `LabeledSpecializeEntrySyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .labeledSpecializeEntry else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `LabeledSpecializeEntrySyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .labeledSpecializeEntry)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLabel: UnexpectedNodesSyntax? = nil,
    label: TokenSyntax,
    _ unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndValue: UnexpectedNodesSyntax? = nil,
    value: TokenSyntax,
    _ unexpectedBetweenValueAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLabel?.raw,
      label.raw,
      unexpectedBetweenLabelAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndValue?.raw,
      value.raw,
      unexpectedBetweenValueAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.labeledSpecializeEntry,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLabel` replaced.
  /// - param newChild: The new `unexpectedBeforeLabel` to replace the node's
  ///                   current `unexpectedBeforeLabel`, if present.
  public func withUnexpectedBeforeLabel(
    _ newChild: UnexpectedNodesSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLabel)
    return LabeledSpecializeEntrySyntax(newData)
  }

  /// The label of the argument
  public var label: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.label)
    return LabeledSpecializeEntrySyntax(newData)
  }

  public var unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLabelAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenLabelAndColon` to replace the node's
  ///                   current `unexpectedBetweenLabelAndColon`, if present.
  public func withUnexpectedBetweenLabelAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLabelAndColon)
    return LabeledSpecializeEntrySyntax(newData)
  }

  /// The colon separating the label and the value
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return LabeledSpecializeEntrySyntax(newData)
  }

  public var unexpectedBetweenColonAndValue: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndValue(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndValue` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndValue` to replace the node's
  ///                   current `unexpectedBetweenColonAndValue`, if present.
  public func withUnexpectedBetweenColonAndValue(
    _ newChild: UnexpectedNodesSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndValue)
    return LabeledSpecializeEntrySyntax(newData)
  }

  /// The value for this argument
  public var value: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.value,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withValue(value)
    }
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: TokenSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.unknown(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.value)
    return LabeledSpecializeEntrySyntax(newData)
  }

  public var unexpectedBetweenValueAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenValueAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenValueAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenValueAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenValueAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenValueAndTrailingComma`, if present.
  public func withUnexpectedBetweenValueAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenValueAndTrailingComma)
    return LabeledSpecializeEntrySyntax(newData)
  }

  /// 
  /// A trailing comma if this argument is followed by another one
  /// 
  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> LabeledSpecializeEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return LabeledSpecializeEntrySyntax(newData)
  }
}

extension LabeledSpecializeEntrySyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLabel": unexpectedBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLabelAndColon": unexpectedBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndValue": unexpectedBetweenColonAndValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "value": Syntax(value).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenValueAndTrailingComma": unexpectedBetweenValueAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TargetFunctionEntrySyntax

/// 
/// A labeled argument for the `@_specialize` attribute with a function
/// decl value like
/// `target: myFunc(_:)`
/// 
public struct TargetFunctionEntrySyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLabel
    case label
    case unexpectedBetweenLabelAndColon
    case colon
    case unexpectedBetweenColonAndDeclname
    case declname
    case unexpectedBetweenDeclnameAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TargetFunctionEntrySyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .targetFunctionEntry else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TargetFunctionEntrySyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .targetFunctionEntry)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLabel: UnexpectedNodesSyntax? = nil,
    label: TokenSyntax,
    _ unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndDeclname: UnexpectedNodesSyntax? = nil,
    declname: DeclNameSyntax,
    _ unexpectedBetweenDeclnameAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLabel?.raw,
      label.raw,
      unexpectedBetweenLabelAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndDeclname?.raw,
      declname.raw,
      unexpectedBetweenDeclnameAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.targetFunctionEntry,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLabel` replaced.
  /// - param newChild: The new `unexpectedBeforeLabel` to replace the node's
  ///                   current `unexpectedBeforeLabel`, if present.
  public func withUnexpectedBeforeLabel(
    _ newChild: UnexpectedNodesSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLabel)
    return TargetFunctionEntrySyntax(newData)
  }

  /// The label of the argument
  public var label: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.label)
    return TargetFunctionEntrySyntax(newData)
  }

  public var unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLabelAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenLabelAndColon` to replace the node's
  ///                   current `unexpectedBetweenLabelAndColon`, if present.
  public func withUnexpectedBetweenLabelAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLabelAndColon)
    return TargetFunctionEntrySyntax(newData)
  }

  /// The colon separating the label and the value
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return TargetFunctionEntrySyntax(newData)
  }

  public var unexpectedBetweenColonAndDeclname: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndDeclname,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndDeclname(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndDeclname` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndDeclname` to replace the node's
  ///                   current `unexpectedBetweenColonAndDeclname`, if present.
  public func withUnexpectedBetweenColonAndDeclname(
    _ newChild: UnexpectedNodesSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndDeclname)
    return TargetFunctionEntrySyntax(newData)
  }

  /// The value for this argument
  public var declname: DeclNameSyntax {
    get {
      let childData = data.child(at: Cursor.declname,
                                 parent: Syntax(self))
      return DeclNameSyntax(childData!)
    }
    set(value) {
      self = withDeclname(value)
    }
  }

  /// Returns a copy of the receiver with its `declname` replaced.
  /// - param newChild: The new `declname` to replace the node's
  ///                   current `declname`, if present.
  public func withDeclname(
    _ newChild: DeclNameSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.declName, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.declname)
    return TargetFunctionEntrySyntax(newData)
  }

  public var unexpectedBetweenDeclnameAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDeclnameAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDeclnameAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDeclnameAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenDeclnameAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenDeclnameAndTrailingComma`, if present.
  public func withUnexpectedBetweenDeclnameAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDeclnameAndTrailingComma)
    return TargetFunctionEntrySyntax(newData)
  }

  /// 
  /// A trailing comma if this argument is followed by another one
  /// 
  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> TargetFunctionEntrySyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return TargetFunctionEntrySyntax(newData)
  }
}

extension TargetFunctionEntrySyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLabel": unexpectedBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLabelAndColon": unexpectedBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndDeclname": unexpectedBetweenColonAndDeclname.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declname": Syntax(declname).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenDeclnameAndTrailingComma": unexpectedBetweenDeclnameAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - NamedAttributeStringArgumentSyntax

/// 
/// The argument for the `@_dynamic_replacement` or `@_private`
/// attribute of the form `for: "function()"` or `sourceFile:
/// "Src.swift"`
/// 
public struct NamedAttributeStringArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeNameTok
    case nameTok
    case unexpectedBetweenNameTokAndColon
    case colon
    case unexpectedBetweenColonAndStringOrDeclname
    case stringOrDeclname
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `NamedAttributeStringArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .namedAttributeStringArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `NamedAttributeStringArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .namedAttributeStringArgument)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeNameTok: UnexpectedNodesSyntax? = nil,
    nameTok: TokenSyntax,
    _ unexpectedBetweenNameTokAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndStringOrDeclname: UnexpectedNodesSyntax? = nil,
    stringOrDeclname: Syntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeNameTok?.raw,
      nameTok.raw,
      unexpectedBetweenNameTokAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndStringOrDeclname?.raw,
      stringOrDeclname.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.namedAttributeStringArgument,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeNameTok: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeNameTok,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeNameTok(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeNameTok` replaced.
  /// - param newChild: The new `unexpectedBeforeNameTok` to replace the node's
  ///                   current `unexpectedBeforeNameTok`, if present.
  public func withUnexpectedBeforeNameTok(
    _ newChild: UnexpectedNodesSyntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeNameTok)
    return NamedAttributeStringArgumentSyntax(newData)
  }

  /// The label of the argument
  public var nameTok: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.nameTok,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withNameTok(value)
    }
  }

  /// Returns a copy of the receiver with its `nameTok` replaced.
  /// - param newChild: The new `nameTok` to replace the node's
  ///                   current `nameTok`, if present.
  public func withNameTok(
    _ newChild: TokenSyntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.unknown(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.nameTok)
    return NamedAttributeStringArgumentSyntax(newData)
  }

  public var unexpectedBetweenNameTokAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameTokAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameTokAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameTokAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenNameTokAndColon` to replace the node's
  ///                   current `unexpectedBetweenNameTokAndColon`, if present.
  public func withUnexpectedBetweenNameTokAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameTokAndColon)
    return NamedAttributeStringArgumentSyntax(newData)
  }

  /// The colon separating the label and the value
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return NamedAttributeStringArgumentSyntax(newData)
  }

  public var unexpectedBetweenColonAndStringOrDeclname: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndStringOrDeclname,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndStringOrDeclname(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndStringOrDeclname` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndStringOrDeclname` to replace the node's
  ///                   current `unexpectedBetweenColonAndStringOrDeclname`, if present.
  public func withUnexpectedBetweenColonAndStringOrDeclname(
    _ newChild: UnexpectedNodesSyntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndStringOrDeclname)
    return NamedAttributeStringArgumentSyntax(newData)
  }

  public var stringOrDeclname: Syntax {
    get {
      let childData = data.child(at: Cursor.stringOrDeclname,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withStringOrDeclname(value)
    }
  }

  /// Returns a copy of the receiver with its `stringOrDeclname` replaced.
  /// - param newChild: The new `stringOrDeclname` to replace the node's
  ///                   current `stringOrDeclname`, if present.
  public func withStringOrDeclname(
    _ newChild: Syntax?) -> NamedAttributeStringArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.stringOrDeclname)
    return NamedAttributeStringArgumentSyntax(newData)
  }
}

extension NamedAttributeStringArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeNameTok": unexpectedBeforeNameTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "nameTok": Syntax(nameTok).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameTokAndColon": unexpectedBetweenNameTokAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndStringOrDeclname": unexpectedBetweenColonAndStringOrDeclname.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "stringOrDeclname": Syntax(stringOrDeclname).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DeclNameSyntax

public struct DeclNameSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeDeclBaseName
    case declBaseName
    case unexpectedBetweenDeclBaseNameAndDeclNameArguments
    case declNameArguments
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DeclNameSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .declName else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DeclNameSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .declName)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeDeclBaseName: UnexpectedNodesSyntax? = nil,
    declBaseName: Syntax,
    _ unexpectedBetweenDeclBaseNameAndDeclNameArguments: UnexpectedNodesSyntax? = nil,
    declNameArguments: DeclNameArgumentsSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeDeclBaseName?.raw,
      declBaseName.raw,
      unexpectedBetweenDeclBaseNameAndDeclNameArguments?.raw,
      declNameArguments?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.declName,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeDeclBaseName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeDeclBaseName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeDeclBaseName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeDeclBaseName` replaced.
  /// - param newChild: The new `unexpectedBeforeDeclBaseName` to replace the node's
  ///                   current `unexpectedBeforeDeclBaseName`, if present.
  public func withUnexpectedBeforeDeclBaseName(
    _ newChild: UnexpectedNodesSyntax?) -> DeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeDeclBaseName)
    return DeclNameSyntax(newData)
  }

  /// 
  /// The base name of the protocol's requirement.
  /// 
  public var declBaseName: Syntax {
    get {
      let childData = data.child(at: Cursor.declBaseName,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withDeclBaseName(value)
    }
  }

  /// Returns a copy of the receiver with its `declBaseName` replaced.
  /// - param newChild: The new `declBaseName` to replace the node's
  ///                   current `declBaseName`, if present.
  public func withDeclBaseName(
    _ newChild: Syntax?) -> DeclNameSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.declBaseName)
    return DeclNameSyntax(newData)
  }

  public var unexpectedBetweenDeclBaseNameAndDeclNameArguments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDeclBaseNameAndDeclNameArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDeclBaseNameAndDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDeclBaseNameAndDeclNameArguments` replaced.
  /// - param newChild: The new `unexpectedBetweenDeclBaseNameAndDeclNameArguments` to replace the node's
  ///                   current `unexpectedBetweenDeclBaseNameAndDeclNameArguments`, if present.
  public func withUnexpectedBetweenDeclBaseNameAndDeclNameArguments(
    _ newChild: UnexpectedNodesSyntax?) -> DeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDeclBaseNameAndDeclNameArguments)
    return DeclNameSyntax(newData)
  }

  /// 
  /// The argument labels of the protocol's requirement if it
  /// is a function requirement.
  /// 
  public var declNameArguments: DeclNameArgumentsSyntax? {
    get {
      let childData = data.child(at: Cursor.declNameArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclNameArgumentsSyntax(childData!)
    }
    set(value) {
      self = withDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `declNameArguments` replaced.
  /// - param newChild: The new `declNameArguments` to replace the node's
  ///                   current `declNameArguments`, if present.
  public func withDeclNameArguments(
    _ newChild: DeclNameArgumentsSyntax?) -> DeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.declNameArguments)
    return DeclNameSyntax(newData)
  }
}

extension DeclNameSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeDeclBaseName": unexpectedBeforeDeclBaseName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declBaseName": Syntax(declBaseName).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenDeclBaseNameAndDeclNameArguments": unexpectedBetweenDeclBaseNameAndDeclNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declNameArguments": declNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ImplementsAttributeArgumentsSyntax

/// 
/// The arguments for the `@_implements` attribute of the form
/// `Type, methodName(arg1Label:arg2Label:)`
/// 
public struct ImplementsAttributeArgumentsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeType
    case type
    case unexpectedBetweenTypeAndComma
    case comma
    case unexpectedBetweenCommaAndDeclBaseName
    case declBaseName
    case unexpectedBetweenDeclBaseNameAndDeclNameArguments
    case declNameArguments
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ImplementsAttributeArgumentsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .implementsAttributeArguments else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ImplementsAttributeArgumentsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .implementsAttributeArguments)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeType: UnexpectedNodesSyntax? = nil,
    type: SimpleTypeIdentifierSyntax,
    _ unexpectedBetweenTypeAndComma: UnexpectedNodesSyntax? = nil,
    comma: TokenSyntax,
    _ unexpectedBetweenCommaAndDeclBaseName: UnexpectedNodesSyntax? = nil,
    declBaseName: Syntax,
    _ unexpectedBetweenDeclBaseNameAndDeclNameArguments: UnexpectedNodesSyntax? = nil,
    declNameArguments: DeclNameArgumentsSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeType?.raw,
      type.raw,
      unexpectedBetweenTypeAndComma?.raw,
      comma.raw,
      unexpectedBetweenCommaAndDeclBaseName?.raw,
      declBaseName.raw,
      unexpectedBetweenDeclBaseNameAndDeclNameArguments?.raw,
      declNameArguments?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.implementsAttributeArguments,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeType: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeType(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeType` replaced.
  /// - param newChild: The new `unexpectedBeforeType` to replace the node's
  ///                   current `unexpectedBeforeType`, if present.
  public func withUnexpectedBeforeType(
    _ newChild: UnexpectedNodesSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeType)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The type for which the method with this attribute
  /// implements a requirement.
  /// 
  public var type: SimpleTypeIdentifierSyntax {
    get {
      let childData = data.child(at: Cursor.type,
                                 parent: Syntax(self))
      return SimpleTypeIdentifierSyntax(childData!)
    }
    set(value) {
      self = withType(value)
    }
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: SimpleTypeIdentifierSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.simpleTypeIdentifier, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.type)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenTypeAndComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenTypeAndComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTypeAndComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTypeAndComma` replaced.
  /// - param newChild: The new `unexpectedBetweenTypeAndComma` to replace the node's
  ///                   current `unexpectedBetweenTypeAndComma`, if present.
  public func withUnexpectedBetweenTypeAndComma(
    _ newChild: UnexpectedNodesSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenTypeAndComma)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The comma separating the type and method name
  /// 
  public var comma: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.comma,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withComma(value)
    }
  }

  /// Returns a copy of the receiver with its `comma` replaced.
  /// - param newChild: The new `comma` to replace the node's
  ///                   current `comma`, if present.
  public func withComma(
    _ newChild: TokenSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.comma, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.comma)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenCommaAndDeclBaseName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenCommaAndDeclBaseName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCommaAndDeclBaseName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCommaAndDeclBaseName` replaced.
  /// - param newChild: The new `unexpectedBetweenCommaAndDeclBaseName` to replace the node's
  ///                   current `unexpectedBetweenCommaAndDeclBaseName`, if present.
  public func withUnexpectedBetweenCommaAndDeclBaseName(
    _ newChild: UnexpectedNodesSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenCommaAndDeclBaseName)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The base name of the protocol's requirement.
  /// 
  public var declBaseName: Syntax {
    get {
      let childData = data.child(at: Cursor.declBaseName,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withDeclBaseName(value)
    }
  }

  /// Returns a copy of the receiver with its `declBaseName` replaced.
  /// - param newChild: The new `declBaseName` to replace the node's
  ///                   current `declBaseName`, if present.
  public func withDeclBaseName(
    _ newChild: Syntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.declBaseName)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenDeclBaseNameAndDeclNameArguments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDeclBaseNameAndDeclNameArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDeclBaseNameAndDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDeclBaseNameAndDeclNameArguments` replaced.
  /// - param newChild: The new `unexpectedBetweenDeclBaseNameAndDeclNameArguments` to replace the node's
  ///                   current `unexpectedBetweenDeclBaseNameAndDeclNameArguments`, if present.
  public func withUnexpectedBetweenDeclBaseNameAndDeclNameArguments(
    _ newChild: UnexpectedNodesSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDeclBaseNameAndDeclNameArguments)
    return ImplementsAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The argument labels of the protocol's requirement if it
  /// is a function requirement.
  /// 
  public var declNameArguments: DeclNameArgumentsSyntax? {
    get {
      let childData = data.child(at: Cursor.declNameArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclNameArgumentsSyntax(childData!)
    }
    set(value) {
      self = withDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `declNameArguments` replaced.
  /// - param newChild: The new `declNameArguments` to replace the node's
  ///                   current `declNameArguments`, if present.
  public func withDeclNameArguments(
    _ newChild: DeclNameArgumentsSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.declNameArguments)
    return ImplementsAttributeArgumentsSyntax(newData)
  }
}

extension ImplementsAttributeArgumentsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeType": unexpectedBeforeType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": Syntax(type).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenTypeAndComma": unexpectedBetweenTypeAndComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "comma": Syntax(comma).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenCommaAndDeclBaseName": unexpectedBetweenCommaAndDeclBaseName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declBaseName": Syntax(declBaseName).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenDeclBaseNameAndDeclNameArguments": unexpectedBetweenDeclBaseNameAndDeclNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declNameArguments": declNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ObjCSelectorPieceSyntax

/// 
/// A piece of an Objective-C selector. Either consisting of just an
/// identifier for a nullary selector, an identifier and a colon for a
/// labeled argument or just a colon for an unlabeled argument
/// 
public struct ObjCSelectorPieceSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeName
    case name
    case unexpectedBetweenNameAndColon
    case colon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ObjCSelectorPieceSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .objCSelectorPiece else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ObjCSelectorPieceSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .objCSelectorPiece)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax?,
    _ unexpectedBetweenNameAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeName?.raw,
      name?.raw,
      unexpectedBetweenNameAndColon?.raw,
      colon?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.objCSelectorPiece,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeName` replaced.
  /// - param newChild: The new `unexpectedBeforeName` to replace the node's
  ///                   current `unexpectedBeforeName`, if present.
  public func withUnexpectedBeforeName(
    _ newChild: UnexpectedNodesSyntax?) -> ObjCSelectorPieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeName)
    return ObjCSelectorPieceSyntax(newData)
  }

  public var name: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ObjCSelectorPieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.name)
    return ObjCSelectorPieceSyntax(newData)
  }

  public var unexpectedBetweenNameAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndColon` to replace the node's
  ///                   current `unexpectedBetweenNameAndColon`, if present.
  public func withUnexpectedBetweenNameAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> ObjCSelectorPieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndColon)
    return ObjCSelectorPieceSyntax(newData)
  }

  public var colon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> ObjCSelectorPieceSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return ObjCSelectorPieceSyntax(newData)
  }
}

extension ObjCSelectorPieceSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeName": unexpectedBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": name.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenNameAndColon": unexpectedBetweenNameAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": colon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DifferentiableAttributeArgumentsSyntax

/// 
/// The arguments for the `@differentiable` attribute: an optional
/// differentiability kind, an optional differentiability parameter clause,
/// and an optional 'where' clause.
/// 
public struct DifferentiableAttributeArgumentsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeDiffKind
    case diffKind
    case unexpectedBetweenDiffKindAndDiffKindComma
    case diffKindComma
    case unexpectedBetweenDiffKindCommaAndDiffParams
    case diffParams
    case unexpectedBetweenDiffParamsAndDiffParamsComma
    case diffParamsComma
    case unexpectedBetweenDiffParamsCommaAndWhereClause
    case whereClause
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DifferentiableAttributeArgumentsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .differentiableAttributeArguments else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DifferentiableAttributeArgumentsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .differentiableAttributeArguments)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeDiffKind: UnexpectedNodesSyntax? = nil,
    diffKind: TokenSyntax?,
    _ unexpectedBetweenDiffKindAndDiffKindComma: UnexpectedNodesSyntax? = nil,
    diffKindComma: TokenSyntax?,
    _ unexpectedBetweenDiffKindCommaAndDiffParams: UnexpectedNodesSyntax? = nil,
    diffParams: DifferentiabilityParamsClauseSyntax?,
    _ unexpectedBetweenDiffParamsAndDiffParamsComma: UnexpectedNodesSyntax? = nil,
    diffParamsComma: TokenSyntax?,
    _ unexpectedBetweenDiffParamsCommaAndWhereClause: UnexpectedNodesSyntax? = nil,
    whereClause: GenericWhereClauseSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeDiffKind?.raw,
      diffKind?.raw,
      unexpectedBetweenDiffKindAndDiffKindComma?.raw,
      diffKindComma?.raw,
      unexpectedBetweenDiffKindCommaAndDiffParams?.raw,
      diffParams?.raw,
      unexpectedBetweenDiffParamsAndDiffParamsComma?.raw,
      diffParamsComma?.raw,
      unexpectedBetweenDiffParamsCommaAndWhereClause?.raw,
      whereClause?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.differentiableAttributeArguments,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeDiffKind: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeDiffKind,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeDiffKind(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeDiffKind` replaced.
  /// - param newChild: The new `unexpectedBeforeDiffKind` to replace the node's
  ///                   current `unexpectedBeforeDiffKind`, if present.
  public func withUnexpectedBeforeDiffKind(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeDiffKind)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var diffKind: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.diffKind,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDiffKind(value)
    }
  }

  /// Returns a copy of the receiver with its `diffKind` replaced.
  /// - param newChild: The new `diffKind` to replace the node's
  ///                   current `diffKind`, if present.
  public func withDiffKind(
    _ newChild: TokenSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.diffKind)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenDiffKindAndDiffKindComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDiffKindAndDiffKindComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDiffKindAndDiffKindComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDiffKindAndDiffKindComma` replaced.
  /// - param newChild: The new `unexpectedBetweenDiffKindAndDiffKindComma` to replace the node's
  ///                   current `unexpectedBetweenDiffKindAndDiffKindComma`, if present.
  public func withUnexpectedBetweenDiffKindAndDiffKindComma(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDiffKindAndDiffKindComma)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The comma following the differentiability kind, if it exists.
  /// 
  public var diffKindComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.diffKindComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDiffKindComma(value)
    }
  }

  /// Returns a copy of the receiver with its `diffKindComma` replaced.
  /// - param newChild: The new `diffKindComma` to replace the node's
  ///                   current `diffKindComma`, if present.
  public func withDiffKindComma(
    _ newChild: TokenSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.diffKindComma)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenDiffKindCommaAndDiffParams: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDiffKindCommaAndDiffParams,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDiffKindCommaAndDiffParams(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDiffKindCommaAndDiffParams` replaced.
  /// - param newChild: The new `unexpectedBetweenDiffKindCommaAndDiffParams` to replace the node's
  ///                   current `unexpectedBetweenDiffKindCommaAndDiffParams`, if present.
  public func withUnexpectedBetweenDiffKindCommaAndDiffParams(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDiffKindCommaAndDiffParams)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var diffParams: DifferentiabilityParamsClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.diffParams,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DifferentiabilityParamsClauseSyntax(childData!)
    }
    set(value) {
      self = withDiffParams(value)
    }
  }

  /// Returns a copy of the receiver with its `diffParams` replaced.
  /// - param newChild: The new `diffParams` to replace the node's
  ///                   current `diffParams`, if present.
  public func withDiffParams(
    _ newChild: DifferentiabilityParamsClauseSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.diffParams)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenDiffParamsAndDiffParamsComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDiffParamsAndDiffParamsComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDiffParamsAndDiffParamsComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDiffParamsAndDiffParamsComma` replaced.
  /// - param newChild: The new `unexpectedBetweenDiffParamsAndDiffParamsComma` to replace the node's
  ///                   current `unexpectedBetweenDiffParamsAndDiffParamsComma`, if present.
  public func withUnexpectedBetweenDiffParamsAndDiffParamsComma(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDiffParamsAndDiffParamsComma)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The comma following the differentiability parameters clause,
  /// if it exists.
  /// 
  public var diffParamsComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.diffParamsComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDiffParamsComma(value)
    }
  }

  /// Returns a copy of the receiver with its `diffParamsComma` replaced.
  /// - param newChild: The new `diffParamsComma` to replace the node's
  ///                   current `diffParamsComma`, if present.
  public func withDiffParamsComma(
    _ newChild: TokenSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.diffParamsComma)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenDiffParamsCommaAndWhereClause: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDiffParamsCommaAndWhereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDiffParamsCommaAndWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDiffParamsCommaAndWhereClause` replaced.
  /// - param newChild: The new `unexpectedBetweenDiffParamsCommaAndWhereClause` to replace the node's
  ///                   current `unexpectedBetweenDiffParamsCommaAndWhereClause`, if present.
  public func withUnexpectedBetweenDiffParamsCommaAndWhereClause(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDiffParamsCommaAndWhereClause)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }

  public var whereClause: GenericWhereClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.whereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return GenericWhereClauseSyntax(childData!)
    }
    set(value) {
      self = withWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `whereClause` replaced.
  /// - param newChild: The new `whereClause` to replace the node's
  ///                   current `whereClause`, if present.
  public func withWhereClause(
    _ newChild: GenericWhereClauseSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.whereClause)
    return DifferentiableAttributeArgumentsSyntax(newData)
  }
}

extension DifferentiableAttributeArgumentsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeDiffKind": unexpectedBeforeDiffKind.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffKind": diffKind.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenDiffKindAndDiffKindComma": unexpectedBetweenDiffKindAndDiffKindComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffKindComma": diffKindComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenDiffKindCommaAndDiffParams": unexpectedBetweenDiffKindCommaAndDiffParams.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffParams": diffParams.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenDiffParamsAndDiffParamsComma": unexpectedBetweenDiffParamsAndDiffParamsComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffParamsComma": diffParamsComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenDiffParamsCommaAndWhereClause": unexpectedBetweenDiffParamsCommaAndWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "whereClause": whereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DifferentiabilityParamsClauseSyntax

/// A clause containing differentiability parameters.
public struct DifferentiabilityParamsClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeWrtLabel
    case wrtLabel
    case unexpectedBetweenWrtLabelAndColon
    case colon
    case unexpectedBetweenColonAndParameters
    case parameters
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DifferentiabilityParamsClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .differentiabilityParamsClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DifferentiabilityParamsClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .differentiabilityParamsClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeWrtLabel: UnexpectedNodesSyntax? = nil,
    wrtLabel: TokenSyntax,
    _ unexpectedBetweenWrtLabelAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndParameters: UnexpectedNodesSyntax? = nil,
    parameters: Syntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeWrtLabel?.raw,
      wrtLabel.raw,
      unexpectedBetweenWrtLabelAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndParameters?.raw,
      parameters.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.differentiabilityParamsClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeWrtLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeWrtLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeWrtLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeWrtLabel` replaced.
  /// - param newChild: The new `unexpectedBeforeWrtLabel` to replace the node's
  ///                   current `unexpectedBeforeWrtLabel`, if present.
  public func withUnexpectedBeforeWrtLabel(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeWrtLabel)
    return DifferentiabilityParamsClauseSyntax(newData)
  }

  /// The "wrt" label.
  public var wrtLabel: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.wrtLabel,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withWrtLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `wrtLabel` replaced.
  /// - param newChild: The new `wrtLabel` to replace the node's
  ///                   current `wrtLabel`, if present.
  public func withWrtLabel(
    _ newChild: TokenSyntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.wrtLabel)
    return DifferentiabilityParamsClauseSyntax(newData)
  }

  public var unexpectedBetweenWrtLabelAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenWrtLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenWrtLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenWrtLabelAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenWrtLabelAndColon` to replace the node's
  ///                   current `unexpectedBetweenWrtLabelAndColon`, if present.
  public func withUnexpectedBetweenWrtLabelAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenWrtLabelAndColon)
    return DifferentiabilityParamsClauseSyntax(newData)
  }

  /// 
  /// The colon separating "wrt" and the parameter list.
  /// 
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return DifferentiabilityParamsClauseSyntax(newData)
  }

  public var unexpectedBetweenColonAndParameters: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndParameters,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndParameters(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndParameters` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndParameters` to replace the node's
  ///                   current `unexpectedBetweenColonAndParameters`, if present.
  public func withUnexpectedBetweenColonAndParameters(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndParameters)
    return DifferentiabilityParamsClauseSyntax(newData)
  }

  public var parameters: Syntax {
    get {
      let childData = data.child(at: Cursor.parameters,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withParameters(value)
    }
  }

  /// Returns a copy of the receiver with its `parameters` replaced.
  /// - param newChild: The new `parameters` to replace the node's
  ///                   current `parameters`, if present.
  public func withParameters(
    _ newChild: Syntax?) -> DifferentiabilityParamsClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.parameters)
    return DifferentiabilityParamsClauseSyntax(newData)
  }
}

extension DifferentiabilityParamsClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeWrtLabel": unexpectedBeforeWrtLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "wrtLabel": Syntax(wrtLabel).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenWrtLabelAndColon": unexpectedBetweenWrtLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndParameters": unexpectedBetweenColonAndParameters.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "parameters": Syntax(parameters).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DifferentiabilityParamsSyntax

/// The differentiability parameters.
public struct DifferentiabilityParamsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndDiffParams
    case diffParams
    case unexpectedBetweenDiffParamsAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DifferentiabilityParamsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .differentiabilityParams else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DifferentiabilityParamsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .differentiabilityParams)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax,
    _ unexpectedBetweenLeftParenAndDiffParams: UnexpectedNodesSyntax? = nil,
    diffParams: DifferentiabilityParamListSyntax,
    _ unexpectedBetweenDiffParamsAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftParen?.raw,
      leftParen.raw,
      unexpectedBetweenLeftParenAndDiffParams?.raw,
      diffParams.raw,
      unexpectedBetweenDiffParamsAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.differentiabilityParams,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftParen` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftParen` to replace the node's
  ///                   current `unexpectedBeforeLeftParen`, if present.
  public func withUnexpectedBeforeLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftParen)
    return DifferentiabilityParamsSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return DifferentiabilityParamsSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndDiffParams: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndDiffParams,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndDiffParams(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndDiffParams` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndDiffParams` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndDiffParams`, if present.
  public func withUnexpectedBetweenLeftParenAndDiffParams(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndDiffParams)
    return DifferentiabilityParamsSyntax(newData)
  }

  /// The parameters for differentiation.
  public var diffParams: DifferentiabilityParamListSyntax {
    get {
      let childData = data.child(at: Cursor.diffParams,
                                 parent: Syntax(self))
      return DifferentiabilityParamListSyntax(childData!)
    }
    set(value) {
      self = withDiffParams(value)
    }
  }

  /// Adds the provided `DifferentiabilityParam` to the node's `diffParams`
  /// collection.
  /// - param element: The new `DifferentiabilityParam` to add to the node's
  ///                  `diffParams` collection.
  /// - returns: A copy of the receiver with the provided `DifferentiabilityParam`
  ///            appended to its `diffParams` collection.
  public func addDifferentiabilityParam(_ element: DifferentiabilityParamSyntax) -> DifferentiabilityParamsSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.diffParams] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.differentiabilityParamList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.diffParams)
    return DifferentiabilityParamsSyntax(newData)
  }

  /// Returns a copy of the receiver with its `diffParams` replaced.
  /// - param newChild: The new `diffParams` to replace the node's
  ///                   current `diffParams`, if present.
  public func withDiffParams(
    _ newChild: DifferentiabilityParamListSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.differentiabilityParamList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.diffParams)
    return DifferentiabilityParamsSyntax(newData)
  }

  public var unexpectedBetweenDiffParamsAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDiffParamsAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDiffParamsAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDiffParamsAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenDiffParamsAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenDiffParamsAndRightParen`, if present.
  public func withUnexpectedBetweenDiffParamsAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDiffParamsAndRightParen)
    return DifferentiabilityParamsSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> DifferentiabilityParamsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return DifferentiabilityParamsSyntax(newData)
  }
}

extension DifferentiabilityParamsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftParen": unexpectedBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndDiffParams": unexpectedBetweenLeftParenAndDiffParams.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffParams": Syntax(diffParams).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenDiffParamsAndRightParen": unexpectedBetweenDiffParamsAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - DifferentiabilityParamSyntax

/// 
/// A differentiability parameter: either the "self" identifier, a function
/// parameter name, or a function parameter index.
/// 
public struct DifferentiabilityParamSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeParameter
    case parameter
    case unexpectedBetweenParameterAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DifferentiabilityParamSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .differentiabilityParam else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DifferentiabilityParamSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .differentiabilityParam)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeParameter: UnexpectedNodesSyntax? = nil,
    parameter: Syntax,
    _ unexpectedBetweenParameterAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeParameter?.raw,
      parameter.raw,
      unexpectedBetweenParameterAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.differentiabilityParam,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeParameter: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeParameter,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeParameter(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeParameter` replaced.
  /// - param newChild: The new `unexpectedBeforeParameter` to replace the node's
  ///                   current `unexpectedBeforeParameter`, if present.
  public func withUnexpectedBeforeParameter(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiabilityParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeParameter)
    return DifferentiabilityParamSyntax(newData)
  }

  public var parameter: Syntax {
    get {
      let childData = data.child(at: Cursor.parameter,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withParameter(value)
    }
  }

  /// Returns a copy of the receiver with its `parameter` replaced.
  /// - param newChild: The new `parameter` to replace the node's
  ///                   current `parameter`, if present.
  public func withParameter(
    _ newChild: Syntax?) -> DifferentiabilityParamSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.parameter)
    return DifferentiabilityParamSyntax(newData)
  }

  public var unexpectedBetweenParameterAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenParameterAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenParameterAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenParameterAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenParameterAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenParameterAndTrailingComma`, if present.
  public func withUnexpectedBetweenParameterAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> DifferentiabilityParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenParameterAndTrailingComma)
    return DifferentiabilityParamSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> DifferentiabilityParamSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return DifferentiabilityParamSyntax(newData)
  }
}

extension DifferentiabilityParamSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeParameter": unexpectedBeforeParameter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "parameter": Syntax(parameter).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenParameterAndTrailingComma": unexpectedBetweenParameterAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DerivativeRegistrationAttributeArgumentsSyntax

/// 
/// The arguments for the '@derivative(of:)' and '@transpose(of:)'
/// attributes: the 'of:' label, the original declaration name, and an
/// optional differentiability parameter list.
/// 
public struct DerivativeRegistrationAttributeArgumentsSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeOfLabel
    case ofLabel
    case unexpectedBetweenOfLabelAndColon
    case colon
    case unexpectedBetweenColonAndOriginalDeclName
    case originalDeclName
    case unexpectedBetweenOriginalDeclNameAndPeriod
    case period
    case unexpectedBetweenPeriodAndAccessorKind
    case accessorKind
    case unexpectedBetweenAccessorKindAndComma
    case comma
    case unexpectedBetweenCommaAndDiffParams
    case diffParams
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DerivativeRegistrationAttributeArgumentsSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .derivativeRegistrationAttributeArguments else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `DerivativeRegistrationAttributeArgumentsSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .derivativeRegistrationAttributeArguments)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeOfLabel: UnexpectedNodesSyntax? = nil,
    ofLabel: TokenSyntax,
    _ unexpectedBetweenOfLabelAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndOriginalDeclName: UnexpectedNodesSyntax? = nil,
    originalDeclName: QualifiedDeclNameSyntax,
    _ unexpectedBetweenOriginalDeclNameAndPeriod: UnexpectedNodesSyntax? = nil,
    period: TokenSyntax?,
    _ unexpectedBetweenPeriodAndAccessorKind: UnexpectedNodesSyntax? = nil,
    accessorKind: TokenSyntax?,
    _ unexpectedBetweenAccessorKindAndComma: UnexpectedNodesSyntax? = nil,
    comma: TokenSyntax?,
    _ unexpectedBetweenCommaAndDiffParams: UnexpectedNodesSyntax? = nil,
    diffParams: DifferentiabilityParamsClauseSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeOfLabel?.raw,
      ofLabel.raw,
      unexpectedBetweenOfLabelAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndOriginalDeclName?.raw,
      originalDeclName.raw,
      unexpectedBetweenOriginalDeclNameAndPeriod?.raw,
      period?.raw,
      unexpectedBetweenPeriodAndAccessorKind?.raw,
      accessorKind?.raw,
      unexpectedBetweenAccessorKindAndComma?.raw,
      comma?.raw,
      unexpectedBetweenCommaAndDiffParams?.raw,
      diffParams?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.derivativeRegistrationAttributeArguments,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeOfLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeOfLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeOfLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeOfLabel` replaced.
  /// - param newChild: The new `unexpectedBeforeOfLabel` to replace the node's
  ///                   current `unexpectedBeforeOfLabel`, if present.
  public func withUnexpectedBeforeOfLabel(
    _ newChild: UnexpectedNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeOfLabel)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  /// The "of" label.
  public var ofLabel: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.ofLabel,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withOfLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `ofLabel` replaced.
  /// - param newChild: The new `ofLabel` to replace the node's
  ///                   current `ofLabel`, if present.
  public func withOfLabel(
    _ newChild: TokenSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.ofLabel)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenOfLabelAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenOfLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenOfLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenOfLabelAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenOfLabelAndColon` to replace the node's
  ///                   current `unexpectedBetweenOfLabelAndColon`, if present.
  public func withUnexpectedBetweenOfLabelAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenOfLabelAndColon)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The colon separating the "of" label and the original
  /// declaration name.
  /// 
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenColonAndOriginalDeclName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndOriginalDeclName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndOriginalDeclName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndOriginalDeclName` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndOriginalDeclName` to replace the node's
  ///                   current `unexpectedBetweenColonAndOriginalDeclName`, if present.
  public func withUnexpectedBetweenColonAndOriginalDeclName(
    _ newChild: UnexpectedNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndOriginalDeclName)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  /// The referenced original declaration name.
  public var originalDeclName: QualifiedDeclNameSyntax {
    get {
      let childData = data.child(at: Cursor.originalDeclName,
                                 parent: Syntax(self))
      return QualifiedDeclNameSyntax(childData!)
    }
    set(value) {
      self = withOriginalDeclName(value)
    }
  }

  /// Returns a copy of the receiver with its `originalDeclName` replaced.
  /// - param newChild: The new `originalDeclName` to replace the node's
  ///                   current `originalDeclName`, if present.
  public func withOriginalDeclName(
    _ newChild: QualifiedDeclNameSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.qualifiedDeclName, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.originalDeclName)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenOriginalDeclNameAndPeriod: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenOriginalDeclNameAndPeriod,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenOriginalDeclNameAndPeriod(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenOriginalDeclNameAndPeriod` replaced.
  /// - param newChild: The new `unexpectedBetweenOriginalDeclNameAndPeriod` to replace the node's
  ///                   current `unexpectedBetweenOriginalDeclNameAndPeriod`, if present.
  public func withUnexpectedBetweenOriginalDeclNameAndPeriod(
    _ newChild: UnexpectedNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenOriginalDeclNameAndPeriod)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  /// 
  /// The period separating the original declaration name and the
  /// accessor name.
  /// 
  public var period: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.period,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPeriod(value)
    }
  }

  /// Returns a copy of the receiver with its `period` replaced.
  /// - param newChild: The new `period` to replace the node's
  ///                   current `period`, if present.
  public func withPeriod(
    _ newChild: TokenSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.period)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenPeriodAndAccessorKind: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPeriodAndAccessorKind,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPeriodAndAccessorKind(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPeriodAndAccessorKind` replaced.
  /// - param newChild: The new `unexpectedBetweenPeriodAndAccessorKind` to replace the node's
  ///                   current `unexpectedBetweenPeriodAndAccessorKind`, if present.
  public func withUnexpectedBetweenPeriodAndAccessorKind(
    _ newChild: UnexpectedNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPeriodAndAccessorKind)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  /// The accessor name.
  public var accessorKind: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.accessorKind,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAccessorKind(value)
    }
  }

  /// Returns a copy of the receiver with its `accessorKind` replaced.
  /// - param newChild: The new `accessorKind` to replace the node's
  ///                   current `accessorKind`, if present.
  public func withAccessorKind(
    _ newChild: TokenSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.accessorKind)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenAccessorKindAndComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAccessorKindAndComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAccessorKindAndComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAccessorKindAndComma` replaced.
  /// - param newChild: The new `unexpectedBetweenAccessorKindAndComma` to replace the node's
  ///                   current `unexpectedBetweenAccessorKindAndComma`, if present.
  public func withUnexpectedBetweenAccessorKindAndComma(
    _ newChild: UnexpectedNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAccessorKindAndComma)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var comma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.comma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withComma(value)
    }
  }

  /// Returns a copy of the receiver with its `comma` replaced.
  /// - param newChild: The new `comma` to replace the node's
  ///                   current `comma`, if present.
  public func withComma(
    _ newChild: TokenSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.comma)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var unexpectedBetweenCommaAndDiffParams: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenCommaAndDiffParams,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCommaAndDiffParams(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCommaAndDiffParams` replaced.
  /// - param newChild: The new `unexpectedBetweenCommaAndDiffParams` to replace the node's
  ///                   current `unexpectedBetweenCommaAndDiffParams`, if present.
  public func withUnexpectedBetweenCommaAndDiffParams(
    _ newChild: UnexpectedNodesSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenCommaAndDiffParams)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }

  public var diffParams: DifferentiabilityParamsClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.diffParams,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DifferentiabilityParamsClauseSyntax(childData!)
    }
    set(value) {
      self = withDiffParams(value)
    }
  }

  /// Returns a copy of the receiver with its `diffParams` replaced.
  /// - param newChild: The new `diffParams` to replace the node's
  ///                   current `diffParams`, if present.
  public func withDiffParams(
    _ newChild: DifferentiabilityParamsClauseSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.diffParams)
    return DerivativeRegistrationAttributeArgumentsSyntax(newData)
  }
}

extension DerivativeRegistrationAttributeArgumentsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeOfLabel": unexpectedBeforeOfLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "ofLabel": Syntax(ofLabel).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenOfLabelAndColon": unexpectedBetweenOfLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndOriginalDeclName": unexpectedBetweenColonAndOriginalDeclName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "originalDeclName": Syntax(originalDeclName).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenOriginalDeclNameAndPeriod": unexpectedBetweenOriginalDeclNameAndPeriod.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "period": period.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenPeriodAndAccessorKind": unexpectedBetweenPeriodAndAccessorKind.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "accessorKind": accessorKind.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAccessorKindAndComma": unexpectedBetweenAccessorKindAndComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "comma": comma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenCommaAndDiffParams": unexpectedBetweenCommaAndDiffParams.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "diffParams": diffParams.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - QualifiedDeclNameSyntax

/// 
/// An optionally qualified function declaration name (e.g. `+(_:_:)`,
/// `A.B.C.foo(_:_:)`).
/// 
public struct QualifiedDeclNameSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeBaseType
    case baseType
    case unexpectedBetweenBaseTypeAndDot
    case dot
    case unexpectedBetweenDotAndName
    case name
    case unexpectedBetweenNameAndArguments
    case arguments
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `QualifiedDeclNameSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .qualifiedDeclName else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `QualifiedDeclNameSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .qualifiedDeclName)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeBaseType: UnexpectedNodesSyntax? = nil,
    baseType: TypeSyntax?,
    _ unexpectedBetweenBaseTypeAndDot: UnexpectedNodesSyntax? = nil,
    dot: TokenSyntax?,
    _ unexpectedBetweenDotAndName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndArguments: UnexpectedNodesSyntax? = nil,
    arguments: DeclNameArgumentsSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeBaseType?.raw,
      baseType?.raw,
      unexpectedBetweenBaseTypeAndDot?.raw,
      dot?.raw,
      unexpectedBetweenDotAndName?.raw,
      name.raw,
      unexpectedBetweenNameAndArguments?.raw,
      arguments?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.qualifiedDeclName,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeBaseType: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeBaseType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeBaseType(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeBaseType` replaced.
  /// - param newChild: The new `unexpectedBeforeBaseType` to replace the node's
  ///                   current `unexpectedBeforeBaseType`, if present.
  public func withUnexpectedBeforeBaseType(
    _ newChild: UnexpectedNodesSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeBaseType)
    return QualifiedDeclNameSyntax(newData)
  }

  /// 
  /// The base type of the qualified name, optionally specified.
  /// 
  public var baseType: TypeSyntax? {
    get {
      let childData = data.child(at: Cursor.baseType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withBaseType(value)
    }
  }

  /// Returns a copy of the receiver with its `baseType` replaced.
  /// - param newChild: The new `baseType` to replace the node's
  ///                   current `baseType`, if present.
  public func withBaseType(
    _ newChild: TypeSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.baseType)
    return QualifiedDeclNameSyntax(newData)
  }

  public var unexpectedBetweenBaseTypeAndDot: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenBaseTypeAndDot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenBaseTypeAndDot(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenBaseTypeAndDot` replaced.
  /// - param newChild: The new `unexpectedBetweenBaseTypeAndDot` to replace the node's
  ///                   current `unexpectedBetweenBaseTypeAndDot`, if present.
  public func withUnexpectedBetweenBaseTypeAndDot(
    _ newChild: UnexpectedNodesSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenBaseTypeAndDot)
    return QualifiedDeclNameSyntax(newData)
  }

  public var dot: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.dot,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDot(value)
    }
  }

  /// Returns a copy of the receiver with its `dot` replaced.
  /// - param newChild: The new `dot` to replace the node's
  ///                   current `dot`, if present.
  public func withDot(
    _ newChild: TokenSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.dot)
    return QualifiedDeclNameSyntax(newData)
  }

  public var unexpectedBetweenDotAndName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDotAndName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDotAndName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDotAndName` replaced.
  /// - param newChild: The new `unexpectedBetweenDotAndName` to replace the node's
  ///                   current `unexpectedBetweenDotAndName`, if present.
  public func withUnexpectedBetweenDotAndName(
    _ newChild: UnexpectedNodesSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDotAndName)
    return QualifiedDeclNameSyntax(newData)
  }

  /// 
  /// The base name of the referenced function.
  /// 
  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return QualifiedDeclNameSyntax(newData)
  }

  public var unexpectedBetweenNameAndArguments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndArguments` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndArguments` to replace the node's
  ///                   current `unexpectedBetweenNameAndArguments`, if present.
  public func withUnexpectedBetweenNameAndArguments(
    _ newChild: UnexpectedNodesSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndArguments)
    return QualifiedDeclNameSyntax(newData)
  }

  /// 
  /// The argument labels of the referenced function, optionally
  /// specified.
  /// 
  public var arguments: DeclNameArgumentsSyntax? {
    get {
      let childData = data.child(at: Cursor.arguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclNameArgumentsSyntax(childData!)
    }
    set(value) {
      self = withArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: DeclNameArgumentsSyntax?) -> QualifiedDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.arguments)
    return QualifiedDeclNameSyntax(newData)
  }
}

extension QualifiedDeclNameSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeBaseType": unexpectedBeforeBaseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "baseType": baseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenBaseTypeAndDot": unexpectedBetweenBaseTypeAndDot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "dot": dot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenDotAndName": unexpectedBetweenDotAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndArguments": unexpectedBetweenNameAndArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arguments": arguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - FunctionDeclNameSyntax

/// A function declaration name (e.g. `foo(_:_:)`).
public struct FunctionDeclNameSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeName
    case name
    case unexpectedBetweenNameAndArguments
    case arguments
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `FunctionDeclNameSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .functionDeclName else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `FunctionDeclNameSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .functionDeclName)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeName: UnexpectedNodesSyntax? = nil,
    name: Syntax,
    _ unexpectedBetweenNameAndArguments: UnexpectedNodesSyntax? = nil,
    arguments: DeclNameArgumentsSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeName?.raw,
      name.raw,
      unexpectedBetweenNameAndArguments?.raw,
      arguments?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.functionDeclName,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeName` replaced.
  /// - param newChild: The new `unexpectedBeforeName` to replace the node's
  ///                   current `unexpectedBeforeName`, if present.
  public func withUnexpectedBeforeName(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeName)
    return FunctionDeclNameSyntax(newData)
  }

  /// 
  /// The base name of the referenced function.
  /// 
  public var name: Syntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: Syntax?) -> FunctionDeclNameSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return FunctionDeclNameSyntax(newData)
  }

  public var unexpectedBetweenNameAndArguments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndArguments` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndArguments` to replace the node's
  ///                   current `unexpectedBetweenNameAndArguments`, if present.
  public func withUnexpectedBetweenNameAndArguments(
    _ newChild: UnexpectedNodesSyntax?) -> FunctionDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndArguments)
    return FunctionDeclNameSyntax(newData)
  }

  /// 
  /// The argument labels of the referenced function, optionally
  /// specified.
  /// 
  public var arguments: DeclNameArgumentsSyntax? {
    get {
      let childData = data.child(at: Cursor.arguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return DeclNameArgumentsSyntax(childData!)
    }
    set(value) {
      self = withArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: DeclNameArgumentsSyntax?) -> FunctionDeclNameSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.arguments)
    return FunctionDeclNameSyntax(newData)
  }
}

extension FunctionDeclNameSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeName": unexpectedBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndArguments": unexpectedBetweenNameAndArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arguments": arguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - BackDeployAttributeSpecListSyntax

/// 
/// A collection of arguments for the `@_backDeploy` attribute
/// 
public struct BackDeployAttributeSpecListSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeBeforeLabel
    case beforeLabel
    case unexpectedBetweenBeforeLabelAndColon
    case colon
    case unexpectedBetweenColonAndVersionList
    case versionList
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `BackDeployAttributeSpecListSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .backDeployAttributeSpecList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `BackDeployAttributeSpecListSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .backDeployAttributeSpecList)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeBeforeLabel: UnexpectedNodesSyntax? = nil,
    beforeLabel: TokenSyntax,
    _ unexpectedBetweenBeforeLabelAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndVersionList: UnexpectedNodesSyntax? = nil,
    versionList: BackDeployVersionListSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeBeforeLabel?.raw,
      beforeLabel.raw,
      unexpectedBetweenBeforeLabelAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndVersionList?.raw,
      versionList.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.backDeployAttributeSpecList,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeBeforeLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeBeforeLabel` replaced.
  /// - param newChild: The new `unexpectedBeforeBeforeLabel` to replace the node's
  ///                   current `unexpectedBeforeBeforeLabel`, if present.
  public func withUnexpectedBeforeBeforeLabel(
    _ newChild: UnexpectedNodesSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeBeforeLabel)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  /// The "before" label.
  public var beforeLabel: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.beforeLabel,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `beforeLabel` replaced.
  /// - param newChild: The new `beforeLabel` to replace the node's
  ///                   current `beforeLabel`, if present.
  public func withBeforeLabel(
    _ newChild: TokenSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.beforeLabel)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  public var unexpectedBetweenBeforeLabelAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenBeforeLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenBeforeLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenBeforeLabelAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenBeforeLabelAndColon` to replace the node's
  ///                   current `unexpectedBetweenBeforeLabelAndColon`, if present.
  public func withUnexpectedBetweenBeforeLabelAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenBeforeLabelAndColon)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  /// 
  /// The colon separating "before" and the parameter list.
  /// 
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  public var unexpectedBetweenColonAndVersionList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndVersionList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndVersionList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndVersionList` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndVersionList` to replace the node's
  ///                   current `unexpectedBetweenColonAndVersionList`, if present.
  public func withUnexpectedBetweenColonAndVersionList(
    _ newChild: UnexpectedNodesSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndVersionList)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  /// 
  /// The list of OS versions in which the declaration became ABI
  /// stable.
  /// 
  public var versionList: BackDeployVersionListSyntax {
    get {
      let childData = data.child(at: Cursor.versionList,
                                 parent: Syntax(self))
      return BackDeployVersionListSyntax(childData!)
    }
    set(value) {
      self = withVersionList(value)
    }
  }

  /// Adds the provided `Availability` to the node's `versionList`
  /// collection.
  /// - param element: The new `Availability` to add to the node's
  ///                  `versionList` collection.
  /// - returns: A copy of the receiver with the provided `Availability`
  ///            appended to its `versionList` collection.
  public func addAvailability(_ element: BackDeployVersionArgumentSyntax) -> BackDeployAttributeSpecListSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.versionList] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.backDeployVersionList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.versionList)
    return BackDeployAttributeSpecListSyntax(newData)
  }

  /// Returns a copy of the receiver with its `versionList` replaced.
  /// - param newChild: The new `versionList` to replace the node's
  ///                   current `versionList`, if present.
  public func withVersionList(
    _ newChild: BackDeployVersionListSyntax?) -> BackDeployAttributeSpecListSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.backDeployVersionList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.versionList)
    return BackDeployAttributeSpecListSyntax(newData)
  }
}

extension BackDeployAttributeSpecListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeBeforeLabel": unexpectedBeforeBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "beforeLabel": Syntax(beforeLabel).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenBeforeLabelAndColon": unexpectedBetweenBeforeLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndVersionList": unexpectedBetweenColonAndVersionList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "versionList": Syntax(versionList).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - BackDeployVersionArgumentSyntax

/// 
/// A single platform/version pair in a `@_backDeploy` attribute,
/// e.g. `iOS 10.1`.
/// 
public struct BackDeployVersionArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeAvailabilityVersionRestriction
    case availabilityVersionRestriction
    case unexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `BackDeployVersionArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .backDeployVersionArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `BackDeployVersionArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .backDeployVersionArgument)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeAvailabilityVersionRestriction: UnexpectedNodesSyntax? = nil,
    availabilityVersionRestriction: AvailabilityVersionRestrictionSyntax,
    _ unexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAvailabilityVersionRestriction?.raw,
      availabilityVersionRestriction.raw,
      unexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.backDeployVersionArgument,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeAvailabilityVersionRestriction: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeAvailabilityVersionRestriction,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAvailabilityVersionRestriction(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAvailabilityVersionRestriction` replaced.
  /// - param newChild: The new `unexpectedBeforeAvailabilityVersionRestriction` to replace the node's
  ///                   current `unexpectedBeforeAvailabilityVersionRestriction`, if present.
  public func withUnexpectedBeforeAvailabilityVersionRestriction(
    _ newChild: UnexpectedNodesSyntax?) -> BackDeployVersionArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeAvailabilityVersionRestriction)
    return BackDeployVersionArgumentSyntax(newData)
  }

  public var availabilityVersionRestriction: AvailabilityVersionRestrictionSyntax {
    get {
      let childData = data.child(at: Cursor.availabilityVersionRestriction,
                                 parent: Syntax(self))
      return AvailabilityVersionRestrictionSyntax(childData!)
    }
    set(value) {
      self = withAvailabilityVersionRestriction(value)
    }
  }

  /// Returns a copy of the receiver with its `availabilityVersionRestriction` replaced.
  /// - param newChild: The new `availabilityVersionRestriction` to replace the node's
  ///                   current `availabilityVersionRestriction`, if present.
  public func withAvailabilityVersionRestriction(
    _ newChild: AvailabilityVersionRestrictionSyntax?) -> BackDeployVersionArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.availabilityVersionRestriction, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.availabilityVersionRestriction)
    return BackDeployVersionArgumentSyntax(newData)
  }

  public var unexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma`, if present.
  public func withUnexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> BackDeployVersionArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma)
    return BackDeployVersionArgumentSyntax(newData)
  }

  /// 
  /// A trailing comma if the argument is followed by another
  /// argument
  /// 
  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> BackDeployVersionArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return BackDeployVersionArgumentSyntax(newData)
  }
}

extension BackDeployVersionArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAvailabilityVersionRestriction": unexpectedBeforeAvailabilityVersionRestriction.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "availabilityVersionRestriction": Syntax(availabilityVersionRestriction).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma": unexpectedBetweenAvailabilityVersionRestrictionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - WhereClauseSyntax

public struct WhereClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeWhereKeyword
    case whereKeyword
    case unexpectedBetweenWhereKeywordAndGuardResult
    case guardResult
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `WhereClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .whereClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `WhereClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .whereClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeWhereKeyword: UnexpectedNodesSyntax? = nil,
    whereKeyword: TokenSyntax,
    _ unexpectedBetweenWhereKeywordAndGuardResult: UnexpectedNodesSyntax? = nil,
    guardResult: ExprSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeWhereKeyword?.raw,
      whereKeyword.raw,
      unexpectedBetweenWhereKeywordAndGuardResult?.raw,
      guardResult.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.whereClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeWhereKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeWhereKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeWhereKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeWhereKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeWhereKeyword` to replace the node's
  ///                   current `unexpectedBeforeWhereKeyword`, if present.
  public func withUnexpectedBeforeWhereKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> WhereClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeWhereKeyword)
    return WhereClauseSyntax(newData)
  }

  public var whereKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.whereKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withWhereKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `whereKeyword` replaced.
  /// - param newChild: The new `whereKeyword` to replace the node's
  ///                   current `whereKeyword`, if present.
  public func withWhereKeyword(
    _ newChild: TokenSyntax?) -> WhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.whereKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.whereKeyword)
    return WhereClauseSyntax(newData)
  }

  public var unexpectedBetweenWhereKeywordAndGuardResult: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenWhereKeywordAndGuardResult,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenWhereKeywordAndGuardResult(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenWhereKeywordAndGuardResult` replaced.
  /// - param newChild: The new `unexpectedBetweenWhereKeywordAndGuardResult` to replace the node's
  ///                   current `unexpectedBetweenWhereKeywordAndGuardResult`, if present.
  public func withUnexpectedBetweenWhereKeywordAndGuardResult(
    _ newChild: UnexpectedNodesSyntax?) -> WhereClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenWhereKeywordAndGuardResult)
    return WhereClauseSyntax(newData)
  }

  public var guardResult: ExprSyntax {
    get {
      let childData = data.child(at: Cursor.guardResult,
                                 parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withGuardResult(value)
    }
  }

  /// Returns a copy of the receiver with its `guardResult` replaced.
  /// - param newChild: The new `guardResult` to replace the node's
  ///                   current `guardResult`, if present.
  public func withGuardResult(
    _ newChild: ExprSyntax?) -> WhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.guardResult)
    return WhereClauseSyntax(newData)
  }
}

extension WhereClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeWhereKeyword": unexpectedBeforeWhereKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "whereKeyword": Syntax(whereKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenWhereKeywordAndGuardResult": unexpectedBetweenWhereKeywordAndGuardResult.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "guardResult": Syntax(guardResult).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - YieldListSyntax

public struct YieldListSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndElementList
    case elementList
    case unexpectedBetweenElementListAndTrailingComma
    case trailingComma
    case unexpectedBetweenTrailingCommaAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `YieldListSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .yieldList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `YieldListSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .yieldList)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax,
    _ unexpectedBetweenLeftParenAndElementList: UnexpectedNodesSyntax? = nil,
    elementList: ExprListSyntax,
    _ unexpectedBetweenElementListAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?,
    _ unexpectedBetweenTrailingCommaAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftParen?.raw,
      leftParen.raw,
      unexpectedBetweenLeftParenAndElementList?.raw,
      elementList.raw,
      unexpectedBetweenElementListAndTrailingComma?.raw,
      trailingComma?.raw,
      unexpectedBetweenTrailingCommaAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.yieldList,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftParen` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftParen` to replace the node's
  ///                   current `unexpectedBeforeLeftParen`, if present.
  public func withUnexpectedBeforeLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftParen)
    return YieldListSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return YieldListSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndElementList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndElementList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndElementList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndElementList` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndElementList` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndElementList`, if present.
  public func withUnexpectedBetweenLeftParenAndElementList(
    _ newChild: UnexpectedNodesSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndElementList)
    return YieldListSyntax(newData)
  }

  public var elementList: ExprListSyntax {
    get {
      let childData = data.child(at: Cursor.elementList,
                                 parent: Syntax(self))
      return ExprListSyntax(childData!)
    }
    set(value) {
      self = withElementList(value)
    }
  }

  /// Adds the provided `Element` to the node's `elementList`
  /// collection.
  /// - param element: The new `Element` to add to the node's
  ///                  `elementList` collection.
  /// - returns: A copy of the receiver with the provided `Element`
  ///            appended to its `elementList` collection.
  public func addElement(_ element: ExprSyntax) -> YieldListSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.elementList] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.exprList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.elementList)
    return YieldListSyntax(newData)
  }

  /// Returns a copy of the receiver with its `elementList` replaced.
  /// - param newChild: The new `elementList` to replace the node's
  ///                   current `elementList`, if present.
  public func withElementList(
    _ newChild: ExprListSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.exprList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.elementList)
    return YieldListSyntax(newData)
  }

  public var unexpectedBetweenElementListAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenElementListAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenElementListAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenElementListAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenElementListAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenElementListAndTrailingComma`, if present.
  public func withUnexpectedBetweenElementListAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenElementListAndTrailingComma)
    return YieldListSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return YieldListSyntax(newData)
  }

  public var unexpectedBetweenTrailingCommaAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenTrailingCommaAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTrailingCommaAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTrailingCommaAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenTrailingCommaAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenTrailingCommaAndRightParen`, if present.
  public func withUnexpectedBetweenTrailingCommaAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenTrailingCommaAndRightParen)
    return YieldListSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> YieldListSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return YieldListSyntax(newData)
  }
}

extension YieldListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftParen": unexpectedBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndElementList": unexpectedBetweenLeftParenAndElementList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elementList": Syntax(elementList).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenElementListAndTrailingComma": unexpectedBetweenElementListAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenTrailingCommaAndRightParen": unexpectedBetweenTrailingCommaAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ConditionElementSyntax

public struct ConditionElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeCondition
    case condition
    case unexpectedBetweenConditionAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ConditionElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .conditionElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ConditionElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .conditionElement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeCondition: UnexpectedNodesSyntax? = nil,
    condition: Syntax,
    _ unexpectedBetweenConditionAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeCondition?.raw,
      condition.raw,
      unexpectedBetweenConditionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.conditionElement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeCondition: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeCondition,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeCondition(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeCondition` replaced.
  /// - param newChild: The new `unexpectedBeforeCondition` to replace the node's
  ///                   current `unexpectedBeforeCondition`, if present.
  public func withUnexpectedBeforeCondition(
    _ newChild: UnexpectedNodesSyntax?) -> ConditionElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeCondition)
    return ConditionElementSyntax(newData)
  }

  public var condition: Syntax {
    get {
      let childData = data.child(at: Cursor.condition,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withCondition(value)
    }
  }

  /// Returns a copy of the receiver with its `condition` replaced.
  /// - param newChild: The new `condition` to replace the node's
  ///                   current `condition`, if present.
  public func withCondition(
    _ newChild: Syntax?) -> ConditionElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.condition)
    return ConditionElementSyntax(newData)
  }

  public var unexpectedBetweenConditionAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenConditionAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenConditionAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenConditionAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenConditionAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenConditionAndTrailingComma`, if present.
  public func withUnexpectedBetweenConditionAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> ConditionElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenConditionAndTrailingComma)
    return ConditionElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ConditionElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return ConditionElementSyntax(newData)
  }
}

extension ConditionElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeCondition": unexpectedBeforeCondition.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "condition": Syntax(condition).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenConditionAndTrailingComma": unexpectedBetweenConditionAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AvailabilityConditionSyntax

public struct AvailabilityConditionSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforePoundAvailableKeyword
    case poundAvailableKeyword
    case unexpectedBetweenPoundAvailableKeywordAndLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndAvailabilitySpec
    case availabilitySpec
    case unexpectedBetweenAvailabilitySpecAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AvailabilityConditionSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .availabilityCondition else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AvailabilityConditionSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .availabilityCondition)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforePoundAvailableKeyword: UnexpectedNodesSyntax? = nil,
    poundAvailableKeyword: TokenSyntax,
    _ unexpectedBetweenPoundAvailableKeywordAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax,
    _ unexpectedBetweenLeftParenAndAvailabilitySpec: UnexpectedNodesSyntax? = nil,
    availabilitySpec: AvailabilitySpecListSyntax,
    _ unexpectedBetweenAvailabilitySpecAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforePoundAvailableKeyword?.raw,
      poundAvailableKeyword.raw,
      unexpectedBetweenPoundAvailableKeywordAndLeftParen?.raw,
      leftParen.raw,
      unexpectedBetweenLeftParenAndAvailabilitySpec?.raw,
      availabilitySpec.raw,
      unexpectedBetweenAvailabilitySpecAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.availabilityCondition,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforePoundAvailableKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforePoundAvailableKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforePoundAvailableKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforePoundAvailableKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforePoundAvailableKeyword` to replace the node's
  ///                   current `unexpectedBeforePoundAvailableKeyword`, if present.
  public func withUnexpectedBeforePoundAvailableKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforePoundAvailableKeyword)
    return AvailabilityConditionSyntax(newData)
  }

  public var poundAvailableKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.poundAvailableKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPoundAvailableKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `poundAvailableKeyword` replaced.
  /// - param newChild: The new `poundAvailableKeyword` to replace the node's
  ///                   current `poundAvailableKeyword`, if present.
  public func withPoundAvailableKeyword(
    _ newChild: TokenSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.poundAvailableKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.poundAvailableKeyword)
    return AvailabilityConditionSyntax(newData)
  }

  public var unexpectedBetweenPoundAvailableKeywordAndLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPoundAvailableKeywordAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPoundAvailableKeywordAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPoundAvailableKeywordAndLeftParen` replaced.
  /// - param newChild: The new `unexpectedBetweenPoundAvailableKeywordAndLeftParen` to replace the node's
  ///                   current `unexpectedBetweenPoundAvailableKeywordAndLeftParen`, if present.
  public func withUnexpectedBetweenPoundAvailableKeywordAndLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPoundAvailableKeywordAndLeftParen)
    return AvailabilityConditionSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return AvailabilityConditionSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndAvailabilitySpec: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndAvailabilitySpec,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndAvailabilitySpec(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndAvailabilitySpec` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndAvailabilitySpec` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndAvailabilitySpec`, if present.
  public func withUnexpectedBetweenLeftParenAndAvailabilitySpec(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndAvailabilitySpec)
    return AvailabilityConditionSyntax(newData)
  }

  public var availabilitySpec: AvailabilitySpecListSyntax {
    get {
      let childData = data.child(at: Cursor.availabilitySpec,
                                 parent: Syntax(self))
      return AvailabilitySpecListSyntax(childData!)
    }
    set(value) {
      self = withAvailabilitySpec(value)
    }
  }

  /// Adds the provided `AvailabilityArgument` to the node's `availabilitySpec`
  /// collection.
  /// - param element: The new `AvailabilityArgument` to add to the node's
  ///                  `availabilitySpec` collection.
  /// - returns: A copy of the receiver with the provided `AvailabilityArgument`
  ///            appended to its `availabilitySpec` collection.
  public func addAvailabilityArgument(_ element: AvailabilityArgumentSyntax) -> AvailabilityConditionSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.availabilitySpec] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.availabilitySpecList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.availabilitySpec)
    return AvailabilityConditionSyntax(newData)
  }

  /// Returns a copy of the receiver with its `availabilitySpec` replaced.
  /// - param newChild: The new `availabilitySpec` to replace the node's
  ///                   current `availabilitySpec`, if present.
  public func withAvailabilitySpec(
    _ newChild: AvailabilitySpecListSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.availabilitySpecList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.availabilitySpec)
    return AvailabilityConditionSyntax(newData)
  }

  public var unexpectedBetweenAvailabilitySpecAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAvailabilitySpecAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAvailabilitySpecAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAvailabilitySpecAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenAvailabilitySpecAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenAvailabilitySpecAndRightParen`, if present.
  public func withUnexpectedBetweenAvailabilitySpecAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAvailabilitySpecAndRightParen)
    return AvailabilityConditionSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return AvailabilityConditionSyntax(newData)
  }
}

extension AvailabilityConditionSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePoundAvailableKeyword": unexpectedBeforePoundAvailableKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundAvailableKeyword": Syntax(poundAvailableKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPoundAvailableKeywordAndLeftParen": unexpectedBetweenPoundAvailableKeywordAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndAvailabilitySpec": unexpectedBetweenLeftParenAndAvailabilitySpec.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "availabilitySpec": Syntax(availabilitySpec).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAvailabilitySpecAndRightParen": unexpectedBetweenAvailabilitySpecAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - MatchingPatternConditionSyntax

public struct MatchingPatternConditionSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeCaseKeyword
    case caseKeyword
    case unexpectedBetweenCaseKeywordAndPattern
    case pattern
    case unexpectedBetweenPatternAndTypeAnnotation
    case typeAnnotation
    case unexpectedBetweenTypeAnnotationAndInitializer
    case initializer
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `MatchingPatternConditionSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .matchingPatternCondition else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `MatchingPatternConditionSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .matchingPatternCondition)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeCaseKeyword: UnexpectedNodesSyntax? = nil,
    caseKeyword: TokenSyntax,
    _ unexpectedBetweenCaseKeywordAndPattern: UnexpectedNodesSyntax? = nil,
    pattern: PatternSyntax,
    _ unexpectedBetweenPatternAndTypeAnnotation: UnexpectedNodesSyntax? = nil,
    typeAnnotation: TypeAnnotationSyntax?,
    _ unexpectedBetweenTypeAnnotationAndInitializer: UnexpectedNodesSyntax? = nil,
    initializer: InitializerClauseSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeCaseKeyword?.raw,
      caseKeyword.raw,
      unexpectedBetweenCaseKeywordAndPattern?.raw,
      pattern.raw,
      unexpectedBetweenPatternAndTypeAnnotation?.raw,
      typeAnnotation?.raw,
      unexpectedBetweenTypeAnnotationAndInitializer?.raw,
      initializer.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.matchingPatternCondition,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeCaseKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeCaseKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeCaseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeCaseKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeCaseKeyword` to replace the node's
  ///                   current `unexpectedBeforeCaseKeyword`, if present.
  public func withUnexpectedBeforeCaseKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeCaseKeyword)
    return MatchingPatternConditionSyntax(newData)
  }

  public var caseKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.caseKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withCaseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `caseKeyword` replaced.
  /// - param newChild: The new `caseKeyword` to replace the node's
  ///                   current `caseKeyword`, if present.
  public func withCaseKeyword(
    _ newChild: TokenSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.caseKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.caseKeyword)
    return MatchingPatternConditionSyntax(newData)
  }

  public var unexpectedBetweenCaseKeywordAndPattern: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenCaseKeywordAndPattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCaseKeywordAndPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCaseKeywordAndPattern` replaced.
  /// - param newChild: The new `unexpectedBetweenCaseKeywordAndPattern` to replace the node's
  ///                   current `unexpectedBetweenCaseKeywordAndPattern`, if present.
  public func withUnexpectedBetweenCaseKeywordAndPattern(
    _ newChild: UnexpectedNodesSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenCaseKeywordAndPattern)
    return MatchingPatternConditionSyntax(newData)
  }

  public var pattern: PatternSyntax {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingPattern, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return MatchingPatternConditionSyntax(newData)
  }

  public var unexpectedBetweenPatternAndTypeAnnotation: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPatternAndTypeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPatternAndTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPatternAndTypeAnnotation` replaced.
  /// - param newChild: The new `unexpectedBetweenPatternAndTypeAnnotation` to replace the node's
  ///                   current `unexpectedBetweenPatternAndTypeAnnotation`, if present.
  public func withUnexpectedBetweenPatternAndTypeAnnotation(
    _ newChild: UnexpectedNodesSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPatternAndTypeAnnotation)
    return MatchingPatternConditionSyntax(newData)
  }

  public var typeAnnotation: TypeAnnotationSyntax? {
    get {
      let childData = data.child(at: Cursor.typeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeAnnotationSyntax(childData!)
    }
    set(value) {
      self = withTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeAnnotationSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.typeAnnotation)
    return MatchingPatternConditionSyntax(newData)
  }

  public var unexpectedBetweenTypeAnnotationAndInitializer: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenTypeAnnotationAndInitializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTypeAnnotationAndInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTypeAnnotationAndInitializer` replaced.
  /// - param newChild: The new `unexpectedBetweenTypeAnnotationAndInitializer` to replace the node's
  ///                   current `unexpectedBetweenTypeAnnotationAndInitializer`, if present.
  public func withUnexpectedBetweenTypeAnnotationAndInitializer(
    _ newChild: UnexpectedNodesSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenTypeAnnotationAndInitializer)
    return MatchingPatternConditionSyntax(newData)
  }

  public var initializer: InitializerClauseSyntax {
    get {
      let childData = data.child(at: Cursor.initializer,
                                 parent: Syntax(self))
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.initializerClause, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.initializer)
    return MatchingPatternConditionSyntax(newData)
  }
}

extension MatchingPatternConditionSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeCaseKeyword": unexpectedBeforeCaseKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "caseKeyword": Syntax(caseKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenCaseKeywordAndPattern": unexpectedBetweenCaseKeywordAndPattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": Syntax(pattern).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPatternAndTypeAnnotation": unexpectedBetweenPatternAndTypeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeAnnotation": typeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenTypeAnnotationAndInitializer": unexpectedBetweenTypeAnnotationAndInitializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "initializer": Syntax(initializer).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - OptionalBindingConditionSyntax

public struct OptionalBindingConditionSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLetOrVarKeyword
    case letOrVarKeyword
    case unexpectedBetweenLetOrVarKeywordAndPattern
    case pattern
    case unexpectedBetweenPatternAndTypeAnnotation
    case typeAnnotation
    case unexpectedBetweenTypeAnnotationAndInitializer
    case initializer
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `OptionalBindingConditionSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .optionalBindingCondition else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `OptionalBindingConditionSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .optionalBindingCondition)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLetOrVarKeyword: UnexpectedNodesSyntax? = nil,
    letOrVarKeyword: TokenSyntax,
    _ unexpectedBetweenLetOrVarKeywordAndPattern: UnexpectedNodesSyntax? = nil,
    pattern: PatternSyntax,
    _ unexpectedBetweenPatternAndTypeAnnotation: UnexpectedNodesSyntax? = nil,
    typeAnnotation: TypeAnnotationSyntax?,
    _ unexpectedBetweenTypeAnnotationAndInitializer: UnexpectedNodesSyntax? = nil,
    initializer: InitializerClauseSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLetOrVarKeyword?.raw,
      letOrVarKeyword.raw,
      unexpectedBetweenLetOrVarKeywordAndPattern?.raw,
      pattern.raw,
      unexpectedBetweenPatternAndTypeAnnotation?.raw,
      typeAnnotation?.raw,
      unexpectedBetweenTypeAnnotationAndInitializer?.raw,
      initializer?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.optionalBindingCondition,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLetOrVarKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLetOrVarKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLetOrVarKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLetOrVarKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeLetOrVarKeyword` to replace the node's
  ///                   current `unexpectedBeforeLetOrVarKeyword`, if present.
  public func withUnexpectedBeforeLetOrVarKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLetOrVarKeyword)
    return OptionalBindingConditionSyntax(newData)
  }

  public var letOrVarKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.letOrVarKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLetOrVarKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `letOrVarKeyword` replaced.
  /// - param newChild: The new `letOrVarKeyword` to replace the node's
  ///                   current `letOrVarKeyword`, if present.
  public func withLetOrVarKeyword(
    _ newChild: TokenSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.letKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.letOrVarKeyword)
    return OptionalBindingConditionSyntax(newData)
  }

  public var unexpectedBetweenLetOrVarKeywordAndPattern: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLetOrVarKeywordAndPattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLetOrVarKeywordAndPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLetOrVarKeywordAndPattern` replaced.
  /// - param newChild: The new `unexpectedBetweenLetOrVarKeywordAndPattern` to replace the node's
  ///                   current `unexpectedBetweenLetOrVarKeywordAndPattern`, if present.
  public func withUnexpectedBetweenLetOrVarKeywordAndPattern(
    _ newChild: UnexpectedNodesSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLetOrVarKeywordAndPattern)
    return OptionalBindingConditionSyntax(newData)
  }

  public var pattern: PatternSyntax {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingPattern, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return OptionalBindingConditionSyntax(newData)
  }

  public var unexpectedBetweenPatternAndTypeAnnotation: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPatternAndTypeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPatternAndTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPatternAndTypeAnnotation` replaced.
  /// - param newChild: The new `unexpectedBetweenPatternAndTypeAnnotation` to replace the node's
  ///                   current `unexpectedBetweenPatternAndTypeAnnotation`, if present.
  public func withUnexpectedBetweenPatternAndTypeAnnotation(
    _ newChild: UnexpectedNodesSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPatternAndTypeAnnotation)
    return OptionalBindingConditionSyntax(newData)
  }

  public var typeAnnotation: TypeAnnotationSyntax? {
    get {
      let childData = data.child(at: Cursor.typeAnnotation,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeAnnotationSyntax(childData!)
    }
    set(value) {
      self = withTypeAnnotation(value)
    }
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeAnnotationSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.typeAnnotation)
    return OptionalBindingConditionSyntax(newData)
  }

  public var unexpectedBetweenTypeAnnotationAndInitializer: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenTypeAnnotationAndInitializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTypeAnnotationAndInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTypeAnnotationAndInitializer` replaced.
  /// - param newChild: The new `unexpectedBetweenTypeAnnotationAndInitializer` to replace the node's
  ///                   current `unexpectedBetweenTypeAnnotationAndInitializer`, if present.
  public func withUnexpectedBetweenTypeAnnotationAndInitializer(
    _ newChild: UnexpectedNodesSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenTypeAnnotationAndInitializer)
    return OptionalBindingConditionSyntax(newData)
  }

  public var initializer: InitializerClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.initializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.initializer)
    return OptionalBindingConditionSyntax(newData)
  }
}

extension OptionalBindingConditionSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLetOrVarKeyword": unexpectedBeforeLetOrVarKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "letOrVarKeyword": Syntax(letOrVarKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLetOrVarKeywordAndPattern": unexpectedBetweenLetOrVarKeywordAndPattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": Syntax(pattern).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPatternAndTypeAnnotation": unexpectedBetweenPatternAndTypeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeAnnotation": typeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenTypeAnnotationAndInitializer": unexpectedBetweenTypeAnnotationAndInitializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "initializer": initializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - UnavailabilityConditionSyntax

public struct UnavailabilityConditionSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforePoundUnavailableKeyword
    case poundUnavailableKeyword
    case unexpectedBetweenPoundUnavailableKeywordAndLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndAvailabilitySpec
    case availabilitySpec
    case unexpectedBetweenAvailabilitySpecAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `UnavailabilityConditionSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .unavailabilityCondition else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `UnavailabilityConditionSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .unavailabilityCondition)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforePoundUnavailableKeyword: UnexpectedNodesSyntax? = nil,
    poundUnavailableKeyword: TokenSyntax,
    _ unexpectedBetweenPoundUnavailableKeywordAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax,
    _ unexpectedBetweenLeftParenAndAvailabilitySpec: UnexpectedNodesSyntax? = nil,
    availabilitySpec: AvailabilitySpecListSyntax,
    _ unexpectedBetweenAvailabilitySpecAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforePoundUnavailableKeyword?.raw,
      poundUnavailableKeyword.raw,
      unexpectedBetweenPoundUnavailableKeywordAndLeftParen?.raw,
      leftParen.raw,
      unexpectedBetweenLeftParenAndAvailabilitySpec?.raw,
      availabilitySpec.raw,
      unexpectedBetweenAvailabilitySpecAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.unavailabilityCondition,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforePoundUnavailableKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforePoundUnavailableKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforePoundUnavailableKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforePoundUnavailableKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforePoundUnavailableKeyword` to replace the node's
  ///                   current `unexpectedBeforePoundUnavailableKeyword`, if present.
  public func withUnexpectedBeforePoundUnavailableKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforePoundUnavailableKeyword)
    return UnavailabilityConditionSyntax(newData)
  }

  public var poundUnavailableKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.poundUnavailableKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPoundUnavailableKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `poundUnavailableKeyword` replaced.
  /// - param newChild: The new `poundUnavailableKeyword` to replace the node's
  ///                   current `poundUnavailableKeyword`, if present.
  public func withPoundUnavailableKeyword(
    _ newChild: TokenSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.poundUnavailableKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.poundUnavailableKeyword)
    return UnavailabilityConditionSyntax(newData)
  }

  public var unexpectedBetweenPoundUnavailableKeywordAndLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPoundUnavailableKeywordAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPoundUnavailableKeywordAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPoundUnavailableKeywordAndLeftParen` replaced.
  /// - param newChild: The new `unexpectedBetweenPoundUnavailableKeywordAndLeftParen` to replace the node's
  ///                   current `unexpectedBetweenPoundUnavailableKeywordAndLeftParen`, if present.
  public func withUnexpectedBetweenPoundUnavailableKeywordAndLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPoundUnavailableKeywordAndLeftParen)
    return UnavailabilityConditionSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return UnavailabilityConditionSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndAvailabilitySpec: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndAvailabilitySpec,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndAvailabilitySpec(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndAvailabilitySpec` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndAvailabilitySpec` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndAvailabilitySpec`, if present.
  public func withUnexpectedBetweenLeftParenAndAvailabilitySpec(
    _ newChild: UnexpectedNodesSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndAvailabilitySpec)
    return UnavailabilityConditionSyntax(newData)
  }

  public var availabilitySpec: AvailabilitySpecListSyntax {
    get {
      let childData = data.child(at: Cursor.availabilitySpec,
                                 parent: Syntax(self))
      return AvailabilitySpecListSyntax(childData!)
    }
    set(value) {
      self = withAvailabilitySpec(value)
    }
  }

  /// Adds the provided `AvailabilityArgument` to the node's `availabilitySpec`
  /// collection.
  /// - param element: The new `AvailabilityArgument` to add to the node's
  ///                  `availabilitySpec` collection.
  /// - returns: A copy of the receiver with the provided `AvailabilityArgument`
  ///            appended to its `availabilitySpec` collection.
  public func addAvailabilityArgument(_ element: AvailabilityArgumentSyntax) -> UnavailabilityConditionSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.availabilitySpec] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.availabilitySpecList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.availabilitySpec)
    return UnavailabilityConditionSyntax(newData)
  }

  /// Returns a copy of the receiver with its `availabilitySpec` replaced.
  /// - param newChild: The new `availabilitySpec` to replace the node's
  ///                   current `availabilitySpec`, if present.
  public func withAvailabilitySpec(
    _ newChild: AvailabilitySpecListSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.availabilitySpecList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.availabilitySpec)
    return UnavailabilityConditionSyntax(newData)
  }

  public var unexpectedBetweenAvailabilitySpecAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAvailabilitySpecAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAvailabilitySpecAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAvailabilitySpecAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenAvailabilitySpecAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenAvailabilitySpecAndRightParen`, if present.
  public func withUnexpectedBetweenAvailabilitySpecAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAvailabilitySpecAndRightParen)
    return UnavailabilityConditionSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> UnavailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightParen, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return UnavailabilityConditionSyntax(newData)
  }
}

extension UnavailabilityConditionSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePoundUnavailableKeyword": unexpectedBeforePoundUnavailableKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundUnavailableKeyword": Syntax(poundUnavailableKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPoundUnavailableKeywordAndLeftParen": unexpectedBetweenPoundUnavailableKeywordAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndAvailabilitySpec": unexpectedBetweenLeftParenAndAvailabilitySpec.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "availabilitySpec": Syntax(availabilitySpec).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAvailabilitySpecAndRightParen": unexpectedBetweenAvailabilitySpecAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ElseIfContinuationSyntax

public struct ElseIfContinuationSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeIfStatement
    case ifStatement
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ElseIfContinuationSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .elseIfContinuation else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ElseIfContinuationSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .elseIfContinuation)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeIfStatement: UnexpectedNodesSyntax? = nil,
    ifStatement: IfStmtSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeIfStatement?.raw,
      ifStatement.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.elseIfContinuation,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeIfStatement: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeIfStatement,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeIfStatement(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeIfStatement` replaced.
  /// - param newChild: The new `unexpectedBeforeIfStatement` to replace the node's
  ///                   current `unexpectedBeforeIfStatement`, if present.
  public func withUnexpectedBeforeIfStatement(
    _ newChild: UnexpectedNodesSyntax?) -> ElseIfContinuationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeIfStatement)
    return ElseIfContinuationSyntax(newData)
  }

  public var ifStatement: IfStmtSyntax {
    get {
      let childData = data.child(at: Cursor.ifStatement,
                                 parent: Syntax(self))
      return IfStmtSyntax(childData!)
    }
    set(value) {
      self = withIfStatement(value)
    }
  }

  /// Returns a copy of the receiver with its `ifStatement` replaced.
  /// - param newChild: The new `ifStatement` to replace the node's
  ///                   current `ifStatement`, if present.
  public func withIfStatement(
    _ newChild: IfStmtSyntax?) -> ElseIfContinuationSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.ifStmt, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.ifStatement)
    return ElseIfContinuationSyntax(newData)
  }
}

extension ElseIfContinuationSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeIfStatement": unexpectedBeforeIfStatement.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "ifStatement": Syntax(ifStatement).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ElseBlockSyntax

public struct ElseBlockSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeElseKeyword
    case elseKeyword
    case unexpectedBetweenElseKeywordAndBody
    case body
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ElseBlockSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .elseBlock else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ElseBlockSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .elseBlock)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeElseKeyword: UnexpectedNodesSyntax? = nil,
    elseKeyword: TokenSyntax,
    _ unexpectedBetweenElseKeywordAndBody: UnexpectedNodesSyntax? = nil,
    body: CodeBlockSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeElseKeyword?.raw,
      elseKeyword.raw,
      unexpectedBetweenElseKeywordAndBody?.raw,
      body.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.elseBlock,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeElseKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeElseKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeElseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeElseKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeElseKeyword` to replace the node's
  ///                   current `unexpectedBeforeElseKeyword`, if present.
  public func withUnexpectedBeforeElseKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> ElseBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeElseKeyword)
    return ElseBlockSyntax(newData)
  }

  public var elseKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.elseKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withElseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `elseKeyword` replaced.
  /// - param newChild: The new `elseKeyword` to replace the node's
  ///                   current `elseKeyword`, if present.
  public func withElseKeyword(
    _ newChild: TokenSyntax?) -> ElseBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.elseKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.elseKeyword)
    return ElseBlockSyntax(newData)
  }

  public var unexpectedBetweenElseKeywordAndBody: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenElseKeywordAndBody,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenElseKeywordAndBody(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenElseKeywordAndBody` replaced.
  /// - param newChild: The new `unexpectedBetweenElseKeywordAndBody` to replace the node's
  ///                   current `unexpectedBetweenElseKeywordAndBody`, if present.
  public func withUnexpectedBetweenElseKeywordAndBody(
    _ newChild: UnexpectedNodesSyntax?) -> ElseBlockSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenElseKeywordAndBody)
    return ElseBlockSyntax(newData)
  }

  public var body: CodeBlockSyntax {
    get {
      let childData = data.child(at: Cursor.body,
                                 parent: Syntax(self))
      return CodeBlockSyntax(childData!)
    }
    set(value) {
      self = withBody(value)
    }
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> ElseBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.codeBlock, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.body)
    return ElseBlockSyntax(newData)
  }
}

extension ElseBlockSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeElseKeyword": unexpectedBeforeElseKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elseKeyword": Syntax(elseKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenElseKeywordAndBody": unexpectedBetweenElseKeywordAndBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "body": Syntax(body).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - SwitchCaseSyntax

public struct SwitchCaseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeUnknownAttr
    case unknownAttr
    case unexpectedBetweenUnknownAttrAndLabel
    case label
    case unexpectedBetweenLabelAndStatements
    case statements
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SwitchCaseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .switchCase else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `SwitchCaseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .switchCase)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeUnknownAttr: UnexpectedNodesSyntax? = nil,
    unknownAttr: AttributeSyntax?,
    _ unexpectedBetweenUnknownAttrAndLabel: UnexpectedNodesSyntax? = nil,
    label: Syntax,
    _ unexpectedBetweenLabelAndStatements: UnexpectedNodesSyntax? = nil,
    statements: CodeBlockItemListSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeUnknownAttr?.raw,
      unknownAttr?.raw,
      unexpectedBetweenUnknownAttrAndLabel?.raw,
      label.raw,
      unexpectedBetweenLabelAndStatements?.raw,
      statements.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.switchCase,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeUnknownAttr: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeUnknownAttr,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeUnknownAttr(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeUnknownAttr` replaced.
  /// - param newChild: The new `unexpectedBeforeUnknownAttr` to replace the node's
  ///                   current `unexpectedBeforeUnknownAttr`, if present.
  public func withUnexpectedBeforeUnknownAttr(
    _ newChild: UnexpectedNodesSyntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeUnknownAttr)
    return SwitchCaseSyntax(newData)
  }

  public var unknownAttr: AttributeSyntax? {
    get {
      let childData = data.child(at: Cursor.unknownAttr,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return AttributeSyntax(childData!)
    }
    set(value) {
      self = withUnknownAttr(value)
    }
  }

  /// Returns a copy of the receiver with its `unknownAttr` replaced.
  /// - param newChild: The new `unknownAttr` to replace the node's
  ///                   current `unknownAttr`, if present.
  public func withUnknownAttr(
    _ newChild: AttributeSyntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unknownAttr)
    return SwitchCaseSyntax(newData)
  }

  public var unexpectedBetweenUnknownAttrAndLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenUnknownAttrAndLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenUnknownAttrAndLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenUnknownAttrAndLabel` replaced.
  /// - param newChild: The new `unexpectedBetweenUnknownAttrAndLabel` to replace the node's
  ///                   current `unexpectedBetweenUnknownAttrAndLabel`, if present.
  public func withUnexpectedBetweenUnknownAttrAndLabel(
    _ newChild: UnexpectedNodesSyntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenUnknownAttrAndLabel)
    return SwitchCaseSyntax(newData)
  }

  public var label: Syntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: Syntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.label)
    return SwitchCaseSyntax(newData)
  }

  public var unexpectedBetweenLabelAndStatements: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLabelAndStatements,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLabelAndStatements(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLabelAndStatements` replaced.
  /// - param newChild: The new `unexpectedBetweenLabelAndStatements` to replace the node's
  ///                   current `unexpectedBetweenLabelAndStatements`, if present.
  public func withUnexpectedBetweenLabelAndStatements(
    _ newChild: UnexpectedNodesSyntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLabelAndStatements)
    return SwitchCaseSyntax(newData)
  }

  public var statements: CodeBlockItemListSyntax {
    get {
      let childData = data.child(at: Cursor.statements,
                                 parent: Syntax(self))
      return CodeBlockItemListSyntax(childData!)
    }
    set(value) {
      self = withStatements(value)
    }
  }

  /// Adds the provided `Statement` to the node's `statements`
  /// collection.
  /// - param element: The new `Statement` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `Statement`
  ///            appended to its `statements` collection.
  public func addStatement(_ element: CodeBlockItemSyntax) -> SwitchCaseSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.statements] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.codeBlockItemList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.statements)
    return SwitchCaseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.codeBlockItemList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.statements)
    return SwitchCaseSyntax(newData)
  }
}

extension SwitchCaseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeUnknownAttr": unexpectedBeforeUnknownAttr.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unknownAttr": unknownAttr.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenUnknownAttrAndLabel": unexpectedBetweenUnknownAttrAndLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLabelAndStatements": unexpectedBetweenLabelAndStatements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "statements": Syntax(statements).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - SwitchDefaultLabelSyntax

public struct SwitchDefaultLabelSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeDefaultKeyword
    case defaultKeyword
    case unexpectedBetweenDefaultKeywordAndColon
    case colon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SwitchDefaultLabelSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .switchDefaultLabel else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `SwitchDefaultLabelSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .switchDefaultLabel)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeDefaultKeyword: UnexpectedNodesSyntax? = nil,
    defaultKeyword: TokenSyntax,
    _ unexpectedBetweenDefaultKeywordAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeDefaultKeyword?.raw,
      defaultKeyword.raw,
      unexpectedBetweenDefaultKeywordAndColon?.raw,
      colon.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.switchDefaultLabel,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeDefaultKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeDefaultKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeDefaultKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeDefaultKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeDefaultKeyword` to replace the node's
  ///                   current `unexpectedBeforeDefaultKeyword`, if present.
  public func withUnexpectedBeforeDefaultKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> SwitchDefaultLabelSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeDefaultKeyword)
    return SwitchDefaultLabelSyntax(newData)
  }

  public var defaultKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.defaultKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDefaultKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `defaultKeyword` replaced.
  /// - param newChild: The new `defaultKeyword` to replace the node's
  ///                   current `defaultKeyword`, if present.
  public func withDefaultKeyword(
    _ newChild: TokenSyntax?) -> SwitchDefaultLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.defaultKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.defaultKeyword)
    return SwitchDefaultLabelSyntax(newData)
  }

  public var unexpectedBetweenDefaultKeywordAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenDefaultKeywordAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDefaultKeywordAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDefaultKeywordAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenDefaultKeywordAndColon` to replace the node's
  ///                   current `unexpectedBetweenDefaultKeywordAndColon`, if present.
  public func withUnexpectedBetweenDefaultKeywordAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> SwitchDefaultLabelSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenDefaultKeywordAndColon)
    return SwitchDefaultLabelSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> SwitchDefaultLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return SwitchDefaultLabelSyntax(newData)
  }
}

extension SwitchDefaultLabelSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeDefaultKeyword": unexpectedBeforeDefaultKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "defaultKeyword": Syntax(defaultKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenDefaultKeywordAndColon": unexpectedBetweenDefaultKeywordAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - CaseItemSyntax

public struct CaseItemSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforePattern
    case pattern
    case unexpectedBetweenPatternAndWhereClause
    case whereClause
    case unexpectedBetweenWhereClauseAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CaseItemSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .caseItem else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CaseItemSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .caseItem)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforePattern: UnexpectedNodesSyntax? = nil,
    pattern: PatternSyntax,
    _ unexpectedBetweenPatternAndWhereClause: UnexpectedNodesSyntax? = nil,
    whereClause: WhereClauseSyntax?,
    _ unexpectedBetweenWhereClauseAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforePattern?.raw,
      pattern.raw,
      unexpectedBetweenPatternAndWhereClause?.raw,
      whereClause?.raw,
      unexpectedBetweenWhereClauseAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.caseItem,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforePattern: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforePattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforePattern(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforePattern` replaced.
  /// - param newChild: The new `unexpectedBeforePattern` to replace the node's
  ///                   current `unexpectedBeforePattern`, if present.
  public func withUnexpectedBeforePattern(
    _ newChild: UnexpectedNodesSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforePattern)
    return CaseItemSyntax(newData)
  }

  public var pattern: PatternSyntax {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingPattern, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return CaseItemSyntax(newData)
  }

  public var unexpectedBetweenPatternAndWhereClause: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPatternAndWhereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPatternAndWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPatternAndWhereClause` replaced.
  /// - param newChild: The new `unexpectedBetweenPatternAndWhereClause` to replace the node's
  ///                   current `unexpectedBetweenPatternAndWhereClause`, if present.
  public func withUnexpectedBetweenPatternAndWhereClause(
    _ newChild: UnexpectedNodesSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPatternAndWhereClause)
    return CaseItemSyntax(newData)
  }

  public var whereClause: WhereClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.whereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return WhereClauseSyntax(childData!)
    }
    set(value) {
      self = withWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `whereClause` replaced.
  /// - param newChild: The new `whereClause` to replace the node's
  ///                   current `whereClause`, if present.
  public func withWhereClause(
    _ newChild: WhereClauseSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.whereClause)
    return CaseItemSyntax(newData)
  }

  public var unexpectedBetweenWhereClauseAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenWhereClauseAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenWhereClauseAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenWhereClauseAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenWhereClauseAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenWhereClauseAndTrailingComma`, if present.
  public func withUnexpectedBetweenWhereClauseAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenWhereClauseAndTrailingComma)
    return CaseItemSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return CaseItemSyntax(newData)
  }
}

extension CaseItemSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePattern": unexpectedBeforePattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": Syntax(pattern).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPatternAndWhereClause": unexpectedBetweenPatternAndWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "whereClause": whereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenWhereClauseAndTrailingComma": unexpectedBetweenWhereClauseAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - CatchItemSyntax

public struct CatchItemSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforePattern
    case pattern
    case unexpectedBetweenPatternAndWhereClause
    case whereClause
    case unexpectedBetweenWhereClauseAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CatchItemSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .catchItem else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CatchItemSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .catchItem)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforePattern: UnexpectedNodesSyntax? = nil,
    pattern: PatternSyntax?,
    _ unexpectedBetweenPatternAndWhereClause: UnexpectedNodesSyntax? = nil,
    whereClause: WhereClauseSyntax?,
    _ unexpectedBetweenWhereClauseAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforePattern?.raw,
      pattern?.raw,
      unexpectedBetweenPatternAndWhereClause?.raw,
      whereClause?.raw,
      unexpectedBetweenWhereClauseAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.catchItem,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforePattern: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforePattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforePattern(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforePattern` replaced.
  /// - param newChild: The new `unexpectedBeforePattern` to replace the node's
  ///                   current `unexpectedBeforePattern`, if present.
  public func withUnexpectedBeforePattern(
    _ newChild: UnexpectedNodesSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforePattern)
    return CatchItemSyntax(newData)
  }

  public var pattern: PatternSyntax? {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return CatchItemSyntax(newData)
  }

  public var unexpectedBetweenPatternAndWhereClause: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPatternAndWhereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPatternAndWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPatternAndWhereClause` replaced.
  /// - param newChild: The new `unexpectedBetweenPatternAndWhereClause` to replace the node's
  ///                   current `unexpectedBetweenPatternAndWhereClause`, if present.
  public func withUnexpectedBetweenPatternAndWhereClause(
    _ newChild: UnexpectedNodesSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPatternAndWhereClause)
    return CatchItemSyntax(newData)
  }

  public var whereClause: WhereClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.whereClause,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return WhereClauseSyntax(childData!)
    }
    set(value) {
      self = withWhereClause(value)
    }
  }

  /// Returns a copy of the receiver with its `whereClause` replaced.
  /// - param newChild: The new `whereClause` to replace the node's
  ///                   current `whereClause`, if present.
  public func withWhereClause(
    _ newChild: WhereClauseSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.whereClause)
    return CatchItemSyntax(newData)
  }

  public var unexpectedBetweenWhereClauseAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenWhereClauseAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenWhereClauseAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenWhereClauseAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenWhereClauseAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenWhereClauseAndTrailingComma`, if present.
  public func withUnexpectedBetweenWhereClauseAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenWhereClauseAndTrailingComma)
    return CatchItemSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> CatchItemSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return CatchItemSyntax(newData)
  }
}

extension CatchItemSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePattern": unexpectedBeforePattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": pattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenPatternAndWhereClause": unexpectedBetweenPatternAndWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "whereClause": whereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenWhereClauseAndTrailingComma": unexpectedBetweenWhereClauseAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SwitchCaseLabelSyntax

public struct SwitchCaseLabelSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeCaseKeyword
    case caseKeyword
    case unexpectedBetweenCaseKeywordAndCaseItems
    case caseItems
    case unexpectedBetweenCaseItemsAndColon
    case colon
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SwitchCaseLabelSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .switchCaseLabel else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `SwitchCaseLabelSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .switchCaseLabel)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeCaseKeyword: UnexpectedNodesSyntax? = nil,
    caseKeyword: TokenSyntax,
    _ unexpectedBetweenCaseKeywordAndCaseItems: UnexpectedNodesSyntax? = nil,
    caseItems: CaseItemListSyntax,
    _ unexpectedBetweenCaseItemsAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeCaseKeyword?.raw,
      caseKeyword.raw,
      unexpectedBetweenCaseKeywordAndCaseItems?.raw,
      caseItems.raw,
      unexpectedBetweenCaseItemsAndColon?.raw,
      colon.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.switchCaseLabel,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeCaseKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeCaseKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeCaseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeCaseKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeCaseKeyword` to replace the node's
  ///                   current `unexpectedBeforeCaseKeyword`, if present.
  public func withUnexpectedBeforeCaseKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeCaseKeyword)
    return SwitchCaseLabelSyntax(newData)
  }

  public var caseKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.caseKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withCaseKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `caseKeyword` replaced.
  /// - param newChild: The new `caseKeyword` to replace the node's
  ///                   current `caseKeyword`, if present.
  public func withCaseKeyword(
    _ newChild: TokenSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.caseKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.caseKeyword)
    return SwitchCaseLabelSyntax(newData)
  }

  public var unexpectedBetweenCaseKeywordAndCaseItems: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenCaseKeywordAndCaseItems,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCaseKeywordAndCaseItems(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCaseKeywordAndCaseItems` replaced.
  /// - param newChild: The new `unexpectedBetweenCaseKeywordAndCaseItems` to replace the node's
  ///                   current `unexpectedBetweenCaseKeywordAndCaseItems`, if present.
  public func withUnexpectedBetweenCaseKeywordAndCaseItems(
    _ newChild: UnexpectedNodesSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenCaseKeywordAndCaseItems)
    return SwitchCaseLabelSyntax(newData)
  }

  public var caseItems: CaseItemListSyntax {
    get {
      let childData = data.child(at: Cursor.caseItems,
                                 parent: Syntax(self))
      return CaseItemListSyntax(childData!)
    }
    set(value) {
      self = withCaseItems(value)
    }
  }

  /// Adds the provided `CaseItem` to the node's `caseItems`
  /// collection.
  /// - param element: The new `CaseItem` to add to the node's
  ///                  `caseItems` collection.
  /// - returns: A copy of the receiver with the provided `CaseItem`
  ///            appended to its `caseItems` collection.
  public func addCaseItem(_ element: CaseItemSyntax) -> SwitchCaseLabelSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.caseItems] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.caseItemList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.caseItems)
    return SwitchCaseLabelSyntax(newData)
  }

  /// Returns a copy of the receiver with its `caseItems` replaced.
  /// - param newChild: The new `caseItems` to replace the node's
  ///                   current `caseItems`, if present.
  public func withCaseItems(
    _ newChild: CaseItemListSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.caseItemList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.caseItems)
    return SwitchCaseLabelSyntax(newData)
  }

  public var unexpectedBetweenCaseItemsAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenCaseItemsAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCaseItemsAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCaseItemsAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenCaseItemsAndColon` to replace the node's
  ///                   current `unexpectedBetweenCaseItemsAndColon`, if present.
  public func withUnexpectedBetweenCaseItemsAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenCaseItemsAndColon)
    return SwitchCaseLabelSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return SwitchCaseLabelSyntax(newData)
  }
}

extension SwitchCaseLabelSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeCaseKeyword": unexpectedBeforeCaseKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "caseKeyword": Syntax(caseKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenCaseKeywordAndCaseItems": unexpectedBetweenCaseKeywordAndCaseItems.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "caseItems": Syntax(caseItems).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenCaseItemsAndColon": unexpectedBetweenCaseItemsAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - CatchClauseSyntax

public struct CatchClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeCatchKeyword
    case catchKeyword
    case unexpectedBetweenCatchKeywordAndCatchItems
    case catchItems
    case unexpectedBetweenCatchItemsAndBody
    case body
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CatchClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .catchClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CatchClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .catchClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeCatchKeyword: UnexpectedNodesSyntax? = nil,
    catchKeyword: TokenSyntax,
    _ unexpectedBetweenCatchKeywordAndCatchItems: UnexpectedNodesSyntax? = nil,
    catchItems: CatchItemListSyntax?,
    _ unexpectedBetweenCatchItemsAndBody: UnexpectedNodesSyntax? = nil,
    body: CodeBlockSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeCatchKeyword?.raw,
      catchKeyword.raw,
      unexpectedBetweenCatchKeywordAndCatchItems?.raw,
      catchItems?.raw,
      unexpectedBetweenCatchItemsAndBody?.raw,
      body.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.catchClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeCatchKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeCatchKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeCatchKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeCatchKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeCatchKeyword` to replace the node's
  ///                   current `unexpectedBeforeCatchKeyword`, if present.
  public func withUnexpectedBeforeCatchKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeCatchKeyword)
    return CatchClauseSyntax(newData)
  }

  public var catchKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.catchKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withCatchKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `catchKeyword` replaced.
  /// - param newChild: The new `catchKeyword` to replace the node's
  ///                   current `catchKeyword`, if present.
  public func withCatchKeyword(
    _ newChild: TokenSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.catchKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.catchKeyword)
    return CatchClauseSyntax(newData)
  }

  public var unexpectedBetweenCatchKeywordAndCatchItems: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenCatchKeywordAndCatchItems,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCatchKeywordAndCatchItems(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCatchKeywordAndCatchItems` replaced.
  /// - param newChild: The new `unexpectedBetweenCatchKeywordAndCatchItems` to replace the node's
  ///                   current `unexpectedBetweenCatchKeywordAndCatchItems`, if present.
  public func withUnexpectedBetweenCatchKeywordAndCatchItems(
    _ newChild: UnexpectedNodesSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenCatchKeywordAndCatchItems)
    return CatchClauseSyntax(newData)
  }

  public var catchItems: CatchItemListSyntax? {
    get {
      let childData = data.child(at: Cursor.catchItems,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return CatchItemListSyntax(childData!)
    }
    set(value) {
      self = withCatchItems(value)
    }
  }

  /// Adds the provided `CatchItem` to the node's `catchItems`
  /// collection.
  /// - param element: The new `CatchItem` to add to the node's
  ///                  `catchItems` collection.
  /// - returns: A copy of the receiver with the provided `CatchItem`
  ///            appended to its `catchItems` collection.
  public func addCatchItem(_ element: CatchItemSyntax) -> CatchClauseSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.catchItems] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.catchItemList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.catchItems)
    return CatchClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `catchItems` replaced.
  /// - param newChild: The new `catchItems` to replace the node's
  ///                   current `catchItems`, if present.
  public func withCatchItems(
    _ newChild: CatchItemListSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.catchItems)
    return CatchClauseSyntax(newData)
  }

  public var unexpectedBetweenCatchItemsAndBody: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenCatchItemsAndBody,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCatchItemsAndBody(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCatchItemsAndBody` replaced.
  /// - param newChild: The new `unexpectedBetweenCatchItemsAndBody` to replace the node's
  ///                   current `unexpectedBetweenCatchItemsAndBody`, if present.
  public func withUnexpectedBetweenCatchItemsAndBody(
    _ newChild: UnexpectedNodesSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenCatchItemsAndBody)
    return CatchClauseSyntax(newData)
  }

  public var body: CodeBlockSyntax {
    get {
      let childData = data.child(at: Cursor.body,
                                 parent: Syntax(self))
      return CodeBlockSyntax(childData!)
    }
    set(value) {
      self = withBody(value)
    }
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.codeBlock, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.body)
    return CatchClauseSyntax(newData)
  }
}

extension CatchClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeCatchKeyword": unexpectedBeforeCatchKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "catchKeyword": Syntax(catchKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenCatchKeywordAndCatchItems": unexpectedBetweenCatchKeywordAndCatchItems.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "catchItems": catchItems.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenCatchItemsAndBody": unexpectedBetweenCatchItemsAndBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "body": Syntax(body).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - GenericWhereClauseSyntax

public struct GenericWhereClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeWhereKeyword
    case whereKeyword
    case unexpectedBetweenWhereKeywordAndRequirementList
    case requirementList
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericWhereClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericWhereClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericWhereClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericWhereClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeWhereKeyword: UnexpectedNodesSyntax? = nil,
    whereKeyword: TokenSyntax,
    _ unexpectedBetweenWhereKeywordAndRequirementList: UnexpectedNodesSyntax? = nil,
    requirementList: GenericRequirementListSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeWhereKeyword?.raw,
      whereKeyword.raw,
      unexpectedBetweenWhereKeywordAndRequirementList?.raw,
      requirementList.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.genericWhereClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeWhereKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeWhereKeyword,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeWhereKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeWhereKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeWhereKeyword` to replace the node's
  ///                   current `unexpectedBeforeWhereKeyword`, if present.
  public func withUnexpectedBeforeWhereKeyword(
    _ newChild: UnexpectedNodesSyntax?) -> GenericWhereClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeWhereKeyword)
    return GenericWhereClauseSyntax(newData)
  }

  public var whereKeyword: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.whereKeyword,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withWhereKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `whereKeyword` replaced.
  /// - param newChild: The new `whereKeyword` to replace the node's
  ///                   current `whereKeyword`, if present.
  public func withWhereKeyword(
    _ newChild: TokenSyntax?) -> GenericWhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.whereKeyword, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.whereKeyword)
    return GenericWhereClauseSyntax(newData)
  }

  public var unexpectedBetweenWhereKeywordAndRequirementList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenWhereKeywordAndRequirementList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenWhereKeywordAndRequirementList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenWhereKeywordAndRequirementList` replaced.
  /// - param newChild: The new `unexpectedBetweenWhereKeywordAndRequirementList` to replace the node's
  ///                   current `unexpectedBetweenWhereKeywordAndRequirementList`, if present.
  public func withUnexpectedBetweenWhereKeywordAndRequirementList(
    _ newChild: UnexpectedNodesSyntax?) -> GenericWhereClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenWhereKeywordAndRequirementList)
    return GenericWhereClauseSyntax(newData)
  }

  public var requirementList: GenericRequirementListSyntax {
    get {
      let childData = data.child(at: Cursor.requirementList,
                                 parent: Syntax(self))
      return GenericRequirementListSyntax(childData!)
    }
    set(value) {
      self = withRequirementList(value)
    }
  }

  /// Adds the provided `Requirement` to the node's `requirementList`
  /// collection.
  /// - param element: The new `Requirement` to add to the node's
  ///                  `requirementList` collection.
  /// - returns: A copy of the receiver with the provided `Requirement`
  ///            appended to its `requirementList` collection.
  public func addRequirement(_ element: GenericRequirementSyntax) -> GenericWhereClauseSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.requirementList] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.genericRequirementList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.requirementList)
    return GenericWhereClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `requirementList` replaced.
  /// - param newChild: The new `requirementList` to replace the node's
  ///                   current `requirementList`, if present.
  public func withRequirementList(
    _ newChild: GenericRequirementListSyntax?) -> GenericWhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.genericRequirementList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.requirementList)
    return GenericWhereClauseSyntax(newData)
  }
}

extension GenericWhereClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeWhereKeyword": unexpectedBeforeWhereKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "whereKeyword": Syntax(whereKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenWhereKeywordAndRequirementList": unexpectedBetweenWhereKeywordAndRequirementList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "requirementList": Syntax(requirementList).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - GenericRequirementSyntax

public struct GenericRequirementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeBody
    case body
    case unexpectedBetweenBodyAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericRequirementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericRequirement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericRequirementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericRequirement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeBody: UnexpectedNodesSyntax? = nil,
    body: Syntax,
    _ unexpectedBetweenBodyAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeBody?.raw,
      body.raw,
      unexpectedBetweenBodyAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.genericRequirement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeBody: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeBody,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeBody(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeBody` replaced.
  /// - param newChild: The new `unexpectedBeforeBody` to replace the node's
  ///                   current `unexpectedBeforeBody`, if present.
  public func withUnexpectedBeforeBody(
    _ newChild: UnexpectedNodesSyntax?) -> GenericRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeBody)
    return GenericRequirementSyntax(newData)
  }

  public var body: Syntax {
    get {
      let childData = data.child(at: Cursor.body,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withBody(value)
    }
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: Syntax?) -> GenericRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.body)
    return GenericRequirementSyntax(newData)
  }

  public var unexpectedBetweenBodyAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenBodyAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenBodyAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenBodyAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenBodyAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenBodyAndTrailingComma`, if present.
  public func withUnexpectedBetweenBodyAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> GenericRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenBodyAndTrailingComma)
    return GenericRequirementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> GenericRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return GenericRequirementSyntax(newData)
  }
}

extension GenericRequirementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeBody": unexpectedBeforeBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "body": Syntax(body).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenBodyAndTrailingComma": unexpectedBetweenBodyAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SameTypeRequirementSyntax

public struct SameTypeRequirementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftTypeIdentifier
    case leftTypeIdentifier
    case unexpectedBetweenLeftTypeIdentifierAndEqualityToken
    case equalityToken
    case unexpectedBetweenEqualityTokenAndRightTypeIdentifier
    case rightTypeIdentifier
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SameTypeRequirementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .sameTypeRequirement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `SameTypeRequirementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .sameTypeRequirement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftTypeIdentifier: UnexpectedNodesSyntax? = nil,
    leftTypeIdentifier: TypeSyntax,
    _ unexpectedBetweenLeftTypeIdentifierAndEqualityToken: UnexpectedNodesSyntax? = nil,
    equalityToken: TokenSyntax,
    _ unexpectedBetweenEqualityTokenAndRightTypeIdentifier: UnexpectedNodesSyntax? = nil,
    rightTypeIdentifier: TypeSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftTypeIdentifier?.raw,
      leftTypeIdentifier.raw,
      unexpectedBetweenLeftTypeIdentifierAndEqualityToken?.raw,
      equalityToken.raw,
      unexpectedBetweenEqualityTokenAndRightTypeIdentifier?.raw,
      rightTypeIdentifier.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.sameTypeRequirement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftTypeIdentifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftTypeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftTypeIdentifier` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftTypeIdentifier` to replace the node's
  ///                   current `unexpectedBeforeLeftTypeIdentifier`, if present.
  public func withUnexpectedBeforeLeftTypeIdentifier(
    _ newChild: UnexpectedNodesSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftTypeIdentifier)
    return SameTypeRequirementSyntax(newData)
  }

  public var leftTypeIdentifier: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.leftTypeIdentifier,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withLeftTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `leftTypeIdentifier` replaced.
  /// - param newChild: The new `leftTypeIdentifier` to replace the node's
  ///                   current `leftTypeIdentifier`, if present.
  public func withLeftTypeIdentifier(
    _ newChild: TypeSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftTypeIdentifier)
    return SameTypeRequirementSyntax(newData)
  }

  public var unexpectedBetweenLeftTypeIdentifierAndEqualityToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftTypeIdentifierAndEqualityToken,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftTypeIdentifierAndEqualityToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftTypeIdentifierAndEqualityToken` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftTypeIdentifierAndEqualityToken` to replace the node's
  ///                   current `unexpectedBetweenLeftTypeIdentifierAndEqualityToken`, if present.
  public func withUnexpectedBetweenLeftTypeIdentifierAndEqualityToken(
    _ newChild: UnexpectedNodesSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftTypeIdentifierAndEqualityToken)
    return SameTypeRequirementSyntax(newData)
  }

  public var equalityToken: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.equalityToken,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEqualityToken(value)
    }
  }

  /// Returns a copy of the receiver with its `equalityToken` replaced.
  /// - param newChild: The new `equalityToken` to replace the node's
  ///                   current `equalityToken`, if present.
  public func withEqualityToken(
    _ newChild: TokenSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.spacedBinaryOperator(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.equalityToken)
    return SameTypeRequirementSyntax(newData)
  }

  public var unexpectedBetweenEqualityTokenAndRightTypeIdentifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenEqualityTokenAndRightTypeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenEqualityTokenAndRightTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenEqualityTokenAndRightTypeIdentifier` replaced.
  /// - param newChild: The new `unexpectedBetweenEqualityTokenAndRightTypeIdentifier` to replace the node's
  ///                   current `unexpectedBetweenEqualityTokenAndRightTypeIdentifier`, if present.
  public func withUnexpectedBetweenEqualityTokenAndRightTypeIdentifier(
    _ newChild: UnexpectedNodesSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenEqualityTokenAndRightTypeIdentifier)
    return SameTypeRequirementSyntax(newData)
  }

  public var rightTypeIdentifier: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.rightTypeIdentifier,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withRightTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `rightTypeIdentifier` replaced.
  /// - param newChild: The new `rightTypeIdentifier` to replace the node's
  ///                   current `rightTypeIdentifier`, if present.
  public func withRightTypeIdentifier(
    _ newChild: TypeSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightTypeIdentifier)
    return SameTypeRequirementSyntax(newData)
  }
}

extension SameTypeRequirementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftTypeIdentifier": unexpectedBeforeLeftTypeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftTypeIdentifier": Syntax(leftTypeIdentifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftTypeIdentifierAndEqualityToken": unexpectedBetweenLeftTypeIdentifierAndEqualityToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "equalityToken": Syntax(equalityToken).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenEqualityTokenAndRightTypeIdentifier": unexpectedBetweenEqualityTokenAndRightTypeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightTypeIdentifier": Syntax(rightTypeIdentifier).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - LayoutRequirementSyntax

public struct LayoutRequirementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeTypeIdentifier
    case typeIdentifier
    case unexpectedBetweenTypeIdentifierAndColon
    case colon
    case unexpectedBetweenColonAndLayoutConstraint
    case layoutConstraint
    case unexpectedBetweenLayoutConstraintAndLeftParen
    case leftParen
    case unexpectedBetweenLeftParenAndSize
    case size
    case unexpectedBetweenSizeAndComma
    case comma
    case unexpectedBetweenCommaAndAlignment
    case alignment
    case unexpectedBetweenAlignmentAndRightParen
    case rightParen
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `LayoutRequirementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .layoutRequirement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `LayoutRequirementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .layoutRequirement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeTypeIdentifier: UnexpectedNodesSyntax? = nil,
    typeIdentifier: TypeSyntax,
    _ unexpectedBetweenTypeIdentifierAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndLayoutConstraint: UnexpectedNodesSyntax? = nil,
    layoutConstraint: TokenSyntax,
    _ unexpectedBetweenLayoutConstraintAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax?,
    _ unexpectedBetweenLeftParenAndSize: UnexpectedNodesSyntax? = nil,
    size: TokenSyntax?,
    _ unexpectedBetweenSizeAndComma: UnexpectedNodesSyntax? = nil,
    comma: TokenSyntax?,
    _ unexpectedBetweenCommaAndAlignment: UnexpectedNodesSyntax? = nil,
    alignment: TokenSyntax?,
    _ unexpectedBetweenAlignmentAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeTypeIdentifier?.raw,
      typeIdentifier.raw,
      unexpectedBetweenTypeIdentifierAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndLayoutConstraint?.raw,
      layoutConstraint.raw,
      unexpectedBetweenLayoutConstraintAndLeftParen?.raw,
      leftParen?.raw,
      unexpectedBetweenLeftParenAndSize?.raw,
      size?.raw,
      unexpectedBetweenSizeAndComma?.raw,
      comma?.raw,
      unexpectedBetweenCommaAndAlignment?.raw,
      alignment?.raw,
      unexpectedBetweenAlignmentAndRightParen?.raw,
      rightParen?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.layoutRequirement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeTypeIdentifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeTypeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeTypeIdentifier` replaced.
  /// - param newChild: The new `unexpectedBeforeTypeIdentifier` to replace the node's
  ///                   current `unexpectedBeforeTypeIdentifier`, if present.
  public func withUnexpectedBeforeTypeIdentifier(
    _ newChild: UnexpectedNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeTypeIdentifier)
    return LayoutRequirementSyntax(newData)
  }

  public var typeIdentifier: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.typeIdentifier,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `typeIdentifier` replaced.
  /// - param newChild: The new `typeIdentifier` to replace the node's
  ///                   current `typeIdentifier`, if present.
  public func withTypeIdentifier(
    _ newChild: TypeSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.typeIdentifier)
    return LayoutRequirementSyntax(newData)
  }

  public var unexpectedBetweenTypeIdentifierAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenTypeIdentifierAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTypeIdentifierAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTypeIdentifierAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenTypeIdentifierAndColon` to replace the node's
  ///                   current `unexpectedBetweenTypeIdentifierAndColon`, if present.
  public func withUnexpectedBetweenTypeIdentifierAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenTypeIdentifierAndColon)
    return LayoutRequirementSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return LayoutRequirementSyntax(newData)
  }

  public var unexpectedBetweenColonAndLayoutConstraint: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndLayoutConstraint,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndLayoutConstraint(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndLayoutConstraint` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndLayoutConstraint` to replace the node's
  ///                   current `unexpectedBetweenColonAndLayoutConstraint`, if present.
  public func withUnexpectedBetweenColonAndLayoutConstraint(
    _ newChild: UnexpectedNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndLayoutConstraint)
    return LayoutRequirementSyntax(newData)
  }

  public var layoutConstraint: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.layoutConstraint,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLayoutConstraint(value)
    }
  }

  /// Returns a copy of the receiver with its `layoutConstraint` replaced.
  /// - param newChild: The new `layoutConstraint` to replace the node's
  ///                   current `layoutConstraint`, if present.
  public func withLayoutConstraint(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.layoutConstraint)
    return LayoutRequirementSyntax(newData)
  }

  public var unexpectedBetweenLayoutConstraintAndLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLayoutConstraintAndLeftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLayoutConstraintAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLayoutConstraintAndLeftParen` replaced.
  /// - param newChild: The new `unexpectedBetweenLayoutConstraintAndLeftParen` to replace the node's
  ///                   current `unexpectedBetweenLayoutConstraintAndLeftParen`, if present.
  public func withUnexpectedBetweenLayoutConstraintAndLeftParen(
    _ newChild: UnexpectedNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLayoutConstraintAndLeftParen)
    return LayoutRequirementSyntax(newData)
  }

  public var leftParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.leftParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.leftParen)
    return LayoutRequirementSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndSize: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftParenAndSize,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndSize(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndSize` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndSize` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndSize`, if present.
  public func withUnexpectedBetweenLeftParenAndSize(
    _ newChild: UnexpectedNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftParenAndSize)
    return LayoutRequirementSyntax(newData)
  }

  public var size: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.size,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSize(value)
    }
  }

  /// Returns a copy of the receiver with its `size` replaced.
  /// - param newChild: The new `size` to replace the node's
  ///                   current `size`, if present.
  public func withSize(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.size)
    return LayoutRequirementSyntax(newData)
  }

  public var unexpectedBetweenSizeAndComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenSizeAndComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenSizeAndComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenSizeAndComma` replaced.
  /// - param newChild: The new `unexpectedBetweenSizeAndComma` to replace the node's
  ///                   current `unexpectedBetweenSizeAndComma`, if present.
  public func withUnexpectedBetweenSizeAndComma(
    _ newChild: UnexpectedNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenSizeAndComma)
    return LayoutRequirementSyntax(newData)
  }

  public var comma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.comma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withComma(value)
    }
  }

  /// Returns a copy of the receiver with its `comma` replaced.
  /// - param newChild: The new `comma` to replace the node's
  ///                   current `comma`, if present.
  public func withComma(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.comma)
    return LayoutRequirementSyntax(newData)
  }

  public var unexpectedBetweenCommaAndAlignment: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenCommaAndAlignment,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCommaAndAlignment(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCommaAndAlignment` replaced.
  /// - param newChild: The new `unexpectedBetweenCommaAndAlignment` to replace the node's
  ///                   current `unexpectedBetweenCommaAndAlignment`, if present.
  public func withUnexpectedBetweenCommaAndAlignment(
    _ newChild: UnexpectedNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenCommaAndAlignment)
    return LayoutRequirementSyntax(newData)
  }

  public var alignment: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.alignment,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAlignment(value)
    }
  }

  /// Returns a copy of the receiver with its `alignment` replaced.
  /// - param newChild: The new `alignment` to replace the node's
  ///                   current `alignment`, if present.
  public func withAlignment(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.alignment)
    return LayoutRequirementSyntax(newData)
  }

  public var unexpectedBetweenAlignmentAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAlignmentAndRightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAlignmentAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAlignmentAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenAlignmentAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenAlignmentAndRightParen`, if present.
  public func withUnexpectedBetweenAlignmentAndRightParen(
    _ newChild: UnexpectedNodesSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAlignmentAndRightParen)
    return LayoutRequirementSyntax(newData)
  }

  public var rightParen: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.rightParen,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> LayoutRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.rightParen)
    return LayoutRequirementSyntax(newData)
  }
}

extension LayoutRequirementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeTypeIdentifier": unexpectedBeforeTypeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeIdentifier": Syntax(typeIdentifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenTypeIdentifierAndColon": unexpectedBetweenTypeIdentifierAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndLayoutConstraint": unexpectedBetweenColonAndLayoutConstraint.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "layoutConstraint": Syntax(layoutConstraint).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLayoutConstraintAndLeftParen": unexpectedBetweenLayoutConstraintAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": leftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenLeftParenAndSize": unexpectedBetweenLeftParenAndSize.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "size": size.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenSizeAndComma": unexpectedBetweenSizeAndComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "comma": comma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenCommaAndAlignment": unexpectedBetweenCommaAndAlignment.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "alignment": alignment.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAlignmentAndRightParen": unexpectedBetweenAlignmentAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": rightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - GenericParameterSyntax

public struct GenericParameterSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeAttributes
    case attributes
    case unexpectedBetweenAttributesAndName
    case name
    case unexpectedBetweenNameAndColon
    case colon
    case unexpectedBetweenColonAndInheritedType
    case inheritedType
    case unexpectedBetweenInheritedTypeAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericParameterSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericParameter else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericParameterSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericParameter)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax?,
    _ unexpectedBetweenAttributesAndName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax?,
    _ unexpectedBetweenColonAndInheritedType: UnexpectedNodesSyntax? = nil,
    inheritedType: TypeSyntax?,
    _ unexpectedBetweenInheritedTypeAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAttributes?.raw,
      attributes?.raw,
      unexpectedBetweenAttributesAndName?.raw,
      name.raw,
      unexpectedBetweenNameAndColon?.raw,
      colon?.raw,
      unexpectedBetweenColonAndInheritedType?.raw,
      inheritedType?.raw,
      unexpectedBetweenInheritedTypeAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.genericParameter,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeAttributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAttributes(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAttributes` replaced.
  /// - param newChild: The new `unexpectedBeforeAttributes` to replace the node's
  ///                   current `unexpectedBeforeAttributes`, if present.
  public func withUnexpectedBeforeAttributes(
    _ newChild: UnexpectedNodesSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeAttributes)
    return GenericParameterSyntax(newData)
  }

  public var attributes: AttributeListSyntax? {
    get {
      let childData = data.child(at: Cursor.attributes,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return AttributeListSyntax(childData!)
    }
    set(value) {
      self = withAttributes(value)
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> GenericParameterSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.attributes] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.attributes)
    return GenericParameterSyntax(newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.attributes)
    return GenericParameterSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenAttributesAndName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAttributesAndName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAttributesAndName` replaced.
  /// - param newChild: The new `unexpectedBetweenAttributesAndName` to replace the node's
  ///                   current `unexpectedBetweenAttributesAndName`, if present.
  public func withUnexpectedBetweenAttributesAndName(
    _ newChild: UnexpectedNodesSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenAttributesAndName)
    return GenericParameterSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return GenericParameterSyntax(newData)
  }

  public var unexpectedBetweenNameAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndColon` to replace the node's
  ///                   current `unexpectedBetweenNameAndColon`, if present.
  public func withUnexpectedBetweenNameAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndColon)
    return GenericParameterSyntax(newData)
  }

  public var colon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return GenericParameterSyntax(newData)
  }

  public var unexpectedBetweenColonAndInheritedType: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndInheritedType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndInheritedType(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndInheritedType` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndInheritedType` to replace the node's
  ///                   current `unexpectedBetweenColonAndInheritedType`, if present.
  public func withUnexpectedBetweenColonAndInheritedType(
    _ newChild: UnexpectedNodesSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndInheritedType)
    return GenericParameterSyntax(newData)
  }

  public var inheritedType: TypeSyntax? {
    get {
      let childData = data.child(at: Cursor.inheritedType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withInheritedType(value)
    }
  }

  /// Returns a copy of the receiver with its `inheritedType` replaced.
  /// - param newChild: The new `inheritedType` to replace the node's
  ///                   current `inheritedType`, if present.
  public func withInheritedType(
    _ newChild: TypeSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.inheritedType)
    return GenericParameterSyntax(newData)
  }

  public var unexpectedBetweenInheritedTypeAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenInheritedTypeAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenInheritedTypeAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenInheritedTypeAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenInheritedTypeAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenInheritedTypeAndTrailingComma`, if present.
  public func withUnexpectedBetweenInheritedTypeAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenInheritedTypeAndTrailingComma)
    return GenericParameterSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return GenericParameterSyntax(newData)
  }
}

extension GenericParameterSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndName": unexpectedBetweenAttributesAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndColon": unexpectedBetweenNameAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": colon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenColonAndInheritedType": unexpectedBetweenColonAndInheritedType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inheritedType": inheritedType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInheritedTypeAndTrailingComma": unexpectedBetweenInheritedTypeAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PrimaryAssociatedTypeSyntax

public struct PrimaryAssociatedTypeSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeName
    case name
    case unexpectedBetweenNameAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrimaryAssociatedTypeSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .primaryAssociatedType else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrimaryAssociatedTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .primaryAssociatedType)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeName?.raw,
      name.raw,
      unexpectedBetweenNameAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.primaryAssociatedType,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeName` replaced.
  /// - param newChild: The new `unexpectedBeforeName` to replace the node's
  ///                   current `unexpectedBeforeName`, if present.
  public func withUnexpectedBeforeName(
    _ newChild: UnexpectedNodesSyntax?) -> PrimaryAssociatedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeName)
    return PrimaryAssociatedTypeSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> PrimaryAssociatedTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.name)
    return PrimaryAssociatedTypeSyntax(newData)
  }

  public var unexpectedBetweenNameAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenNameAndTrailingComma`, if present.
  public func withUnexpectedBetweenNameAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> PrimaryAssociatedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndTrailingComma)
    return PrimaryAssociatedTypeSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> PrimaryAssociatedTypeSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return PrimaryAssociatedTypeSyntax(newData)
  }
}

extension PrimaryAssociatedTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeName": unexpectedBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndTrailingComma": unexpectedBetweenNameAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - GenericParameterClauseSyntax

public struct GenericParameterClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftAngleBracket
    case leftAngleBracket
    case unexpectedBetweenLeftAngleBracketAndGenericParameterList
    case genericParameterList
    case unexpectedBetweenGenericParameterListAndRightAngleBracket
    case rightAngleBracket
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericParameterClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericParameterClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericParameterClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericParameterClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftAngleBracket: UnexpectedNodesSyntax? = nil,
    leftAngleBracket: TokenSyntax,
    _ unexpectedBetweenLeftAngleBracketAndGenericParameterList: UnexpectedNodesSyntax? = nil,
    genericParameterList: GenericParameterListSyntax,
    _ unexpectedBetweenGenericParameterListAndRightAngleBracket: UnexpectedNodesSyntax? = nil,
    rightAngleBracket: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftAngleBracket?.raw,
      leftAngleBracket.raw,
      unexpectedBetweenLeftAngleBracketAndGenericParameterList?.raw,
      genericParameterList.raw,
      unexpectedBetweenGenericParameterListAndRightAngleBracket?.raw,
      rightAngleBracket.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.genericParameterClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftAngleBracket: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftAngleBracket` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftAngleBracket` to replace the node's
  ///                   current `unexpectedBeforeLeftAngleBracket`, if present.
  public func withUnexpectedBeforeLeftAngleBracket(
    _ newChild: UnexpectedNodesSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftAngleBracket)
    return GenericParameterClauseSyntax(newData)
  }

  public var leftAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `leftAngleBracket` replaced.
  /// - param newChild: The new `leftAngleBracket` to replace the node's
  ///                   current `leftAngleBracket`, if present.
  public func withLeftAngleBracket(
    _ newChild: TokenSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftAngle, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftAngleBracket)
    return GenericParameterClauseSyntax(newData)
  }

  public var unexpectedBetweenLeftAngleBracketAndGenericParameterList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftAngleBracketAndGenericParameterList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftAngleBracketAndGenericParameterList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftAngleBracketAndGenericParameterList` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftAngleBracketAndGenericParameterList` to replace the node's
  ///                   current `unexpectedBetweenLeftAngleBracketAndGenericParameterList`, if present.
  public func withUnexpectedBetweenLeftAngleBracketAndGenericParameterList(
    _ newChild: UnexpectedNodesSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftAngleBracketAndGenericParameterList)
    return GenericParameterClauseSyntax(newData)
  }

  public var genericParameterList: GenericParameterListSyntax {
    get {
      let childData = data.child(at: Cursor.genericParameterList,
                                 parent: Syntax(self))
      return GenericParameterListSyntax(childData!)
    }
    set(value) {
      self = withGenericParameterList(value)
    }
  }

  /// Adds the provided `GenericParameter` to the node's `genericParameterList`
  /// collection.
  /// - param element: The new `GenericParameter` to add to the node's
  ///                  `genericParameterList` collection.
  /// - returns: A copy of the receiver with the provided `GenericParameter`
  ///            appended to its `genericParameterList` collection.
  public func addGenericParameter(_ element: GenericParameterSyntax) -> GenericParameterClauseSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.genericParameterList] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.genericParameterList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.genericParameterList)
    return GenericParameterClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `genericParameterList` replaced.
  /// - param newChild: The new `genericParameterList` to replace the node's
  ///                   current `genericParameterList`, if present.
  public func withGenericParameterList(
    _ newChild: GenericParameterListSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.genericParameterList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.genericParameterList)
    return GenericParameterClauseSyntax(newData)
  }

  public var unexpectedBetweenGenericParameterListAndRightAngleBracket: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenGenericParameterListAndRightAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenGenericParameterListAndRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenGenericParameterListAndRightAngleBracket` replaced.
  /// - param newChild: The new `unexpectedBetweenGenericParameterListAndRightAngleBracket` to replace the node's
  ///                   current `unexpectedBetweenGenericParameterListAndRightAngleBracket`, if present.
  public func withUnexpectedBetweenGenericParameterListAndRightAngleBracket(
    _ newChild: UnexpectedNodesSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenGenericParameterListAndRightAngleBracket)
    return GenericParameterClauseSyntax(newData)
  }

  public var rightAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `rightAngleBracket` replaced.
  /// - param newChild: The new `rightAngleBracket` to replace the node's
  ///                   current `rightAngleBracket`, if present.
  public func withRightAngleBracket(
    _ newChild: TokenSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightAngle, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightAngleBracket)
    return GenericParameterClauseSyntax(newData)
  }
}

extension GenericParameterClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftAngleBracket": unexpectedBeforeLeftAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftAngleBracket": Syntax(leftAngleBracket).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftAngleBracketAndGenericParameterList": unexpectedBetweenLeftAngleBracketAndGenericParameterList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameterList": Syntax(genericParameterList).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenGenericParameterListAndRightAngleBracket": unexpectedBetweenGenericParameterListAndRightAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightAngleBracket": Syntax(rightAngleBracket).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - ConformanceRequirementSyntax

public struct ConformanceRequirementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftTypeIdentifier
    case leftTypeIdentifier
    case unexpectedBetweenLeftTypeIdentifierAndColon
    case colon
    case unexpectedBetweenColonAndRightTypeIdentifier
    case rightTypeIdentifier
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ConformanceRequirementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .conformanceRequirement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `ConformanceRequirementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .conformanceRequirement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftTypeIdentifier: UnexpectedNodesSyntax? = nil,
    leftTypeIdentifier: TypeSyntax,
    _ unexpectedBetweenLeftTypeIdentifierAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndRightTypeIdentifier: UnexpectedNodesSyntax? = nil,
    rightTypeIdentifier: TypeSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftTypeIdentifier?.raw,
      leftTypeIdentifier.raw,
      unexpectedBetweenLeftTypeIdentifierAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndRightTypeIdentifier?.raw,
      rightTypeIdentifier.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.conformanceRequirement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftTypeIdentifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftTypeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftTypeIdentifier` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftTypeIdentifier` to replace the node's
  ///                   current `unexpectedBeforeLeftTypeIdentifier`, if present.
  public func withUnexpectedBeforeLeftTypeIdentifier(
    _ newChild: UnexpectedNodesSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftTypeIdentifier)
    return ConformanceRequirementSyntax(newData)
  }

  public var leftTypeIdentifier: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.leftTypeIdentifier,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withLeftTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `leftTypeIdentifier` replaced.
  /// - param newChild: The new `leftTypeIdentifier` to replace the node's
  ///                   current `leftTypeIdentifier`, if present.
  public func withLeftTypeIdentifier(
    _ newChild: TypeSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftTypeIdentifier)
    return ConformanceRequirementSyntax(newData)
  }

  public var unexpectedBetweenLeftTypeIdentifierAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftTypeIdentifierAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftTypeIdentifierAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftTypeIdentifierAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftTypeIdentifierAndColon` to replace the node's
  ///                   current `unexpectedBetweenLeftTypeIdentifierAndColon`, if present.
  public func withUnexpectedBetweenLeftTypeIdentifierAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftTypeIdentifierAndColon)
    return ConformanceRequirementSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return ConformanceRequirementSyntax(newData)
  }

  public var unexpectedBetweenColonAndRightTypeIdentifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndRightTypeIdentifier,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndRightTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndRightTypeIdentifier` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndRightTypeIdentifier` to replace the node's
  ///                   current `unexpectedBetweenColonAndRightTypeIdentifier`, if present.
  public func withUnexpectedBetweenColonAndRightTypeIdentifier(
    _ newChild: UnexpectedNodesSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndRightTypeIdentifier)
    return ConformanceRequirementSyntax(newData)
  }

  public var rightTypeIdentifier: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.rightTypeIdentifier,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withRightTypeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `rightTypeIdentifier` replaced.
  /// - param newChild: The new `rightTypeIdentifier` to replace the node's
  ///                   current `rightTypeIdentifier`, if present.
  public func withRightTypeIdentifier(
    _ newChild: TypeSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightTypeIdentifier)
    return ConformanceRequirementSyntax(newData)
  }
}

extension ConformanceRequirementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftTypeIdentifier": unexpectedBeforeLeftTypeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftTypeIdentifier": Syntax(leftTypeIdentifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftTypeIdentifierAndColon": unexpectedBetweenLeftTypeIdentifierAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndRightTypeIdentifier": unexpectedBetweenColonAndRightTypeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightTypeIdentifier": Syntax(rightTypeIdentifier).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - PrimaryAssociatedTypeClauseSyntax

public struct PrimaryAssociatedTypeClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftAngleBracket
    case leftAngleBracket
    case unexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList
    case primaryAssociatedTypeList
    case unexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket
    case rightAngleBracket
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrimaryAssociatedTypeClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .primaryAssociatedTypeClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `PrimaryAssociatedTypeClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .primaryAssociatedTypeClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftAngleBracket: UnexpectedNodesSyntax? = nil,
    leftAngleBracket: TokenSyntax,
    _ unexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList: UnexpectedNodesSyntax? = nil,
    primaryAssociatedTypeList: PrimaryAssociatedTypeListSyntax,
    _ unexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket: UnexpectedNodesSyntax? = nil,
    rightAngleBracket: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftAngleBracket?.raw,
      leftAngleBracket.raw,
      unexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList?.raw,
      primaryAssociatedTypeList.raw,
      unexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket?.raw,
      rightAngleBracket.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.primaryAssociatedTypeClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftAngleBracket: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftAngleBracket` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftAngleBracket` to replace the node's
  ///                   current `unexpectedBeforeLeftAngleBracket`, if present.
  public func withUnexpectedBeforeLeftAngleBracket(
    _ newChild: UnexpectedNodesSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftAngleBracket)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  public var leftAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `leftAngleBracket` replaced.
  /// - param newChild: The new `leftAngleBracket` to replace the node's
  ///                   current `leftAngleBracket`, if present.
  public func withLeftAngleBracket(
    _ newChild: TokenSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftAngle, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftAngleBracket)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  public var unexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList` to replace the node's
  ///                   current `unexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList`, if present.
  public func withUnexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList(
    _ newChild: UnexpectedNodesSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  public var primaryAssociatedTypeList: PrimaryAssociatedTypeListSyntax {
    get {
      let childData = data.child(at: Cursor.primaryAssociatedTypeList,
                                 parent: Syntax(self))
      return PrimaryAssociatedTypeListSyntax(childData!)
    }
    set(value) {
      self = withPrimaryAssociatedTypeList(value)
    }
  }

  /// Adds the provided `PrimaryAssociatedType` to the node's `primaryAssociatedTypeList`
  /// collection.
  /// - param element: The new `PrimaryAssociatedType` to add to the node's
  ///                  `primaryAssociatedTypeList` collection.
  /// - returns: A copy of the receiver with the provided `PrimaryAssociatedType`
  ///            appended to its `primaryAssociatedTypeList` collection.
  public func addPrimaryAssociatedType(_ element: PrimaryAssociatedTypeSyntax) -> PrimaryAssociatedTypeClauseSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.primaryAssociatedTypeList] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.primaryAssociatedTypeList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.primaryAssociatedTypeList)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `primaryAssociatedTypeList` replaced.
  /// - param newChild: The new `primaryAssociatedTypeList` to replace the node's
  ///                   current `primaryAssociatedTypeList`, if present.
  public func withPrimaryAssociatedTypeList(
    _ newChild: PrimaryAssociatedTypeListSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.primaryAssociatedTypeList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.primaryAssociatedTypeList)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  public var unexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket` replaced.
  /// - param newChild: The new `unexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket` to replace the node's
  ///                   current `unexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket`, if present.
  public func withUnexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket(
    _ newChild: UnexpectedNodesSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }

  public var rightAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `rightAngleBracket` replaced.
  /// - param newChild: The new `rightAngleBracket` to replace the node's
  ///                   current `rightAngleBracket`, if present.
  public func withRightAngleBracket(
    _ newChild: TokenSyntax?) -> PrimaryAssociatedTypeClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightAngle, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightAngleBracket)
    return PrimaryAssociatedTypeClauseSyntax(newData)
  }
}

extension PrimaryAssociatedTypeClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftAngleBracket": unexpectedBeforeLeftAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftAngleBracket": Syntax(leftAngleBracket).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList": unexpectedBetweenLeftAngleBracketAndPrimaryAssociatedTypeList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "primaryAssociatedTypeList": Syntax(primaryAssociatedTypeList).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket": unexpectedBetweenPrimaryAssociatedTypeListAndRightAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightAngleBracket": Syntax(rightAngleBracket).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - CompositionTypeElementSyntax

public struct CompositionTypeElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeType
    case type
    case unexpectedBetweenTypeAndAmpersand
    case ampersand
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CompositionTypeElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .compositionTypeElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `CompositionTypeElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .compositionTypeElement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeType: UnexpectedNodesSyntax? = nil,
    type: TypeSyntax,
    _ unexpectedBetweenTypeAndAmpersand: UnexpectedNodesSyntax? = nil,
    ampersand: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeType?.raw,
      type.raw,
      unexpectedBetweenTypeAndAmpersand?.raw,
      ampersand?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.compositionTypeElement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeType: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeType(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeType` replaced.
  /// - param newChild: The new `unexpectedBeforeType` to replace the node's
  ///                   current `unexpectedBeforeType`, if present.
  public func withUnexpectedBeforeType(
    _ newChild: UnexpectedNodesSyntax?) -> CompositionTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeType)
    return CompositionTypeElementSyntax(newData)
  }

  public var type: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.type,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withType(value)
    }
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> CompositionTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.type)
    return CompositionTypeElementSyntax(newData)
  }

  public var unexpectedBetweenTypeAndAmpersand: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenTypeAndAmpersand,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTypeAndAmpersand(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTypeAndAmpersand` replaced.
  /// - param newChild: The new `unexpectedBetweenTypeAndAmpersand` to replace the node's
  ///                   current `unexpectedBetweenTypeAndAmpersand`, if present.
  public func withUnexpectedBetweenTypeAndAmpersand(
    _ newChild: UnexpectedNodesSyntax?) -> CompositionTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenTypeAndAmpersand)
    return CompositionTypeElementSyntax(newData)
  }

  public var ampersand: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.ampersand,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAmpersand(value)
    }
  }

  /// Returns a copy of the receiver with its `ampersand` replaced.
  /// - param newChild: The new `ampersand` to replace the node's
  ///                   current `ampersand`, if present.
  public func withAmpersand(
    _ newChild: TokenSyntax?) -> CompositionTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.ampersand)
    return CompositionTypeElementSyntax(newData)
  }
}

extension CompositionTypeElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeType": unexpectedBeforeType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": Syntax(type).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenTypeAndAmpersand": unexpectedBetweenTypeAndAmpersand.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "ampersand": ampersand.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TupleTypeElementSyntax

public struct TupleTypeElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeInOut
    case inOut
    case unexpectedBetweenInOutAndName
    case name
    case unexpectedBetweenNameAndSecondName
    case secondName
    case unexpectedBetweenSecondNameAndColon
    case colon
    case unexpectedBetweenColonAndType
    case type
    case unexpectedBetweenTypeAndEllipsis
    case ellipsis
    case unexpectedBetweenEllipsisAndInitializer
    case initializer
    case unexpectedBetweenInitializerAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TupleTypeElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .tupleTypeElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TupleTypeElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tupleTypeElement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeInOut: UnexpectedNodesSyntax? = nil,
    inOut: TokenSyntax?,
    _ unexpectedBetweenInOutAndName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax?,
    _ unexpectedBetweenNameAndSecondName: UnexpectedNodesSyntax? = nil,
    secondName: TokenSyntax?,
    _ unexpectedBetweenSecondNameAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax?,
    _ unexpectedBetweenColonAndType: UnexpectedNodesSyntax? = nil,
    type: TypeSyntax,
    _ unexpectedBetweenTypeAndEllipsis: UnexpectedNodesSyntax? = nil,
    ellipsis: TokenSyntax?,
    _ unexpectedBetweenEllipsisAndInitializer: UnexpectedNodesSyntax? = nil,
    initializer: InitializerClauseSyntax?,
    _ unexpectedBetweenInitializerAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeInOut?.raw,
      inOut?.raw,
      unexpectedBetweenInOutAndName?.raw,
      name?.raw,
      unexpectedBetweenNameAndSecondName?.raw,
      secondName?.raw,
      unexpectedBetweenSecondNameAndColon?.raw,
      colon?.raw,
      unexpectedBetweenColonAndType?.raw,
      type.raw,
      unexpectedBetweenTypeAndEllipsis?.raw,
      ellipsis?.raw,
      unexpectedBetweenEllipsisAndInitializer?.raw,
      initializer?.raw,
      unexpectedBetweenInitializerAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.tupleTypeElement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeInOut: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeInOut,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeInOut(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeInOut` replaced.
  /// - param newChild: The new `unexpectedBeforeInOut` to replace the node's
  ///                   current `unexpectedBeforeInOut`, if present.
  public func withUnexpectedBeforeInOut(
    _ newChild: UnexpectedNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeInOut)
    return TupleTypeElementSyntax(newData)
  }

  public var inOut: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.inOut,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withInOut(value)
    }
  }

  /// Returns a copy of the receiver with its `inOut` replaced.
  /// - param newChild: The new `inOut` to replace the node's
  ///                   current `inOut`, if present.
  public func withInOut(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.inOut)
    return TupleTypeElementSyntax(newData)
  }

  public var unexpectedBetweenInOutAndName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenInOutAndName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenInOutAndName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenInOutAndName` replaced.
  /// - param newChild: The new `unexpectedBetweenInOutAndName` to replace the node's
  ///                   current `unexpectedBetweenInOutAndName`, if present.
  public func withUnexpectedBetweenInOutAndName(
    _ newChild: UnexpectedNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenInOutAndName)
    return TupleTypeElementSyntax(newData)
  }

  public var name: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.name,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.name)
    return TupleTypeElementSyntax(newData)
  }

  public var unexpectedBetweenNameAndSecondName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenNameAndSecondName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndSecondName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndSecondName` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndSecondName` to replace the node's
  ///                   current `unexpectedBetweenNameAndSecondName`, if present.
  public func withUnexpectedBetweenNameAndSecondName(
    _ newChild: UnexpectedNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenNameAndSecondName)
    return TupleTypeElementSyntax(newData)
  }

  public var secondName: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.secondName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSecondName(value)
    }
  }

  /// Returns a copy of the receiver with its `secondName` replaced.
  /// - param newChild: The new `secondName` to replace the node's
  ///                   current `secondName`, if present.
  public func withSecondName(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.secondName)
    return TupleTypeElementSyntax(newData)
  }

  public var unexpectedBetweenSecondNameAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenSecondNameAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenSecondNameAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenSecondNameAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenSecondNameAndColon` to replace the node's
  ///                   current `unexpectedBetweenSecondNameAndColon`, if present.
  public func withUnexpectedBetweenSecondNameAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenSecondNameAndColon)
    return TupleTypeElementSyntax(newData)
  }

  public var colon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return TupleTypeElementSyntax(newData)
  }

  public var unexpectedBetweenColonAndType: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndType(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndType` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndType` to replace the node's
  ///                   current `unexpectedBetweenColonAndType`, if present.
  public func withUnexpectedBetweenColonAndType(
    _ newChild: UnexpectedNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndType)
    return TupleTypeElementSyntax(newData)
  }

  public var type: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.type,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withType(value)
    }
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.type)
    return TupleTypeElementSyntax(newData)
  }

  public var unexpectedBetweenTypeAndEllipsis: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenTypeAndEllipsis,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTypeAndEllipsis(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTypeAndEllipsis` replaced.
  /// - param newChild: The new `unexpectedBetweenTypeAndEllipsis` to replace the node's
  ///                   current `unexpectedBetweenTypeAndEllipsis`, if present.
  public func withUnexpectedBetweenTypeAndEllipsis(
    _ newChild: UnexpectedNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenTypeAndEllipsis)
    return TupleTypeElementSyntax(newData)
  }

  public var ellipsis: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.ellipsis,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEllipsis(value)
    }
  }

  /// Returns a copy of the receiver with its `ellipsis` replaced.
  /// - param newChild: The new `ellipsis` to replace the node's
  ///                   current `ellipsis`, if present.
  public func withEllipsis(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.ellipsis)
    return TupleTypeElementSyntax(newData)
  }

  public var unexpectedBetweenEllipsisAndInitializer: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenEllipsisAndInitializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenEllipsisAndInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenEllipsisAndInitializer` replaced.
  /// - param newChild: The new `unexpectedBetweenEllipsisAndInitializer` to replace the node's
  ///                   current `unexpectedBetweenEllipsisAndInitializer`, if present.
  public func withUnexpectedBetweenEllipsisAndInitializer(
    _ newChild: UnexpectedNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenEllipsisAndInitializer)
    return TupleTypeElementSyntax(newData)
  }

  public var initializer: InitializerClauseSyntax? {
    get {
      let childData = data.child(at: Cursor.initializer,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return InitializerClauseSyntax(childData!)
    }
    set(value) {
      self = withInitializer(value)
    }
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.initializer)
    return TupleTypeElementSyntax(newData)
  }

  public var unexpectedBetweenInitializerAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenInitializerAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenInitializerAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenInitializerAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenInitializerAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenInitializerAndTrailingComma`, if present.
  public func withUnexpectedBetweenInitializerAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenInitializerAndTrailingComma)
    return TupleTypeElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return TupleTypeElementSyntax(newData)
  }
}

extension TupleTypeElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeInOut": unexpectedBeforeInOut.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inOut": inOut.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInOutAndName": unexpectedBetweenInOutAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": name.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenNameAndSecondName": unexpectedBetweenNameAndSecondName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "secondName": secondName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenSecondNameAndColon": unexpectedBetweenSecondNameAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": colon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenColonAndType": unexpectedBetweenColonAndType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": Syntax(type).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenTypeAndEllipsis": unexpectedBetweenTypeAndEllipsis.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "ellipsis": ellipsis.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenEllipsisAndInitializer": unexpectedBetweenEllipsisAndInitializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "initializer": initializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInitializerAndTrailingComma": unexpectedBetweenInitializerAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - GenericArgumentSyntax

public struct GenericArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeArgumentType
    case argumentType
    case unexpectedBetweenArgumentTypeAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericArgument)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeArgumentType: UnexpectedNodesSyntax? = nil,
    argumentType: TypeSyntax,
    _ unexpectedBetweenArgumentTypeAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeArgumentType?.raw,
      argumentType.raw,
      unexpectedBetweenArgumentTypeAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.genericArgument,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeArgumentType: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeArgumentType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeArgumentType(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeArgumentType` replaced.
  /// - param newChild: The new `unexpectedBeforeArgumentType` to replace the node's
  ///                   current `unexpectedBeforeArgumentType`, if present.
  public func withUnexpectedBeforeArgumentType(
    _ newChild: UnexpectedNodesSyntax?) -> GenericArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeArgumentType)
    return GenericArgumentSyntax(newData)
  }

  public var argumentType: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.argumentType,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withArgumentType(value)
    }
  }

  /// Returns a copy of the receiver with its `argumentType` replaced.
  /// - param newChild: The new `argumentType` to replace the node's
  ///                   current `argumentType`, if present.
  public func withArgumentType(
    _ newChild: TypeSyntax?) -> GenericArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.argumentType)
    return GenericArgumentSyntax(newData)
  }

  public var unexpectedBetweenArgumentTypeAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenArgumentTypeAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenArgumentTypeAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenArgumentTypeAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenArgumentTypeAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenArgumentTypeAndTrailingComma`, if present.
  public func withUnexpectedBetweenArgumentTypeAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> GenericArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenArgumentTypeAndTrailingComma)
    return GenericArgumentSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> GenericArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return GenericArgumentSyntax(newData)
  }
}

extension GenericArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeArgumentType": unexpectedBeforeArgumentType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "argumentType": Syntax(argumentType).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenArgumentTypeAndTrailingComma": unexpectedBetweenArgumentTypeAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - GenericArgumentClauseSyntax

public struct GenericArgumentClauseSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLeftAngleBracket
    case leftAngleBracket
    case unexpectedBetweenLeftAngleBracketAndArguments
    case arguments
    case unexpectedBetweenArgumentsAndRightAngleBracket
    case rightAngleBracket
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericArgumentClauseSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericArgumentClause else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `GenericArgumentClauseSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericArgumentClause)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLeftAngleBracket: UnexpectedNodesSyntax? = nil,
    leftAngleBracket: TokenSyntax,
    _ unexpectedBetweenLeftAngleBracketAndArguments: UnexpectedNodesSyntax? = nil,
    arguments: GenericArgumentListSyntax,
    _ unexpectedBetweenArgumentsAndRightAngleBracket: UnexpectedNodesSyntax? = nil,
    rightAngleBracket: TokenSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftAngleBracket?.raw,
      leftAngleBracket.raw,
      unexpectedBetweenLeftAngleBracketAndArguments?.raw,
      arguments.raw,
      unexpectedBetweenArgumentsAndRightAngleBracket?.raw,
      rightAngleBracket.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.genericArgumentClause,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLeftAngleBracket: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLeftAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftAngleBracket` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftAngleBracket` to replace the node's
  ///                   current `unexpectedBeforeLeftAngleBracket`, if present.
  public func withUnexpectedBeforeLeftAngleBracket(
    _ newChild: UnexpectedNodesSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLeftAngleBracket)
    return GenericArgumentClauseSyntax(newData)
  }

  public var leftAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.leftAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `leftAngleBracket` replaced.
  /// - param newChild: The new `leftAngleBracket` to replace the node's
  ///                   current `leftAngleBracket`, if present.
  public func withLeftAngleBracket(
    _ newChild: TokenSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftAngle, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.leftAngleBracket)
    return GenericArgumentClauseSyntax(newData)
  }

  public var unexpectedBetweenLeftAngleBracketAndArguments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLeftAngleBracketAndArguments,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftAngleBracketAndArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftAngleBracketAndArguments` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftAngleBracketAndArguments` to replace the node's
  ///                   current `unexpectedBetweenLeftAngleBracketAndArguments`, if present.
  public func withUnexpectedBetweenLeftAngleBracketAndArguments(
    _ newChild: UnexpectedNodesSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLeftAngleBracketAndArguments)
    return GenericArgumentClauseSyntax(newData)
  }

  public var arguments: GenericArgumentListSyntax {
    get {
      let childData = data.child(at: Cursor.arguments,
                                 parent: Syntax(self))
      return GenericArgumentListSyntax(childData!)
    }
    set(value) {
      self = withArguments(value)
    }
  }

  /// Adds the provided `Argument` to the node's `arguments`
  /// collection.
  /// - param element: The new `Argument` to add to the node's
  ///                  `arguments` collection.
  /// - returns: A copy of the receiver with the provided `Argument`
  ///            appended to its `arguments` collection.
  public func addArgument(_ element: GenericArgumentSyntax) -> GenericArgumentClauseSyntax {
    var collection: RawSyntax
    if let col = raw.layoutView![Cursor.arguments] {
      collection = col.layoutView!.appending(element.raw, arena: .default)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.genericArgumentList,
        from: [element.raw], arena: .default)
    }
    let newData = data.replacingChild(collection,
                                      at: Cursor.arguments)
    return GenericArgumentClauseSyntax(newData)
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: GenericArgumentListSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.genericArgumentList, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.arguments)
    return GenericArgumentClauseSyntax(newData)
  }

  public var unexpectedBetweenArgumentsAndRightAngleBracket: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenArgumentsAndRightAngleBracket,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenArgumentsAndRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenArgumentsAndRightAngleBracket` replaced.
  /// - param newChild: The new `unexpectedBetweenArgumentsAndRightAngleBracket` to replace the node's
  ///                   current `unexpectedBetweenArgumentsAndRightAngleBracket`, if present.
  public func withUnexpectedBetweenArgumentsAndRightAngleBracket(
    _ newChild: UnexpectedNodesSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenArgumentsAndRightAngleBracket)
    return GenericArgumentClauseSyntax(newData)
  }

  public var rightAngleBracket: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.rightAngleBracket,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightAngleBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `rightAngleBracket` replaced.
  /// - param newChild: The new `rightAngleBracket` to replace the node's
  ///                   current `rightAngleBracket`, if present.
  public func withRightAngleBracket(
    _ newChild: TokenSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightAngle, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.rightAngleBracket)
    return GenericArgumentClauseSyntax(newData)
  }
}

extension GenericArgumentClauseSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftAngleBracket": unexpectedBeforeLeftAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftAngleBracket": Syntax(leftAngleBracket).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftAngleBracketAndArguments": unexpectedBetweenLeftAngleBracketAndArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arguments": Syntax(arguments).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenArgumentsAndRightAngleBracket": unexpectedBetweenArgumentsAndRightAngleBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightAngleBracket": Syntax(rightAngleBracket).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - TypeAnnotationSyntax

public struct TypeAnnotationSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeColon
    case colon
    case unexpectedBetweenColonAndType
    case type
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TypeAnnotationSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .typeAnnotation else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TypeAnnotationSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .typeAnnotation)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndType: UnexpectedNodesSyntax? = nil,
    type: TypeSyntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndType?.raw,
      type.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.typeAnnotation,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeColon` replaced.
  /// - param newChild: The new `unexpectedBeforeColon` to replace the node's
  ///                   current `unexpectedBeforeColon`, if present.
  public func withUnexpectedBeforeColon(
    _ newChild: UnexpectedNodesSyntax?) -> TypeAnnotationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeColon)
    return TypeAnnotationSyntax(newData)
  }

  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TypeAnnotationSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return TypeAnnotationSyntax(newData)
  }

  public var unexpectedBetweenColonAndType: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndType,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndType(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndType` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndType` to replace the node's
  ///                   current `unexpectedBetweenColonAndType`, if present.
  public func withUnexpectedBetweenColonAndType(
    _ newChild: UnexpectedNodesSyntax?) -> TypeAnnotationSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndType)
    return TypeAnnotationSyntax(newData)
  }

  public var type: TypeSyntax {
    get {
      let childData = data.child(at: Cursor.type,
                                 parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withType(value)
    }
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> TypeAnnotationSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.type)
    return TypeAnnotationSyntax(newData)
  }
}

extension TypeAnnotationSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeColon": unexpectedBeforeColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndType": unexpectedBetweenColonAndType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": Syntax(type).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - TuplePatternElementSyntax

public struct TuplePatternElementSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLabelName
    case labelName
    case unexpectedBetweenLabelNameAndLabelColon
    case labelColon
    case unexpectedBetweenLabelColonAndPattern
    case pattern
    case unexpectedBetweenPatternAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TuplePatternElementSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .tuplePatternElement else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `TuplePatternElementSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tuplePatternElement)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLabelName: UnexpectedNodesSyntax? = nil,
    labelName: TokenSyntax?,
    _ unexpectedBetweenLabelNameAndLabelColon: UnexpectedNodesSyntax? = nil,
    labelColon: TokenSyntax?,
    _ unexpectedBetweenLabelColonAndPattern: UnexpectedNodesSyntax? = nil,
    pattern: PatternSyntax,
    _ unexpectedBetweenPatternAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLabelName?.raw,
      labelName?.raw,
      unexpectedBetweenLabelNameAndLabelColon?.raw,
      labelColon?.raw,
      unexpectedBetweenLabelColonAndPattern?.raw,
      pattern.raw,
      unexpectedBetweenPatternAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.tuplePatternElement,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLabelName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLabelName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLabelName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLabelName` replaced.
  /// - param newChild: The new `unexpectedBeforeLabelName` to replace the node's
  ///                   current `unexpectedBeforeLabelName`, if present.
  public func withUnexpectedBeforeLabelName(
    _ newChild: UnexpectedNodesSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLabelName)
    return TuplePatternElementSyntax(newData)
  }

  public var labelName: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.labelName,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabelName(value)
    }
  }

  /// Returns a copy of the receiver with its `labelName` replaced.
  /// - param newChild: The new `labelName` to replace the node's
  ///                   current `labelName`, if present.
  public func withLabelName(
    _ newChild: TokenSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.labelName)
    return TuplePatternElementSyntax(newData)
  }

  public var unexpectedBetweenLabelNameAndLabelColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLabelNameAndLabelColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLabelNameAndLabelColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLabelNameAndLabelColon` replaced.
  /// - param newChild: The new `unexpectedBetweenLabelNameAndLabelColon` to replace the node's
  ///                   current `unexpectedBetweenLabelNameAndLabelColon`, if present.
  public func withUnexpectedBetweenLabelNameAndLabelColon(
    _ newChild: UnexpectedNodesSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLabelNameAndLabelColon)
    return TuplePatternElementSyntax(newData)
  }

  public var labelColon: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.labelColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabelColon(value)
    }
  }

  /// Returns a copy of the receiver with its `labelColon` replaced.
  /// - param newChild: The new `labelColon` to replace the node's
  ///                   current `labelColon`, if present.
  public func withLabelColon(
    _ newChild: TokenSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.labelColon)
    return TuplePatternElementSyntax(newData)
  }

  public var unexpectedBetweenLabelColonAndPattern: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLabelColonAndPattern,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLabelColonAndPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLabelColonAndPattern` replaced.
  /// - param newChild: The new `unexpectedBetweenLabelColonAndPattern` to replace the node's
  ///                   current `unexpectedBetweenLabelColonAndPattern`, if present.
  public func withUnexpectedBetweenLabelColonAndPattern(
    _ newChild: UnexpectedNodesSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLabelColonAndPattern)
    return TuplePatternElementSyntax(newData)
  }

  public var pattern: PatternSyntax {
    get {
      let childData = data.child(at: Cursor.pattern,
                                 parent: Syntax(self))
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingPattern, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.pattern)
    return TuplePatternElementSyntax(newData)
  }

  public var unexpectedBetweenPatternAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPatternAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPatternAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPatternAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenPatternAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenPatternAndTrailingComma`, if present.
  public func withUnexpectedBetweenPatternAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPatternAndTrailingComma)
    return TuplePatternElementSyntax(newData)
  }

  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return TuplePatternElementSyntax(newData)
  }
}

extension TuplePatternElementSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLabelName": unexpectedBeforeLabelName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "labelName": labelName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenLabelNameAndLabelColon": unexpectedBetweenLabelNameAndLabelColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "labelColon": labelColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenLabelColonAndPattern": unexpectedBetweenLabelColonAndPattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": Syntax(pattern).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPatternAndTrailingComma": unexpectedBetweenPatternAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AvailabilityArgumentSyntax

/// 
/// A single argument to an `@available` argument like `*`, `iOS 10.1`,
/// or `message: "This has been deprecated"`.
/// 
public struct AvailabilityArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeEntry
    case entry
    case unexpectedBetweenEntryAndTrailingComma
    case trailingComma
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AvailabilityArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .availabilityArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AvailabilityArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .availabilityArgument)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeEntry: UnexpectedNodesSyntax? = nil,
    entry: Syntax,
    _ unexpectedBetweenEntryAndTrailingComma: UnexpectedNodesSyntax? = nil,
    trailingComma: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeEntry?.raw,
      entry.raw,
      unexpectedBetweenEntryAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.availabilityArgument,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeEntry: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeEntry,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeEntry(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeEntry` replaced.
  /// - param newChild: The new `unexpectedBeforeEntry` to replace the node's
  ///                   current `unexpectedBeforeEntry`, if present.
  public func withUnexpectedBeforeEntry(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeEntry)
    return AvailabilityArgumentSyntax(newData)
  }

  /// The actual argument
  public var entry: Syntax {
    get {
      let childData = data.child(at: Cursor.entry,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withEntry(value)
    }
  }

  /// Returns a copy of the receiver with its `entry` replaced.
  /// - param newChild: The new `entry` to replace the node's
  ///                   current `entry`, if present.
  public func withEntry(
    _ newChild: Syntax?) -> AvailabilityArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.entry)
    return AvailabilityArgumentSyntax(newData)
  }

  public var unexpectedBetweenEntryAndTrailingComma: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenEntryAndTrailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenEntryAndTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenEntryAndTrailingComma` replaced.
  /// - param newChild: The new `unexpectedBetweenEntryAndTrailingComma` to replace the node's
  ///                   current `unexpectedBetweenEntryAndTrailingComma`, if present.
  public func withUnexpectedBetweenEntryAndTrailingComma(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenEntryAndTrailingComma)
    return AvailabilityArgumentSyntax(newData)
  }

  /// 
  /// A trailing comma if the argument is followed by another
  /// argument
  /// 
  public var trailingComma: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.trailingComma,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTrailingComma(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> AvailabilityArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.trailingComma)
    return AvailabilityArgumentSyntax(newData)
  }
}

extension AvailabilityArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeEntry": unexpectedBeforeEntry.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "entry": Syntax(entry).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenEntryAndTrailingComma": unexpectedBetweenEntryAndTrailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingComma": trailingComma.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AvailabilityLabeledArgumentSyntax

/// 
/// A argument to an `@available` attribute that consists of a label and
/// a value, e.g. `message: "This has been deprecated"`.
/// 
public struct AvailabilityLabeledArgumentSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeLabel
    case label
    case unexpectedBetweenLabelAndColon
    case colon
    case unexpectedBetweenColonAndValue
    case value
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AvailabilityLabeledArgumentSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .availabilityLabeledArgument else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AvailabilityLabeledArgumentSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .availabilityLabeledArgument)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeLabel: UnexpectedNodesSyntax? = nil,
    label: TokenSyntax,
    _ unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax,
    _ unexpectedBetweenColonAndValue: UnexpectedNodesSyntax? = nil,
    value: Syntax
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLabel?.raw,
      label.raw,
      unexpectedBetweenLabelAndColon?.raw,
      colon.raw,
      unexpectedBetweenColonAndValue?.raw,
      value.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.availabilityLabeledArgument,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeLabel: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeLabel,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLabel` replaced.
  /// - param newChild: The new `unexpectedBeforeLabel` to replace the node's
  ///                   current `unexpectedBeforeLabel`, if present.
  public func withUnexpectedBeforeLabel(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeLabel)
    return AvailabilityLabeledArgumentSyntax(newData)
  }

  /// The label of the argument
  public var label: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.label,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLabel(value)
    }
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.label)
    return AvailabilityLabeledArgumentSyntax(newData)
  }

  public var unexpectedBetweenLabelAndColon: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenLabelAndColon,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLabelAndColon(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLabelAndColon` replaced.
  /// - param newChild: The new `unexpectedBetweenLabelAndColon` to replace the node's
  ///                   current `unexpectedBetweenLabelAndColon`, if present.
  public func withUnexpectedBetweenLabelAndColon(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenLabelAndColon)
    return AvailabilityLabeledArgumentSyntax(newData)
  }

  /// The colon separating label and value
  public var colon: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.colon,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColon(value)
    }
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.colon)
    return AvailabilityLabeledArgumentSyntax(newData)
  }

  public var unexpectedBetweenColonAndValue: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenColonAndValue,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonAndValue(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonAndValue` replaced.
  /// - param newChild: The new `unexpectedBetweenColonAndValue` to replace the node's
  ///                   current `unexpectedBetweenColonAndValue`, if present.
  public func withUnexpectedBetweenColonAndValue(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenColonAndValue)
    return AvailabilityLabeledArgumentSyntax(newData)
  }

  /// The value of this labeled argument
  public var value: Syntax {
    get {
      let childData = data.child(at: Cursor.value,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withValue(value)
    }
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: Syntax?) -> AvailabilityLabeledArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.value)
    return AvailabilityLabeledArgumentSyntax(newData)
  }
}

extension AvailabilityLabeledArgumentSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLabel": unexpectedBeforeLabel.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "label": Syntax(label).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLabelAndColon": unexpectedBetweenLabelAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndValue": unexpectedBetweenColonAndValue.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "value": Syntax(value).asProtocol(SyntaxProtocol.self),
    ])
  }
}

// MARK: - AvailabilityVersionRestrictionSyntax

/// 
/// An argument to `@available` that restricts the availability on a
/// certain platform to a version, e.g. `iOS 10` or `swift 3.4`.
/// 
public struct AvailabilityVersionRestrictionSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforePlatform
    case platform
    case unexpectedBetweenPlatformAndVersion
    case version
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AvailabilityVersionRestrictionSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .availabilityVersionRestriction else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `AvailabilityVersionRestrictionSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .availabilityVersionRestriction)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforePlatform: UnexpectedNodesSyntax? = nil,
    platform: TokenSyntax,
    _ unexpectedBetweenPlatformAndVersion: UnexpectedNodesSyntax? = nil,
    version: VersionTupleSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforePlatform?.raw,
      platform.raw,
      unexpectedBetweenPlatformAndVersion?.raw,
      version?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.availabilityVersionRestriction,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforePlatform: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforePlatform,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforePlatform(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforePlatform` replaced.
  /// - param newChild: The new `unexpectedBeforePlatform` to replace the node's
  ///                   current `unexpectedBeforePlatform`, if present.
  public func withUnexpectedBeforePlatform(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityVersionRestrictionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforePlatform)
    return AvailabilityVersionRestrictionSyntax(newData)
  }

  /// 
  /// The name of the OS on which the availability should be
  /// restricted or 'swift' if the availability should be
  /// restricted based on a Swift version.
  /// 
  public var platform: TokenSyntax {
    get {
      let childData = data.child(at: Cursor.platform,
                                 parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPlatform(value)
    }
  }

  /// Returns a copy of the receiver with its `platform` replaced.
  /// - param newChild: The new `platform` to replace the node's
  ///                   current `platform`, if present.
  public func withPlatform(
    _ newChild: TokenSyntax?) -> AvailabilityVersionRestrictionSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.platform)
    return AvailabilityVersionRestrictionSyntax(newData)
  }

  public var unexpectedBetweenPlatformAndVersion: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPlatformAndVersion,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPlatformAndVersion(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPlatformAndVersion` replaced.
  /// - param newChild: The new `unexpectedBetweenPlatformAndVersion` to replace the node's
  ///                   current `unexpectedBetweenPlatformAndVersion`, if present.
  public func withUnexpectedBetweenPlatformAndVersion(
    _ newChild: UnexpectedNodesSyntax?) -> AvailabilityVersionRestrictionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPlatformAndVersion)
    return AvailabilityVersionRestrictionSyntax(newData)
  }

  public var version: VersionTupleSyntax? {
    get {
      let childData = data.child(at: Cursor.version,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return VersionTupleSyntax(childData!)
    }
    set(value) {
      self = withVersion(value)
    }
  }

  /// Returns a copy of the receiver with its `version` replaced.
  /// - param newChild: The new `version` to replace the node's
  ///                   current `version`, if present.
  public func withVersion(
    _ newChild: VersionTupleSyntax?) -> AvailabilityVersionRestrictionSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.version)
    return AvailabilityVersionRestrictionSyntax(newData)
  }
}

extension AvailabilityVersionRestrictionSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePlatform": unexpectedBeforePlatform.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "platform": Syntax(platform).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPlatformAndVersion": unexpectedBetweenPlatformAndVersion.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "version": version.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - VersionTupleSyntax

/// 
/// A version number of the form major.minor.patch in which the minor
/// and patch part may be omitted.
/// 
public struct VersionTupleSyntax: SyntaxProtocol, SyntaxHashable {
  enum Cursor: Int {
    case unexpectedBeforeMajorMinor
    case majorMinor
    case unexpectedBetweenMajorMinorAndPatchPeriod
    case patchPeriod
    case unexpectedBetweenPatchPeriodAndPatchVersion
    case patchVersion
  }

  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `VersionTupleSyntax` if possible. Returns
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .versionTuple else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a `VersionTupleSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .versionTuple)
    self._syntaxNode = Syntax(data)
  }

  public init(
    _ unexpectedBeforeMajorMinor: UnexpectedNodesSyntax? = nil,
    majorMinor: Syntax,
    _ unexpectedBetweenMajorMinorAndPatchPeriod: UnexpectedNodesSyntax? = nil,
    patchPeriod: TokenSyntax?,
    _ unexpectedBetweenPatchPeriodAndPatchVersion: UnexpectedNodesSyntax? = nil,
    patchVersion: TokenSyntax?
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeMajorMinor?.raw,
      majorMinor.raw,
      unexpectedBetweenMajorMinorAndPatchPeriod?.raw,
      patchPeriod?.raw,
      unexpectedBetweenPatchPeriodAndPatchVersion?.raw,
      patchVersion?.raw,
    ]
    let raw = RawSyntax.makeLayout(kind: SyntaxKind.versionTuple,
      from: layout, arena: .default)
    let data = SyntaxData.forRoot(raw)
    self.init(data)
  }

  public var syntaxNodeType: SyntaxProtocol.Type {
    return Swift.type(of: self)
  }

  public var unexpectedBeforeMajorMinor: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBeforeMajorMinor,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeMajorMinor(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeMajorMinor` replaced.
  /// - param newChild: The new `unexpectedBeforeMajorMinor` to replace the node's
  ///                   current `unexpectedBeforeMajorMinor`, if present.
  public func withUnexpectedBeforeMajorMinor(
    _ newChild: UnexpectedNodesSyntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBeforeMajorMinor)
    return VersionTupleSyntax(newData)
  }

  /// 
  /// In case the version consists only of the major version, an
  /// integer literal that specifies the major version. In case
  /// the version consists of major and minor version number, a
  /// floating literal in which the decimal part is interpreted
  /// as the minor version.
  /// 
  public var majorMinor: Syntax {
    get {
      let childData = data.child(at: Cursor.majorMinor,
                                 parent: Syntax(self))
      return Syntax(childData!)
    }
    set(value) {
      self = withMajorMinor(value)
    }
  }

  /// Returns a copy of the receiver with its `majorMinor` replaced.
  /// - param newChild: The new `majorMinor` to replace the node's
  ///                   current `majorMinor`, if present.
  public func withMajorMinor(
    _ newChild: Syntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.unknown, arena: .default)
    let newData = data.replacingChild(raw, at: Cursor.majorMinor)
    return VersionTupleSyntax(newData)
  }

  public var unexpectedBetweenMajorMinorAndPatchPeriod: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenMajorMinorAndPatchPeriod,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenMajorMinorAndPatchPeriod(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenMajorMinorAndPatchPeriod` replaced.
  /// - param newChild: The new `unexpectedBetweenMajorMinorAndPatchPeriod` to replace the node's
  ///                   current `unexpectedBetweenMajorMinorAndPatchPeriod`, if present.
  public func withUnexpectedBetweenMajorMinorAndPatchPeriod(
    _ newChild: UnexpectedNodesSyntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenMajorMinorAndPatchPeriod)
    return VersionTupleSyntax(newData)
  }

  /// 
  /// If the version contains a patch number, the period
  /// separating the minor from the patch number.
  /// 
  public var patchPeriod: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.patchPeriod,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPatchPeriod(value)
    }
  }

  /// Returns a copy of the receiver with its `patchPeriod` replaced.
  /// - param newChild: The new `patchPeriod` to replace the node's
  ///                   current `patchPeriod`, if present.
  public func withPatchPeriod(
    _ newChild: TokenSyntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.patchPeriod)
    return VersionTupleSyntax(newData)
  }

  public var unexpectedBetweenPatchPeriodAndPatchVersion: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: Cursor.unexpectedBetweenPatchPeriodAndPatchVersion,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPatchPeriodAndPatchVersion(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPatchPeriodAndPatchVersion` replaced.
  /// - param newChild: The new `unexpectedBetweenPatchPeriodAndPatchVersion` to replace the node's
  ///                   current `unexpectedBetweenPatchPeriodAndPatchVersion`, if present.
  public func withUnexpectedBetweenPatchPeriodAndPatchVersion(
    _ newChild: UnexpectedNodesSyntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.unexpectedBetweenPatchPeriodAndPatchVersion)
    return VersionTupleSyntax(newData)
  }

  /// 
  /// The patch version if specified.
  /// 
  public var patchVersion: TokenSyntax? {
    get {
      let childData = data.child(at: Cursor.patchVersion,
                                 parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPatchVersion(value)
    }
  }

  /// Returns a copy of the receiver with its `patchVersion` replaced.
  /// - param newChild: The new `patchVersion` to replace the node's
  ///                   current `patchVersion`, if present.
  public func withPatchVersion(
    _ newChild: TokenSyntax?) -> VersionTupleSyntax {
    let raw = newChild?.raw
    let newData = data.replacingChild(raw, at: Cursor.patchVersion)
    return VersionTupleSyntax(newData)
  }
}

extension VersionTupleSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeMajorMinor": unexpectedBeforeMajorMinor.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "majorMinor": Syntax(majorMinor).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenMajorMinorAndPatchPeriod": unexpectedBetweenMajorMinorAndPatchPeriod.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "patchPeriod": patchPeriod.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenPatchPeriodAndPatchVersion": unexpectedBetweenPatchPeriodAndPatchVersion.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "patchVersion": patchVersion.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

