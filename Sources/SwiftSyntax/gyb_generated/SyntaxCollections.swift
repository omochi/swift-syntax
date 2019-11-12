//// Automatically Generated From SyntaxCollections.swift.gyb.
//// Do Not Edit Directly!
//===------------ SyntaxCollections.swift.gyb - Syntax Collection ---------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

public protocol SyntaxCollection: SyntaxProtocol, Sequence {
  /// The number of elements, `present` or `missing`, in this collection.
  var count: Int { get }
}


/// `CodeBlockItemListSyntax` represents a collection of one or more
/// `CodeBlockItemSyntax` nodes. CodeBlockItemListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct CodeBlockItemListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CodeBlockItemListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .codeBlockItemList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .codeBlockItemList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `CodeBlockItemListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `CodeBlockItemListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> CodeBlockItemListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return CodeBlockItemListSyntax(newData)
  }

  /// Creates a new `CodeBlockItemListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `CodeBlockItemListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: CodeBlockItemSyntax) -> CodeBlockItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CodeBlockItemListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `CodeBlockItemListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: CodeBlockItemSyntax) -> CodeBlockItemListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `CodeBlockItemListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `CodeBlockItemListSyntax` with that element appended to the end.
  public func inserting(_ syntax: CodeBlockItemSyntax,
                        at index: Int) -> CodeBlockItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CodeBlockItemListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `CodeBlockItemListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: CodeBlockItemSyntax) -> CodeBlockItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `CodeBlockItemListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `CodeBlockItemListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> CodeBlockItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CodeBlockItemListSyntax` by removing the first element.
  ///
  /// - Returns: A new `CodeBlockItemListSyntax` with the first element removed.
  public func removingFirst() -> CodeBlockItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `CodeBlockItemListSyntax` by removing the last element.
  ///
  /// - Returns: A new `CodeBlockItemListSyntax` with the last element removed.
  public func removingLast() -> CodeBlockItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `CodeBlockItemListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> CodeBlockItemListSyntax {
    return CodeBlockItemListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `CodeBlockItemListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> CodeBlockItemListSyntax {
    return CodeBlockItemListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `CodeBlockItemListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> CodeBlockItemListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `CodeBlockItemListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> CodeBlockItemListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `CodeBlockItemListSyntax` with all trivia removed.
  public func withoutTrivia() -> CodeBlockItemListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `CodeBlockItemListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `CodeBlockItemListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(CodeBlockItemSyntax.self)
    })
  }
}

/// Conformance for `CodeBlockItemListSyntax` to the `BidirectionalCollection` protocol.
extension CodeBlockItemListSyntax: BidirectionalCollection {
  public typealias Element = CodeBlockItemSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> CodeBlockItemSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return CodeBlockItemSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> CodeBlockItemSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return CodeBlockItemSyntax(data)
  }
}

/// `TupleExprElementListSyntax` represents a collection of one or more
/// `TupleExprElementSyntax` nodes. TupleExprElementListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct TupleExprElementListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TupleExprElementListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .tupleExprElementList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tupleExprElementList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `TupleExprElementListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `TupleExprElementListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> TupleExprElementListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return TupleExprElementListSyntax(newData)
  }

  /// Creates a new `TupleExprElementListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `TupleExprElementListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: TupleExprElementSyntax) -> TupleExprElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TupleExprElementListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `TupleExprElementListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: TupleExprElementSyntax) -> TupleExprElementListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `TupleExprElementListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `TupleExprElementListSyntax` with that element appended to the end.
  public func inserting(_ syntax: TupleExprElementSyntax,
                        at index: Int) -> TupleExprElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TupleExprElementListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `TupleExprElementListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: TupleExprElementSyntax) -> TupleExprElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `TupleExprElementListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `TupleExprElementListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> TupleExprElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TupleExprElementListSyntax` by removing the first element.
  ///
  /// - Returns: A new `TupleExprElementListSyntax` with the first element removed.
  public func removingFirst() -> TupleExprElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `TupleExprElementListSyntax` by removing the last element.
  ///
  /// - Returns: A new `TupleExprElementListSyntax` with the last element removed.
  public func removingLast() -> TupleExprElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `TupleExprElementListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> TupleExprElementListSyntax {
    return TupleExprElementListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `TupleExprElementListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> TupleExprElementListSyntax {
    return TupleExprElementListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `TupleExprElementListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> TupleExprElementListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `TupleExprElementListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> TupleExprElementListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `TupleExprElementListSyntax` with all trivia removed.
  public func withoutTrivia() -> TupleExprElementListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `TupleExprElementListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `TupleExprElementListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(TupleExprElementSyntax.self)
    })
  }
}

/// Conformance for `TupleExprElementListSyntax` to the `BidirectionalCollection` protocol.
extension TupleExprElementListSyntax: BidirectionalCollection {
  public typealias Element = TupleExprElementSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> TupleExprElementSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return TupleExprElementSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> TupleExprElementSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return TupleExprElementSyntax(data)
  }
}

/// `ArrayElementListSyntax` represents a collection of one or more
/// `ArrayElementSyntax` nodes. ArrayElementListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct ArrayElementListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ArrayElementListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .arrayElementList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .arrayElementList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `ArrayElementListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `ArrayElementListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> ArrayElementListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return ArrayElementListSyntax(newData)
  }

  /// Creates a new `ArrayElementListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `ArrayElementListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: ArrayElementSyntax) -> ArrayElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ArrayElementListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `ArrayElementListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: ArrayElementSyntax) -> ArrayElementListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `ArrayElementListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `ArrayElementListSyntax` with that element appended to the end.
  public func inserting(_ syntax: ArrayElementSyntax,
                        at index: Int) -> ArrayElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ArrayElementListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `ArrayElementListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: ArrayElementSyntax) -> ArrayElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `ArrayElementListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `ArrayElementListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> ArrayElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ArrayElementListSyntax` by removing the first element.
  ///
  /// - Returns: A new `ArrayElementListSyntax` with the first element removed.
  public func removingFirst() -> ArrayElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `ArrayElementListSyntax` by removing the last element.
  ///
  /// - Returns: A new `ArrayElementListSyntax` with the last element removed.
  public func removingLast() -> ArrayElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `ArrayElementListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> ArrayElementListSyntax {
    return ArrayElementListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `ArrayElementListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> ArrayElementListSyntax {
    return ArrayElementListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `ArrayElementListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> ArrayElementListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `ArrayElementListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> ArrayElementListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `ArrayElementListSyntax` with all trivia removed.
  public func withoutTrivia() -> ArrayElementListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `ArrayElementListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `ArrayElementListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(ArrayElementSyntax.self)
    })
  }
}

/// Conformance for `ArrayElementListSyntax` to the `BidirectionalCollection` protocol.
extension ArrayElementListSyntax: BidirectionalCollection {
  public typealias Element = ArrayElementSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> ArrayElementSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return ArrayElementSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> ArrayElementSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return ArrayElementSyntax(data)
  }
}

/// `DictionaryElementListSyntax` represents a collection of one or more
/// `DictionaryElementSyntax` nodes. DictionaryElementListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct DictionaryElementListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DictionaryElementListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .dictionaryElementList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .dictionaryElementList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `DictionaryElementListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `DictionaryElementListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> DictionaryElementListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return DictionaryElementListSyntax(newData)
  }

  /// Creates a new `DictionaryElementListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `DictionaryElementListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: DictionaryElementSyntax) -> DictionaryElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `DictionaryElementListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `DictionaryElementListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: DictionaryElementSyntax) -> DictionaryElementListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `DictionaryElementListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `DictionaryElementListSyntax` with that element appended to the end.
  public func inserting(_ syntax: DictionaryElementSyntax,
                        at index: Int) -> DictionaryElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `DictionaryElementListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `DictionaryElementListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: DictionaryElementSyntax) -> DictionaryElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `DictionaryElementListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `DictionaryElementListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> DictionaryElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `DictionaryElementListSyntax` by removing the first element.
  ///
  /// - Returns: A new `DictionaryElementListSyntax` with the first element removed.
  public func removingFirst() -> DictionaryElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `DictionaryElementListSyntax` by removing the last element.
  ///
  /// - Returns: A new `DictionaryElementListSyntax` with the last element removed.
  public func removingLast() -> DictionaryElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `DictionaryElementListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> DictionaryElementListSyntax {
    return DictionaryElementListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `DictionaryElementListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> DictionaryElementListSyntax {
    return DictionaryElementListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `DictionaryElementListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> DictionaryElementListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `DictionaryElementListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> DictionaryElementListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `DictionaryElementListSyntax` with all trivia removed.
  public func withoutTrivia() -> DictionaryElementListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `DictionaryElementListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `DictionaryElementListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(DictionaryElementSyntax.self)
    })
  }
}

/// Conformance for `DictionaryElementListSyntax` to the `BidirectionalCollection` protocol.
extension DictionaryElementListSyntax: BidirectionalCollection {
  public typealias Element = DictionaryElementSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> DictionaryElementSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return DictionaryElementSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> DictionaryElementSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return DictionaryElementSyntax(data)
  }
}

/// `StringLiteralSegmentsSyntax` represents a collection of one or more
/// `Syntax` nodes. StringLiteralSegmentsSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct StringLiteralSegmentsSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `StringLiteralSegmentsSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .stringLiteralSegments else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .stringLiteralSegments)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `StringLiteralSegmentsSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `StringLiteralSegmentsSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> StringLiteralSegmentsSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return StringLiteralSegmentsSyntax(newData)
  }

  /// Creates a new `StringLiteralSegmentsSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `StringLiteralSegmentsSyntax` with that element appended to the end.
  public func appending(
    _ syntax: Syntax) -> StringLiteralSegmentsSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `StringLiteralSegmentsSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `StringLiteralSegmentsSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: Syntax) -> StringLiteralSegmentsSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `StringLiteralSegmentsSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `StringLiteralSegmentsSyntax` with that element appended to the end.
  public func inserting(_ syntax: Syntax,
                        at index: Int) -> StringLiteralSegmentsSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `StringLiteralSegmentsSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `StringLiteralSegmentsSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: Syntax) -> StringLiteralSegmentsSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `StringLiteralSegmentsSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `StringLiteralSegmentsSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> StringLiteralSegmentsSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `StringLiteralSegmentsSyntax` by removing the first element.
  ///
  /// - Returns: A new `StringLiteralSegmentsSyntax` with the first element removed.
  public func removingFirst() -> StringLiteralSegmentsSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `StringLiteralSegmentsSyntax` by removing the last element.
  ///
  /// - Returns: A new `StringLiteralSegmentsSyntax` with the last element removed.
  public func removingLast() -> StringLiteralSegmentsSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `StringLiteralSegmentsSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> StringLiteralSegmentsSyntax {
    return StringLiteralSegmentsSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `StringLiteralSegmentsSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> StringLiteralSegmentsSyntax {
    return StringLiteralSegmentsSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `StringLiteralSegmentsSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> StringLiteralSegmentsSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `StringLiteralSegmentsSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> StringLiteralSegmentsSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `StringLiteralSegmentsSyntax` with all trivia removed.
  public func withoutTrivia() -> StringLiteralSegmentsSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `StringLiteralSegmentsSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `StringLiteralSegmentsSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(Syntax.self)
    })
  }
}

/// Conformance for `StringLiteralSegmentsSyntax` to the `BidirectionalCollection` protocol.
extension StringLiteralSegmentsSyntax: BidirectionalCollection {
  public typealias Element = Syntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> Syntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return Syntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> Syntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return Syntax(data)
  }
}

/// `DeclNameArgumentListSyntax` represents a collection of one or more
/// `DeclNameArgumentSyntax` nodes. DeclNameArgumentListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct DeclNameArgumentListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DeclNameArgumentListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .declNameArgumentList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .declNameArgumentList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `DeclNameArgumentListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `DeclNameArgumentListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> DeclNameArgumentListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return DeclNameArgumentListSyntax(newData)
  }

  /// Creates a new `DeclNameArgumentListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `DeclNameArgumentListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: DeclNameArgumentSyntax) -> DeclNameArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `DeclNameArgumentListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `DeclNameArgumentListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: DeclNameArgumentSyntax) -> DeclNameArgumentListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `DeclNameArgumentListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `DeclNameArgumentListSyntax` with that element appended to the end.
  public func inserting(_ syntax: DeclNameArgumentSyntax,
                        at index: Int) -> DeclNameArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `DeclNameArgumentListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `DeclNameArgumentListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: DeclNameArgumentSyntax) -> DeclNameArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `DeclNameArgumentListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `DeclNameArgumentListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> DeclNameArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `DeclNameArgumentListSyntax` by removing the first element.
  ///
  /// - Returns: A new `DeclNameArgumentListSyntax` with the first element removed.
  public func removingFirst() -> DeclNameArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `DeclNameArgumentListSyntax` by removing the last element.
  ///
  /// - Returns: A new `DeclNameArgumentListSyntax` with the last element removed.
  public func removingLast() -> DeclNameArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `DeclNameArgumentListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> DeclNameArgumentListSyntax {
    return DeclNameArgumentListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `DeclNameArgumentListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> DeclNameArgumentListSyntax {
    return DeclNameArgumentListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `DeclNameArgumentListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> DeclNameArgumentListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `DeclNameArgumentListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> DeclNameArgumentListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `DeclNameArgumentListSyntax` with all trivia removed.
  public func withoutTrivia() -> DeclNameArgumentListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `DeclNameArgumentListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `DeclNameArgumentListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(DeclNameArgumentSyntax.self)
    })
  }
}

/// Conformance for `DeclNameArgumentListSyntax` to the `BidirectionalCollection` protocol.
extension DeclNameArgumentListSyntax: BidirectionalCollection {
  public typealias Element = DeclNameArgumentSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> DeclNameArgumentSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return DeclNameArgumentSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> DeclNameArgumentSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return DeclNameArgumentSyntax(data)
  }
}

/// `ExprListSyntax` represents a collection of one or more
/// `ExprSyntax` nodes. ExprListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct ExprListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ExprListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .exprList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .exprList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `ExprListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `ExprListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> ExprListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return ExprListSyntax(newData)
  }

  /// Creates a new `ExprListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `ExprListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: ExprSyntax) -> ExprListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ExprListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `ExprListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: ExprSyntax) -> ExprListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `ExprListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `ExprListSyntax` with that element appended to the end.
  public func inserting(_ syntax: ExprSyntax,
                        at index: Int) -> ExprListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ExprListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `ExprListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: ExprSyntax) -> ExprListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `ExprListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `ExprListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> ExprListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ExprListSyntax` by removing the first element.
  ///
  /// - Returns: A new `ExprListSyntax` with the first element removed.
  public func removingFirst() -> ExprListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `ExprListSyntax` by removing the last element.
  ///
  /// - Returns: A new `ExprListSyntax` with the last element removed.
  public func removingLast() -> ExprListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `ExprListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> ExprListSyntax {
    return ExprListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `ExprListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> ExprListSyntax {
    return ExprListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `ExprListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> ExprListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `ExprListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> ExprListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `ExprListSyntax` with all trivia removed.
  public func withoutTrivia() -> ExprListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `ExprListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `ExprListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(ExprSyntax.self)
    })
  }
}

/// Conformance for `ExprListSyntax` to the `BidirectionalCollection` protocol.
extension ExprListSyntax: BidirectionalCollection {
  public typealias Element = ExprSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> ExprSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return ExprSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> ExprSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return ExprSyntax(data)
  }
}

/// `ClosureCaptureItemListSyntax` represents a collection of one or more
/// `ClosureCaptureItemSyntax` nodes. ClosureCaptureItemListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct ClosureCaptureItemListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ClosureCaptureItemListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .closureCaptureItemList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .closureCaptureItemList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `ClosureCaptureItemListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `ClosureCaptureItemListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> ClosureCaptureItemListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return ClosureCaptureItemListSyntax(newData)
  }

  /// Creates a new `ClosureCaptureItemListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `ClosureCaptureItemListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: ClosureCaptureItemSyntax) -> ClosureCaptureItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ClosureCaptureItemListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `ClosureCaptureItemListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: ClosureCaptureItemSyntax) -> ClosureCaptureItemListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `ClosureCaptureItemListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `ClosureCaptureItemListSyntax` with that element appended to the end.
  public func inserting(_ syntax: ClosureCaptureItemSyntax,
                        at index: Int) -> ClosureCaptureItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ClosureCaptureItemListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `ClosureCaptureItemListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: ClosureCaptureItemSyntax) -> ClosureCaptureItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `ClosureCaptureItemListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `ClosureCaptureItemListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> ClosureCaptureItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ClosureCaptureItemListSyntax` by removing the first element.
  ///
  /// - Returns: A new `ClosureCaptureItemListSyntax` with the first element removed.
  public func removingFirst() -> ClosureCaptureItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `ClosureCaptureItemListSyntax` by removing the last element.
  ///
  /// - Returns: A new `ClosureCaptureItemListSyntax` with the last element removed.
  public func removingLast() -> ClosureCaptureItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `ClosureCaptureItemListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> ClosureCaptureItemListSyntax {
    return ClosureCaptureItemListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `ClosureCaptureItemListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> ClosureCaptureItemListSyntax {
    return ClosureCaptureItemListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `ClosureCaptureItemListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> ClosureCaptureItemListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `ClosureCaptureItemListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> ClosureCaptureItemListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `ClosureCaptureItemListSyntax` with all trivia removed.
  public func withoutTrivia() -> ClosureCaptureItemListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `ClosureCaptureItemListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `ClosureCaptureItemListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(ClosureCaptureItemSyntax.self)
    })
  }
}

/// Conformance for `ClosureCaptureItemListSyntax` to the `BidirectionalCollection` protocol.
extension ClosureCaptureItemListSyntax: BidirectionalCollection {
  public typealias Element = ClosureCaptureItemSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> ClosureCaptureItemSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return ClosureCaptureItemSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> ClosureCaptureItemSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return ClosureCaptureItemSyntax(data)
  }
}

/// `ClosureParamListSyntax` represents a collection of one or more
/// `ClosureParamSyntax` nodes. ClosureParamListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct ClosureParamListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ClosureParamListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .closureParamList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .closureParamList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `ClosureParamListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `ClosureParamListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> ClosureParamListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return ClosureParamListSyntax(newData)
  }

  /// Creates a new `ClosureParamListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `ClosureParamListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: ClosureParamSyntax) -> ClosureParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ClosureParamListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `ClosureParamListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: ClosureParamSyntax) -> ClosureParamListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `ClosureParamListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `ClosureParamListSyntax` with that element appended to the end.
  public func inserting(_ syntax: ClosureParamSyntax,
                        at index: Int) -> ClosureParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ClosureParamListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `ClosureParamListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: ClosureParamSyntax) -> ClosureParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `ClosureParamListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `ClosureParamListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> ClosureParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ClosureParamListSyntax` by removing the first element.
  ///
  /// - Returns: A new `ClosureParamListSyntax` with the first element removed.
  public func removingFirst() -> ClosureParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `ClosureParamListSyntax` by removing the last element.
  ///
  /// - Returns: A new `ClosureParamListSyntax` with the last element removed.
  public func removingLast() -> ClosureParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `ClosureParamListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> ClosureParamListSyntax {
    return ClosureParamListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `ClosureParamListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> ClosureParamListSyntax {
    return ClosureParamListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `ClosureParamListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> ClosureParamListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `ClosureParamListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> ClosureParamListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `ClosureParamListSyntax` with all trivia removed.
  public func withoutTrivia() -> ClosureParamListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `ClosureParamListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `ClosureParamListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(ClosureParamSyntax.self)
    })
  }
}

/// Conformance for `ClosureParamListSyntax` to the `BidirectionalCollection` protocol.
extension ClosureParamListSyntax: BidirectionalCollection {
  public typealias Element = ClosureParamSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> ClosureParamSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return ClosureParamSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> ClosureParamSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return ClosureParamSyntax(data)
  }
}

/// `ObjcNameSyntax` represents a collection of one or more
/// `ObjcNamePieceSyntax` nodes. ObjcNameSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct ObjcNameSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ObjcNameSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .objcName else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .objcName)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `ObjcNameSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `ObjcNameSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> ObjcNameSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return ObjcNameSyntax(newData)
  }

  /// Creates a new `ObjcNameSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `ObjcNameSyntax` with that element appended to the end.
  public func appending(
    _ syntax: ObjcNamePieceSyntax) -> ObjcNameSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ObjcNameSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `ObjcNameSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: ObjcNamePieceSyntax) -> ObjcNameSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `ObjcNameSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `ObjcNameSyntax` with that element appended to the end.
  public func inserting(_ syntax: ObjcNamePieceSyntax,
                        at index: Int) -> ObjcNameSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ObjcNameSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `ObjcNameSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: ObjcNamePieceSyntax) -> ObjcNameSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `ObjcNameSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `ObjcNameSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> ObjcNameSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ObjcNameSyntax` by removing the first element.
  ///
  /// - Returns: A new `ObjcNameSyntax` with the first element removed.
  public func removingFirst() -> ObjcNameSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `ObjcNameSyntax` by removing the last element.
  ///
  /// - Returns: A new `ObjcNameSyntax` with the last element removed.
  public func removingLast() -> ObjcNameSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `ObjcNameSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> ObjcNameSyntax {
    return ObjcNameSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `ObjcNameSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> ObjcNameSyntax {
    return ObjcNameSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `ObjcNameSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> ObjcNameSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `ObjcNameSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> ObjcNameSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `ObjcNameSyntax` with all trivia removed.
  public func withoutTrivia() -> ObjcNameSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `ObjcNameSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `ObjcNameSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(ObjcNamePieceSyntax.self)
    })
  }
}

/// Conformance for `ObjcNameSyntax` to the `BidirectionalCollection` protocol.
extension ObjcNameSyntax: BidirectionalCollection {
  public typealias Element = ObjcNamePieceSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> ObjcNamePieceSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return ObjcNamePieceSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> ObjcNamePieceSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return ObjcNamePieceSyntax(data)
  }
}

/// `FunctionParameterListSyntax` represents a collection of one or more
/// `FunctionParameterSyntax` nodes. FunctionParameterListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct FunctionParameterListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `FunctionParameterListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .functionParameterList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .functionParameterList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `FunctionParameterListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `FunctionParameterListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> FunctionParameterListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return FunctionParameterListSyntax(newData)
  }

  /// Creates a new `FunctionParameterListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `FunctionParameterListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: FunctionParameterSyntax) -> FunctionParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `FunctionParameterListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `FunctionParameterListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: FunctionParameterSyntax) -> FunctionParameterListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `FunctionParameterListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `FunctionParameterListSyntax` with that element appended to the end.
  public func inserting(_ syntax: FunctionParameterSyntax,
                        at index: Int) -> FunctionParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `FunctionParameterListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `FunctionParameterListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: FunctionParameterSyntax) -> FunctionParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `FunctionParameterListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `FunctionParameterListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> FunctionParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `FunctionParameterListSyntax` by removing the first element.
  ///
  /// - Returns: A new `FunctionParameterListSyntax` with the first element removed.
  public func removingFirst() -> FunctionParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `FunctionParameterListSyntax` by removing the last element.
  ///
  /// - Returns: A new `FunctionParameterListSyntax` with the last element removed.
  public func removingLast() -> FunctionParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `FunctionParameterListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> FunctionParameterListSyntax {
    return FunctionParameterListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `FunctionParameterListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> FunctionParameterListSyntax {
    return FunctionParameterListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `FunctionParameterListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> FunctionParameterListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `FunctionParameterListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> FunctionParameterListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `FunctionParameterListSyntax` with all trivia removed.
  public func withoutTrivia() -> FunctionParameterListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `FunctionParameterListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `FunctionParameterListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(FunctionParameterSyntax.self)
    })
  }
}

/// Conformance for `FunctionParameterListSyntax` to the `BidirectionalCollection` protocol.
extension FunctionParameterListSyntax: BidirectionalCollection {
  public typealias Element = FunctionParameterSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> FunctionParameterSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return FunctionParameterSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> FunctionParameterSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return FunctionParameterSyntax(data)
  }
}

/// `IfConfigClauseListSyntax` represents a collection of one or more
/// `IfConfigClauseSyntax` nodes. IfConfigClauseListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct IfConfigClauseListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `IfConfigClauseListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .ifConfigClauseList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .ifConfigClauseList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `IfConfigClauseListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `IfConfigClauseListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> IfConfigClauseListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return IfConfigClauseListSyntax(newData)
  }

  /// Creates a new `IfConfigClauseListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `IfConfigClauseListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: IfConfigClauseSyntax) -> IfConfigClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `IfConfigClauseListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `IfConfigClauseListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: IfConfigClauseSyntax) -> IfConfigClauseListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `IfConfigClauseListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `IfConfigClauseListSyntax` with that element appended to the end.
  public func inserting(_ syntax: IfConfigClauseSyntax,
                        at index: Int) -> IfConfigClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `IfConfigClauseListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `IfConfigClauseListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: IfConfigClauseSyntax) -> IfConfigClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `IfConfigClauseListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `IfConfigClauseListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> IfConfigClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `IfConfigClauseListSyntax` by removing the first element.
  ///
  /// - Returns: A new `IfConfigClauseListSyntax` with the first element removed.
  public func removingFirst() -> IfConfigClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `IfConfigClauseListSyntax` by removing the last element.
  ///
  /// - Returns: A new `IfConfigClauseListSyntax` with the last element removed.
  public func removingLast() -> IfConfigClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `IfConfigClauseListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> IfConfigClauseListSyntax {
    return IfConfigClauseListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `IfConfigClauseListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> IfConfigClauseListSyntax {
    return IfConfigClauseListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `IfConfigClauseListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> IfConfigClauseListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `IfConfigClauseListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> IfConfigClauseListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `IfConfigClauseListSyntax` with all trivia removed.
  public func withoutTrivia() -> IfConfigClauseListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `IfConfigClauseListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `IfConfigClauseListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(IfConfigClauseSyntax.self)
    })
  }
}

/// Conformance for `IfConfigClauseListSyntax` to the `BidirectionalCollection` protocol.
extension IfConfigClauseListSyntax: BidirectionalCollection {
  public typealias Element = IfConfigClauseSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> IfConfigClauseSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return IfConfigClauseSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> IfConfigClauseSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return IfConfigClauseSyntax(data)
  }
}

/// `InheritedTypeListSyntax` represents a collection of one or more
/// `InheritedTypeSyntax` nodes. InheritedTypeListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct InheritedTypeListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `InheritedTypeListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .inheritedTypeList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .inheritedTypeList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `InheritedTypeListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `InheritedTypeListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> InheritedTypeListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return InheritedTypeListSyntax(newData)
  }

  /// Creates a new `InheritedTypeListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `InheritedTypeListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: InheritedTypeSyntax) -> InheritedTypeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `InheritedTypeListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `InheritedTypeListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: InheritedTypeSyntax) -> InheritedTypeListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `InheritedTypeListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `InheritedTypeListSyntax` with that element appended to the end.
  public func inserting(_ syntax: InheritedTypeSyntax,
                        at index: Int) -> InheritedTypeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `InheritedTypeListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `InheritedTypeListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: InheritedTypeSyntax) -> InheritedTypeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `InheritedTypeListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `InheritedTypeListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> InheritedTypeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `InheritedTypeListSyntax` by removing the first element.
  ///
  /// - Returns: A new `InheritedTypeListSyntax` with the first element removed.
  public func removingFirst() -> InheritedTypeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `InheritedTypeListSyntax` by removing the last element.
  ///
  /// - Returns: A new `InheritedTypeListSyntax` with the last element removed.
  public func removingLast() -> InheritedTypeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `InheritedTypeListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> InheritedTypeListSyntax {
    return InheritedTypeListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `InheritedTypeListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> InheritedTypeListSyntax {
    return InheritedTypeListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `InheritedTypeListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> InheritedTypeListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `InheritedTypeListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> InheritedTypeListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `InheritedTypeListSyntax` with all trivia removed.
  public func withoutTrivia() -> InheritedTypeListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `InheritedTypeListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `InheritedTypeListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(InheritedTypeSyntax.self)
    })
  }
}

/// Conformance for `InheritedTypeListSyntax` to the `BidirectionalCollection` protocol.
extension InheritedTypeListSyntax: BidirectionalCollection {
  public typealias Element = InheritedTypeSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> InheritedTypeSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return InheritedTypeSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> InheritedTypeSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return InheritedTypeSyntax(data)
  }
}

/// `MemberDeclListSyntax` represents a collection of one or more
/// `MemberDeclListItemSyntax` nodes. MemberDeclListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct MemberDeclListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `MemberDeclListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .memberDeclList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .memberDeclList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `MemberDeclListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `MemberDeclListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> MemberDeclListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return MemberDeclListSyntax(newData)
  }

  /// Creates a new `MemberDeclListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `MemberDeclListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: MemberDeclListItemSyntax) -> MemberDeclListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `MemberDeclListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `MemberDeclListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: MemberDeclListItemSyntax) -> MemberDeclListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `MemberDeclListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `MemberDeclListSyntax` with that element appended to the end.
  public func inserting(_ syntax: MemberDeclListItemSyntax,
                        at index: Int) -> MemberDeclListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `MemberDeclListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `MemberDeclListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: MemberDeclListItemSyntax) -> MemberDeclListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `MemberDeclListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `MemberDeclListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> MemberDeclListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `MemberDeclListSyntax` by removing the first element.
  ///
  /// - Returns: A new `MemberDeclListSyntax` with the first element removed.
  public func removingFirst() -> MemberDeclListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `MemberDeclListSyntax` by removing the last element.
  ///
  /// - Returns: A new `MemberDeclListSyntax` with the last element removed.
  public func removingLast() -> MemberDeclListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `MemberDeclListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> MemberDeclListSyntax {
    return MemberDeclListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `MemberDeclListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> MemberDeclListSyntax {
    return MemberDeclListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `MemberDeclListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> MemberDeclListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `MemberDeclListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> MemberDeclListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `MemberDeclListSyntax` with all trivia removed.
  public func withoutTrivia() -> MemberDeclListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `MemberDeclListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `MemberDeclListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(MemberDeclListItemSyntax.self)
    })
  }
}

/// Conformance for `MemberDeclListSyntax` to the `BidirectionalCollection` protocol.
extension MemberDeclListSyntax: BidirectionalCollection {
  public typealias Element = MemberDeclListItemSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> MemberDeclListItemSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return MemberDeclListItemSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> MemberDeclListItemSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return MemberDeclListItemSyntax(data)
  }
}

/// `ModifierListSyntax` represents a collection of one or more
/// `DeclModifierSyntax` nodes. ModifierListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct ModifierListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ModifierListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .modifierList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .modifierList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `ModifierListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `ModifierListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> ModifierListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return ModifierListSyntax(newData)
  }

  /// Creates a new `ModifierListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `ModifierListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: DeclModifierSyntax) -> ModifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ModifierListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `ModifierListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: DeclModifierSyntax) -> ModifierListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `ModifierListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `ModifierListSyntax` with that element appended to the end.
  public func inserting(_ syntax: DeclModifierSyntax,
                        at index: Int) -> ModifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ModifierListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `ModifierListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: DeclModifierSyntax) -> ModifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `ModifierListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `ModifierListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> ModifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ModifierListSyntax` by removing the first element.
  ///
  /// - Returns: A new `ModifierListSyntax` with the first element removed.
  public func removingFirst() -> ModifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `ModifierListSyntax` by removing the last element.
  ///
  /// - Returns: A new `ModifierListSyntax` with the last element removed.
  public func removingLast() -> ModifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `ModifierListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> ModifierListSyntax {
    return ModifierListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `ModifierListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> ModifierListSyntax {
    return ModifierListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `ModifierListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> ModifierListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `ModifierListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> ModifierListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `ModifierListSyntax` with all trivia removed.
  public func withoutTrivia() -> ModifierListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `ModifierListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `ModifierListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(DeclModifierSyntax.self)
    })
  }
}

/// Conformance for `ModifierListSyntax` to the `BidirectionalCollection` protocol.
extension ModifierListSyntax: BidirectionalCollection {
  public typealias Element = DeclModifierSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> DeclModifierSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return DeclModifierSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> DeclModifierSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return DeclModifierSyntax(data)
  }
}

/// `AccessPathSyntax` represents a collection of one or more
/// `AccessPathComponentSyntax` nodes. AccessPathSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct AccessPathSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AccessPathSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .accessPath else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .accessPath)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `AccessPathSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `AccessPathSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> AccessPathSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return AccessPathSyntax(newData)
  }

  /// Creates a new `AccessPathSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `AccessPathSyntax` with that element appended to the end.
  public func appending(
    _ syntax: AccessPathComponentSyntax) -> AccessPathSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AccessPathSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `AccessPathSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: AccessPathComponentSyntax) -> AccessPathSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `AccessPathSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `AccessPathSyntax` with that element appended to the end.
  public func inserting(_ syntax: AccessPathComponentSyntax,
                        at index: Int) -> AccessPathSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AccessPathSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `AccessPathSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: AccessPathComponentSyntax) -> AccessPathSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `AccessPathSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `AccessPathSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> AccessPathSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AccessPathSyntax` by removing the first element.
  ///
  /// - Returns: A new `AccessPathSyntax` with the first element removed.
  public func removingFirst() -> AccessPathSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `AccessPathSyntax` by removing the last element.
  ///
  /// - Returns: A new `AccessPathSyntax` with the last element removed.
  public func removingLast() -> AccessPathSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `AccessPathSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> AccessPathSyntax {
    return AccessPathSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `AccessPathSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> AccessPathSyntax {
    return AccessPathSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `AccessPathSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> AccessPathSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `AccessPathSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> AccessPathSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `AccessPathSyntax` with all trivia removed.
  public func withoutTrivia() -> AccessPathSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `AccessPathSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `AccessPathSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(AccessPathComponentSyntax.self)
    })
  }
}

/// Conformance for `AccessPathSyntax` to the `BidirectionalCollection` protocol.
extension AccessPathSyntax: BidirectionalCollection {
  public typealias Element = AccessPathComponentSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> AccessPathComponentSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return AccessPathComponentSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> AccessPathComponentSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return AccessPathComponentSyntax(data)
  }
}

/// `AccessorListSyntax` represents a collection of one or more
/// `AccessorDeclSyntax` nodes. AccessorListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct AccessorListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AccessorListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .accessorList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .accessorList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `AccessorListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `AccessorListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> AccessorListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return AccessorListSyntax(newData)
  }

  /// Creates a new `AccessorListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `AccessorListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: AccessorDeclSyntax) -> AccessorListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AccessorListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `AccessorListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: AccessorDeclSyntax) -> AccessorListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `AccessorListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `AccessorListSyntax` with that element appended to the end.
  public func inserting(_ syntax: AccessorDeclSyntax,
                        at index: Int) -> AccessorListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AccessorListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `AccessorListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: AccessorDeclSyntax) -> AccessorListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `AccessorListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `AccessorListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> AccessorListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AccessorListSyntax` by removing the first element.
  ///
  /// - Returns: A new `AccessorListSyntax` with the first element removed.
  public func removingFirst() -> AccessorListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `AccessorListSyntax` by removing the last element.
  ///
  /// - Returns: A new `AccessorListSyntax` with the last element removed.
  public func removingLast() -> AccessorListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `AccessorListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> AccessorListSyntax {
    return AccessorListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `AccessorListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> AccessorListSyntax {
    return AccessorListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `AccessorListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> AccessorListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `AccessorListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> AccessorListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `AccessorListSyntax` with all trivia removed.
  public func withoutTrivia() -> AccessorListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `AccessorListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `AccessorListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(AccessorDeclSyntax.self)
    })
  }
}

/// Conformance for `AccessorListSyntax` to the `BidirectionalCollection` protocol.
extension AccessorListSyntax: BidirectionalCollection {
  public typealias Element = AccessorDeclSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> AccessorDeclSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return AccessorDeclSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> AccessorDeclSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return AccessorDeclSyntax(data)
  }
}

/// `PatternBindingListSyntax` represents a collection of one or more
/// `PatternBindingSyntax` nodes. PatternBindingListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct PatternBindingListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PatternBindingListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .patternBindingList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .patternBindingList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `PatternBindingListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `PatternBindingListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> PatternBindingListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return PatternBindingListSyntax(newData)
  }

  /// Creates a new `PatternBindingListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `PatternBindingListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: PatternBindingSyntax) -> PatternBindingListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `PatternBindingListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `PatternBindingListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: PatternBindingSyntax) -> PatternBindingListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `PatternBindingListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `PatternBindingListSyntax` with that element appended to the end.
  public func inserting(_ syntax: PatternBindingSyntax,
                        at index: Int) -> PatternBindingListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `PatternBindingListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `PatternBindingListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: PatternBindingSyntax) -> PatternBindingListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `PatternBindingListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `PatternBindingListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> PatternBindingListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `PatternBindingListSyntax` by removing the first element.
  ///
  /// - Returns: A new `PatternBindingListSyntax` with the first element removed.
  public func removingFirst() -> PatternBindingListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `PatternBindingListSyntax` by removing the last element.
  ///
  /// - Returns: A new `PatternBindingListSyntax` with the last element removed.
  public func removingLast() -> PatternBindingListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `PatternBindingListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> PatternBindingListSyntax {
    return PatternBindingListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `PatternBindingListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> PatternBindingListSyntax {
    return PatternBindingListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `PatternBindingListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> PatternBindingListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `PatternBindingListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> PatternBindingListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `PatternBindingListSyntax` with all trivia removed.
  public func withoutTrivia() -> PatternBindingListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `PatternBindingListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `PatternBindingListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(PatternBindingSyntax.self)
    })
  }
}

/// Conformance for `PatternBindingListSyntax` to the `BidirectionalCollection` protocol.
extension PatternBindingListSyntax: BidirectionalCollection {
  public typealias Element = PatternBindingSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> PatternBindingSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return PatternBindingSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> PatternBindingSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return PatternBindingSyntax(data)
  }
}

/// `EnumCaseElementListSyntax` represents a collection of one or more
/// `EnumCaseElementSyntax` nodes. EnumCaseElementListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct EnumCaseElementListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `EnumCaseElementListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .enumCaseElementList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .enumCaseElementList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `EnumCaseElementListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `EnumCaseElementListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> EnumCaseElementListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return EnumCaseElementListSyntax(newData)
  }

  /// Creates a new `EnumCaseElementListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `EnumCaseElementListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: EnumCaseElementSyntax) -> EnumCaseElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `EnumCaseElementListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `EnumCaseElementListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: EnumCaseElementSyntax) -> EnumCaseElementListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `EnumCaseElementListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `EnumCaseElementListSyntax` with that element appended to the end.
  public func inserting(_ syntax: EnumCaseElementSyntax,
                        at index: Int) -> EnumCaseElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `EnumCaseElementListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `EnumCaseElementListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: EnumCaseElementSyntax) -> EnumCaseElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `EnumCaseElementListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `EnumCaseElementListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> EnumCaseElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `EnumCaseElementListSyntax` by removing the first element.
  ///
  /// - Returns: A new `EnumCaseElementListSyntax` with the first element removed.
  public func removingFirst() -> EnumCaseElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `EnumCaseElementListSyntax` by removing the last element.
  ///
  /// - Returns: A new `EnumCaseElementListSyntax` with the last element removed.
  public func removingLast() -> EnumCaseElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `EnumCaseElementListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> EnumCaseElementListSyntax {
    return EnumCaseElementListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `EnumCaseElementListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> EnumCaseElementListSyntax {
    return EnumCaseElementListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `EnumCaseElementListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> EnumCaseElementListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `EnumCaseElementListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> EnumCaseElementListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `EnumCaseElementListSyntax` with all trivia removed.
  public func withoutTrivia() -> EnumCaseElementListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `EnumCaseElementListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `EnumCaseElementListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(EnumCaseElementSyntax.self)
    })
  }
}

/// Conformance for `EnumCaseElementListSyntax` to the `BidirectionalCollection` protocol.
extension EnumCaseElementListSyntax: BidirectionalCollection {
  public typealias Element = EnumCaseElementSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> EnumCaseElementSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return EnumCaseElementSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> EnumCaseElementSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return EnumCaseElementSyntax(data)
  }
}

/// `IdentifierListSyntax` represents a collection of one or more
/// `TokenSyntax` nodes. IdentifierListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct IdentifierListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `IdentifierListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .identifierList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .identifierList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `IdentifierListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `IdentifierListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> IdentifierListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return IdentifierListSyntax(newData)
  }

  /// Creates a new `IdentifierListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `IdentifierListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: TokenSyntax) -> IdentifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `IdentifierListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `IdentifierListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: TokenSyntax) -> IdentifierListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `IdentifierListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `IdentifierListSyntax` with that element appended to the end.
  public func inserting(_ syntax: TokenSyntax,
                        at index: Int) -> IdentifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `IdentifierListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `IdentifierListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: TokenSyntax) -> IdentifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `IdentifierListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `IdentifierListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> IdentifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `IdentifierListSyntax` by removing the first element.
  ///
  /// - Returns: A new `IdentifierListSyntax` with the first element removed.
  public func removingFirst() -> IdentifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `IdentifierListSyntax` by removing the last element.
  ///
  /// - Returns: A new `IdentifierListSyntax` with the last element removed.
  public func removingLast() -> IdentifierListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `IdentifierListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> IdentifierListSyntax {
    return IdentifierListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `IdentifierListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> IdentifierListSyntax {
    return IdentifierListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `IdentifierListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> IdentifierListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `IdentifierListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> IdentifierListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `IdentifierListSyntax` with all trivia removed.
  public func withoutTrivia() -> IdentifierListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `IdentifierListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `IdentifierListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(TokenSyntax.self)
    })
  }
}

/// Conformance for `IdentifierListSyntax` to the `BidirectionalCollection` protocol.
extension IdentifierListSyntax: BidirectionalCollection {
  public typealias Element = TokenSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> TokenSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return TokenSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> TokenSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return TokenSyntax(data)
  }
}

/// `PrecedenceGroupAttributeListSyntax` represents a collection of one or more
/// `Syntax` nodes. PrecedenceGroupAttributeListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct PrecedenceGroupAttributeListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrecedenceGroupAttributeListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .precedenceGroupAttributeList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .precedenceGroupAttributeList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `PrecedenceGroupAttributeListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `PrecedenceGroupAttributeListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> PrecedenceGroupAttributeListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return PrecedenceGroupAttributeListSyntax(newData)
  }

  /// Creates a new `PrecedenceGroupAttributeListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `PrecedenceGroupAttributeListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: Syntax) -> PrecedenceGroupAttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `PrecedenceGroupAttributeListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `PrecedenceGroupAttributeListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: Syntax) -> PrecedenceGroupAttributeListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `PrecedenceGroupAttributeListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `PrecedenceGroupAttributeListSyntax` with that element appended to the end.
  public func inserting(_ syntax: Syntax,
                        at index: Int) -> PrecedenceGroupAttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `PrecedenceGroupAttributeListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `PrecedenceGroupAttributeListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: Syntax) -> PrecedenceGroupAttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `PrecedenceGroupAttributeListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `PrecedenceGroupAttributeListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> PrecedenceGroupAttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `PrecedenceGroupAttributeListSyntax` by removing the first element.
  ///
  /// - Returns: A new `PrecedenceGroupAttributeListSyntax` with the first element removed.
  public func removingFirst() -> PrecedenceGroupAttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `PrecedenceGroupAttributeListSyntax` by removing the last element.
  ///
  /// - Returns: A new `PrecedenceGroupAttributeListSyntax` with the last element removed.
  public func removingLast() -> PrecedenceGroupAttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `PrecedenceGroupAttributeListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> PrecedenceGroupAttributeListSyntax {
    return PrecedenceGroupAttributeListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `PrecedenceGroupAttributeListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> PrecedenceGroupAttributeListSyntax {
    return PrecedenceGroupAttributeListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `PrecedenceGroupAttributeListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> PrecedenceGroupAttributeListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `PrecedenceGroupAttributeListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> PrecedenceGroupAttributeListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `PrecedenceGroupAttributeListSyntax` with all trivia removed.
  public func withoutTrivia() -> PrecedenceGroupAttributeListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `PrecedenceGroupAttributeListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `PrecedenceGroupAttributeListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(Syntax.self)
    })
  }
}

/// Conformance for `PrecedenceGroupAttributeListSyntax` to the `BidirectionalCollection` protocol.
extension PrecedenceGroupAttributeListSyntax: BidirectionalCollection {
  public typealias Element = Syntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> Syntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return Syntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> Syntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return Syntax(data)
  }
}

/// `PrecedenceGroupNameListSyntax` represents a collection of one or more
/// `PrecedenceGroupNameElementSyntax` nodes. PrecedenceGroupNameListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct PrecedenceGroupNameListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `PrecedenceGroupNameListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .precedenceGroupNameList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .precedenceGroupNameList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `PrecedenceGroupNameListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `PrecedenceGroupNameListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> PrecedenceGroupNameListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return PrecedenceGroupNameListSyntax(newData)
  }

  /// Creates a new `PrecedenceGroupNameListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `PrecedenceGroupNameListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: PrecedenceGroupNameElementSyntax) -> PrecedenceGroupNameListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `PrecedenceGroupNameListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `PrecedenceGroupNameListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: PrecedenceGroupNameElementSyntax) -> PrecedenceGroupNameListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `PrecedenceGroupNameListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `PrecedenceGroupNameListSyntax` with that element appended to the end.
  public func inserting(_ syntax: PrecedenceGroupNameElementSyntax,
                        at index: Int) -> PrecedenceGroupNameListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `PrecedenceGroupNameListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `PrecedenceGroupNameListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: PrecedenceGroupNameElementSyntax) -> PrecedenceGroupNameListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `PrecedenceGroupNameListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `PrecedenceGroupNameListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> PrecedenceGroupNameListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `PrecedenceGroupNameListSyntax` by removing the first element.
  ///
  /// - Returns: A new `PrecedenceGroupNameListSyntax` with the first element removed.
  public func removingFirst() -> PrecedenceGroupNameListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `PrecedenceGroupNameListSyntax` by removing the last element.
  ///
  /// - Returns: A new `PrecedenceGroupNameListSyntax` with the last element removed.
  public func removingLast() -> PrecedenceGroupNameListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `PrecedenceGroupNameListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> PrecedenceGroupNameListSyntax {
    return PrecedenceGroupNameListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `PrecedenceGroupNameListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> PrecedenceGroupNameListSyntax {
    return PrecedenceGroupNameListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `PrecedenceGroupNameListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> PrecedenceGroupNameListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `PrecedenceGroupNameListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> PrecedenceGroupNameListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `PrecedenceGroupNameListSyntax` with all trivia removed.
  public func withoutTrivia() -> PrecedenceGroupNameListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `PrecedenceGroupNameListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `PrecedenceGroupNameListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(PrecedenceGroupNameElementSyntax.self)
    })
  }
}

/// Conformance for `PrecedenceGroupNameListSyntax` to the `BidirectionalCollection` protocol.
extension PrecedenceGroupNameListSyntax: BidirectionalCollection {
  public typealias Element = PrecedenceGroupNameElementSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> PrecedenceGroupNameElementSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return PrecedenceGroupNameElementSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> PrecedenceGroupNameElementSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return PrecedenceGroupNameElementSyntax(data)
  }
}

/// `TokenListSyntax` represents a collection of one or more
/// `TokenSyntax` nodes. TokenListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct TokenListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TokenListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .tokenList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tokenList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `TokenListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `TokenListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> TokenListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return TokenListSyntax(newData)
  }

  /// Creates a new `TokenListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `TokenListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: TokenSyntax) -> TokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TokenListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `TokenListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: TokenSyntax) -> TokenListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `TokenListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `TokenListSyntax` with that element appended to the end.
  public func inserting(_ syntax: TokenSyntax,
                        at index: Int) -> TokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TokenListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `TokenListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: TokenSyntax) -> TokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `TokenListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `TokenListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> TokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TokenListSyntax` by removing the first element.
  ///
  /// - Returns: A new `TokenListSyntax` with the first element removed.
  public func removingFirst() -> TokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `TokenListSyntax` by removing the last element.
  ///
  /// - Returns: A new `TokenListSyntax` with the last element removed.
  public func removingLast() -> TokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `TokenListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> TokenListSyntax {
    return TokenListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `TokenListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> TokenListSyntax {
    return TokenListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `TokenListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> TokenListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `TokenListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> TokenListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `TokenListSyntax` with all trivia removed.
  public func withoutTrivia() -> TokenListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `TokenListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `TokenListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(TokenSyntax.self)
    })
  }
}

/// Conformance for `TokenListSyntax` to the `BidirectionalCollection` protocol.
extension TokenListSyntax: BidirectionalCollection {
  public typealias Element = TokenSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> TokenSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return TokenSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> TokenSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return TokenSyntax(data)
  }
}

/// `NonEmptyTokenListSyntax` represents a collection of one or more
/// `TokenSyntax` nodes. NonEmptyTokenListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct NonEmptyTokenListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `NonEmptyTokenListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .nonEmptyTokenList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .nonEmptyTokenList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `NonEmptyTokenListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `NonEmptyTokenListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> NonEmptyTokenListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return NonEmptyTokenListSyntax(newData)
  }

  /// Creates a new `NonEmptyTokenListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `NonEmptyTokenListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: TokenSyntax) -> NonEmptyTokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `NonEmptyTokenListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `NonEmptyTokenListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: TokenSyntax) -> NonEmptyTokenListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `NonEmptyTokenListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `NonEmptyTokenListSyntax` with that element appended to the end.
  public func inserting(_ syntax: TokenSyntax,
                        at index: Int) -> NonEmptyTokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `NonEmptyTokenListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `NonEmptyTokenListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: TokenSyntax) -> NonEmptyTokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `NonEmptyTokenListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `NonEmptyTokenListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> NonEmptyTokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `NonEmptyTokenListSyntax` by removing the first element.
  ///
  /// - Returns: A new `NonEmptyTokenListSyntax` with the first element removed.
  public func removingFirst() -> NonEmptyTokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `NonEmptyTokenListSyntax` by removing the last element.
  ///
  /// - Returns: A new `NonEmptyTokenListSyntax` with the last element removed.
  public func removingLast() -> NonEmptyTokenListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `NonEmptyTokenListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> NonEmptyTokenListSyntax {
    return NonEmptyTokenListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `NonEmptyTokenListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> NonEmptyTokenListSyntax {
    return NonEmptyTokenListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `NonEmptyTokenListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> NonEmptyTokenListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `NonEmptyTokenListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> NonEmptyTokenListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `NonEmptyTokenListSyntax` with all trivia removed.
  public func withoutTrivia() -> NonEmptyTokenListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `NonEmptyTokenListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `NonEmptyTokenListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(TokenSyntax.self)
    })
  }
}

/// Conformance for `NonEmptyTokenListSyntax` to the `BidirectionalCollection` protocol.
extension NonEmptyTokenListSyntax: BidirectionalCollection {
  public typealias Element = TokenSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> TokenSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return TokenSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> TokenSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return TokenSyntax(data)
  }
}

/// `AttributeListSyntax` represents a collection of one or more
/// `Syntax` nodes. AttributeListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct AttributeListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AttributeListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .attributeList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .attributeList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `AttributeListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `AttributeListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> AttributeListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return AttributeListSyntax(newData)
  }

  /// Creates a new `AttributeListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `AttributeListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: Syntax) -> AttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AttributeListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `AttributeListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: Syntax) -> AttributeListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `AttributeListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `AttributeListSyntax` with that element appended to the end.
  public func inserting(_ syntax: Syntax,
                        at index: Int) -> AttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AttributeListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `AttributeListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: Syntax) -> AttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `AttributeListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `AttributeListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> AttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AttributeListSyntax` by removing the first element.
  ///
  /// - Returns: A new `AttributeListSyntax` with the first element removed.
  public func removingFirst() -> AttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `AttributeListSyntax` by removing the last element.
  ///
  /// - Returns: A new `AttributeListSyntax` with the last element removed.
  public func removingLast() -> AttributeListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `AttributeListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> AttributeListSyntax {
    return AttributeListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `AttributeListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> AttributeListSyntax {
    return AttributeListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `AttributeListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> AttributeListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `AttributeListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> AttributeListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `AttributeListSyntax` with all trivia removed.
  public func withoutTrivia() -> AttributeListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `AttributeListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `AttributeListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(Syntax.self)
    })
  }
}

/// Conformance for `AttributeListSyntax` to the `BidirectionalCollection` protocol.
extension AttributeListSyntax: BidirectionalCollection {
  public typealias Element = Syntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> Syntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return Syntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> Syntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return Syntax(data)
  }
}

/// `SpecializeAttributeSpecListSyntax` represents a collection of one or more
/// `Syntax` nodes. SpecializeAttributeSpecListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct SpecializeAttributeSpecListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SpecializeAttributeSpecListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .specializeAttributeSpecList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .specializeAttributeSpecList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `SpecializeAttributeSpecListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `SpecializeAttributeSpecListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> SpecializeAttributeSpecListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return SpecializeAttributeSpecListSyntax(newData)
  }

  /// Creates a new `SpecializeAttributeSpecListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `SpecializeAttributeSpecListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: Syntax) -> SpecializeAttributeSpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `SpecializeAttributeSpecListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `SpecializeAttributeSpecListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: Syntax) -> SpecializeAttributeSpecListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `SpecializeAttributeSpecListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `SpecializeAttributeSpecListSyntax` with that element appended to the end.
  public func inserting(_ syntax: Syntax,
                        at index: Int) -> SpecializeAttributeSpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `SpecializeAttributeSpecListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `SpecializeAttributeSpecListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: Syntax) -> SpecializeAttributeSpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `SpecializeAttributeSpecListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `SpecializeAttributeSpecListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> SpecializeAttributeSpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `SpecializeAttributeSpecListSyntax` by removing the first element.
  ///
  /// - Returns: A new `SpecializeAttributeSpecListSyntax` with the first element removed.
  public func removingFirst() -> SpecializeAttributeSpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `SpecializeAttributeSpecListSyntax` by removing the last element.
  ///
  /// - Returns: A new `SpecializeAttributeSpecListSyntax` with the last element removed.
  public func removingLast() -> SpecializeAttributeSpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `SpecializeAttributeSpecListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> SpecializeAttributeSpecListSyntax {
    return SpecializeAttributeSpecListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `SpecializeAttributeSpecListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> SpecializeAttributeSpecListSyntax {
    return SpecializeAttributeSpecListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `SpecializeAttributeSpecListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> SpecializeAttributeSpecListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `SpecializeAttributeSpecListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> SpecializeAttributeSpecListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `SpecializeAttributeSpecListSyntax` with all trivia removed.
  public func withoutTrivia() -> SpecializeAttributeSpecListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `SpecializeAttributeSpecListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `SpecializeAttributeSpecListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(Syntax.self)
    })
  }
}

/// Conformance for `SpecializeAttributeSpecListSyntax` to the `BidirectionalCollection` protocol.
extension SpecializeAttributeSpecListSyntax: BidirectionalCollection {
  public typealias Element = Syntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> Syntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return Syntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> Syntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return Syntax(data)
  }
}

/// `ObjCSelectorSyntax` represents a collection of one or more
/// `ObjCSelectorPieceSyntax` nodes. ObjCSelectorSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct ObjCSelectorSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ObjCSelectorSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .objCSelector else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .objCSelector)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `ObjCSelectorSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `ObjCSelectorSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> ObjCSelectorSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return ObjCSelectorSyntax(newData)
  }

  /// Creates a new `ObjCSelectorSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `ObjCSelectorSyntax` with that element appended to the end.
  public func appending(
    _ syntax: ObjCSelectorPieceSyntax) -> ObjCSelectorSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ObjCSelectorSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `ObjCSelectorSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: ObjCSelectorPieceSyntax) -> ObjCSelectorSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `ObjCSelectorSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `ObjCSelectorSyntax` with that element appended to the end.
  public func inserting(_ syntax: ObjCSelectorPieceSyntax,
                        at index: Int) -> ObjCSelectorSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ObjCSelectorSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `ObjCSelectorSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: ObjCSelectorPieceSyntax) -> ObjCSelectorSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `ObjCSelectorSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `ObjCSelectorSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> ObjCSelectorSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ObjCSelectorSyntax` by removing the first element.
  ///
  /// - Returns: A new `ObjCSelectorSyntax` with the first element removed.
  public func removingFirst() -> ObjCSelectorSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `ObjCSelectorSyntax` by removing the last element.
  ///
  /// - Returns: A new `ObjCSelectorSyntax` with the last element removed.
  public func removingLast() -> ObjCSelectorSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `ObjCSelectorSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> ObjCSelectorSyntax {
    return ObjCSelectorSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `ObjCSelectorSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> ObjCSelectorSyntax {
    return ObjCSelectorSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `ObjCSelectorSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> ObjCSelectorSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `ObjCSelectorSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> ObjCSelectorSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `ObjCSelectorSyntax` with all trivia removed.
  public func withoutTrivia() -> ObjCSelectorSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `ObjCSelectorSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `ObjCSelectorSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(ObjCSelectorPieceSyntax.self)
    })
  }
}

/// Conformance for `ObjCSelectorSyntax` to the `BidirectionalCollection` protocol.
extension ObjCSelectorSyntax: BidirectionalCollection {
  public typealias Element = ObjCSelectorPieceSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> ObjCSelectorPieceSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return ObjCSelectorPieceSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> ObjCSelectorPieceSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return ObjCSelectorPieceSyntax(data)
  }
}

/// `DifferentiationParamListSyntax` represents a collection of one or more
/// `DifferentiationParamSyntax` nodes. DifferentiationParamListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct DifferentiationParamListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `DifferentiationParamListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .differentiationParamList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .differentiationParamList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `DifferentiationParamListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `DifferentiationParamListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> DifferentiationParamListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return DifferentiationParamListSyntax(newData)
  }

  /// Creates a new `DifferentiationParamListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `DifferentiationParamListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: DifferentiationParamSyntax) -> DifferentiationParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `DifferentiationParamListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `DifferentiationParamListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: DifferentiationParamSyntax) -> DifferentiationParamListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `DifferentiationParamListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `DifferentiationParamListSyntax` with that element appended to the end.
  public func inserting(_ syntax: DifferentiationParamSyntax,
                        at index: Int) -> DifferentiationParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `DifferentiationParamListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `DifferentiationParamListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: DifferentiationParamSyntax) -> DifferentiationParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `DifferentiationParamListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `DifferentiationParamListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> DifferentiationParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `DifferentiationParamListSyntax` by removing the first element.
  ///
  /// - Returns: A new `DifferentiationParamListSyntax` with the first element removed.
  public func removingFirst() -> DifferentiationParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `DifferentiationParamListSyntax` by removing the last element.
  ///
  /// - Returns: A new `DifferentiationParamListSyntax` with the last element removed.
  public func removingLast() -> DifferentiationParamListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `DifferentiationParamListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> DifferentiationParamListSyntax {
    return DifferentiationParamListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `DifferentiationParamListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> DifferentiationParamListSyntax {
    return DifferentiationParamListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `DifferentiationParamListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> DifferentiationParamListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `DifferentiationParamListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> DifferentiationParamListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `DifferentiationParamListSyntax` with all trivia removed.
  public func withoutTrivia() -> DifferentiationParamListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `DifferentiationParamListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `DifferentiationParamListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(DifferentiationParamSyntax.self)
    })
  }
}

/// Conformance for `DifferentiationParamListSyntax` to the `BidirectionalCollection` protocol.
extension DifferentiationParamListSyntax: BidirectionalCollection {
  public typealias Element = DifferentiationParamSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> DifferentiationParamSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return DifferentiationParamSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> DifferentiationParamSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return DifferentiationParamSyntax(data)
  }
}

/// `SwitchCaseListSyntax` represents a collection of one or more
/// `Syntax` nodes. SwitchCaseListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct SwitchCaseListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `SwitchCaseListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .switchCaseList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .switchCaseList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `SwitchCaseListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `SwitchCaseListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> SwitchCaseListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return SwitchCaseListSyntax(newData)
  }

  /// Creates a new `SwitchCaseListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `SwitchCaseListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: Syntax) -> SwitchCaseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `SwitchCaseListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `SwitchCaseListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: Syntax) -> SwitchCaseListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `SwitchCaseListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `SwitchCaseListSyntax` with that element appended to the end.
  public func inserting(_ syntax: Syntax,
                        at index: Int) -> SwitchCaseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `SwitchCaseListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `SwitchCaseListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: Syntax) -> SwitchCaseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `SwitchCaseListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `SwitchCaseListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> SwitchCaseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `SwitchCaseListSyntax` by removing the first element.
  ///
  /// - Returns: A new `SwitchCaseListSyntax` with the first element removed.
  public func removingFirst() -> SwitchCaseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `SwitchCaseListSyntax` by removing the last element.
  ///
  /// - Returns: A new `SwitchCaseListSyntax` with the last element removed.
  public func removingLast() -> SwitchCaseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `SwitchCaseListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> SwitchCaseListSyntax {
    return SwitchCaseListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `SwitchCaseListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> SwitchCaseListSyntax {
    return SwitchCaseListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `SwitchCaseListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> SwitchCaseListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `SwitchCaseListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> SwitchCaseListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `SwitchCaseListSyntax` with all trivia removed.
  public func withoutTrivia() -> SwitchCaseListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `SwitchCaseListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `SwitchCaseListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(Syntax.self)
    })
  }
}

/// Conformance for `SwitchCaseListSyntax` to the `BidirectionalCollection` protocol.
extension SwitchCaseListSyntax: BidirectionalCollection {
  public typealias Element = Syntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> Syntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return Syntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> Syntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return Syntax(data)
  }
}

/// `CatchClauseListSyntax` represents a collection of one or more
/// `CatchClauseSyntax` nodes. CatchClauseListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct CatchClauseListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CatchClauseListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .catchClauseList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .catchClauseList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `CatchClauseListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `CatchClauseListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> CatchClauseListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return CatchClauseListSyntax(newData)
  }

  /// Creates a new `CatchClauseListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `CatchClauseListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: CatchClauseSyntax) -> CatchClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CatchClauseListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `CatchClauseListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: CatchClauseSyntax) -> CatchClauseListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `CatchClauseListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `CatchClauseListSyntax` with that element appended to the end.
  public func inserting(_ syntax: CatchClauseSyntax,
                        at index: Int) -> CatchClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CatchClauseListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `CatchClauseListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: CatchClauseSyntax) -> CatchClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `CatchClauseListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `CatchClauseListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> CatchClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CatchClauseListSyntax` by removing the first element.
  ///
  /// - Returns: A new `CatchClauseListSyntax` with the first element removed.
  public func removingFirst() -> CatchClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `CatchClauseListSyntax` by removing the last element.
  ///
  /// - Returns: A new `CatchClauseListSyntax` with the last element removed.
  public func removingLast() -> CatchClauseListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `CatchClauseListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> CatchClauseListSyntax {
    return CatchClauseListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `CatchClauseListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> CatchClauseListSyntax {
    return CatchClauseListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `CatchClauseListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> CatchClauseListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `CatchClauseListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> CatchClauseListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `CatchClauseListSyntax` with all trivia removed.
  public func withoutTrivia() -> CatchClauseListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `CatchClauseListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `CatchClauseListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(CatchClauseSyntax.self)
    })
  }
}

/// Conformance for `CatchClauseListSyntax` to the `BidirectionalCollection` protocol.
extension CatchClauseListSyntax: BidirectionalCollection {
  public typealias Element = CatchClauseSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> CatchClauseSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return CatchClauseSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> CatchClauseSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return CatchClauseSyntax(data)
  }
}

/// `CaseItemListSyntax` represents a collection of one or more
/// `CaseItemSyntax` nodes. CaseItemListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct CaseItemListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CaseItemListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .caseItemList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .caseItemList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `CaseItemListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `CaseItemListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> CaseItemListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return CaseItemListSyntax(newData)
  }

  /// Creates a new `CaseItemListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `CaseItemListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: CaseItemSyntax) -> CaseItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CaseItemListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `CaseItemListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: CaseItemSyntax) -> CaseItemListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `CaseItemListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `CaseItemListSyntax` with that element appended to the end.
  public func inserting(_ syntax: CaseItemSyntax,
                        at index: Int) -> CaseItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CaseItemListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `CaseItemListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: CaseItemSyntax) -> CaseItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `CaseItemListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `CaseItemListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> CaseItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CaseItemListSyntax` by removing the first element.
  ///
  /// - Returns: A new `CaseItemListSyntax` with the first element removed.
  public func removingFirst() -> CaseItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `CaseItemListSyntax` by removing the last element.
  ///
  /// - Returns: A new `CaseItemListSyntax` with the last element removed.
  public func removingLast() -> CaseItemListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `CaseItemListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> CaseItemListSyntax {
    return CaseItemListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `CaseItemListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> CaseItemListSyntax {
    return CaseItemListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `CaseItemListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> CaseItemListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `CaseItemListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> CaseItemListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `CaseItemListSyntax` with all trivia removed.
  public func withoutTrivia() -> CaseItemListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `CaseItemListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `CaseItemListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(CaseItemSyntax.self)
    })
  }
}

/// Conformance for `CaseItemListSyntax` to the `BidirectionalCollection` protocol.
extension CaseItemListSyntax: BidirectionalCollection {
  public typealias Element = CaseItemSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> CaseItemSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return CaseItemSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> CaseItemSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return CaseItemSyntax(data)
  }
}

/// `ConditionElementListSyntax` represents a collection of one or more
/// `ConditionElementSyntax` nodes. ConditionElementListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct ConditionElementListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `ConditionElementListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .conditionElementList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .conditionElementList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `ConditionElementListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `ConditionElementListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> ConditionElementListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return ConditionElementListSyntax(newData)
  }

  /// Creates a new `ConditionElementListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `ConditionElementListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: ConditionElementSyntax) -> ConditionElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ConditionElementListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `ConditionElementListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: ConditionElementSyntax) -> ConditionElementListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `ConditionElementListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `ConditionElementListSyntax` with that element appended to the end.
  public func inserting(_ syntax: ConditionElementSyntax,
                        at index: Int) -> ConditionElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ConditionElementListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `ConditionElementListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: ConditionElementSyntax) -> ConditionElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `ConditionElementListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `ConditionElementListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> ConditionElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `ConditionElementListSyntax` by removing the first element.
  ///
  /// - Returns: A new `ConditionElementListSyntax` with the first element removed.
  public func removingFirst() -> ConditionElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `ConditionElementListSyntax` by removing the last element.
  ///
  /// - Returns: A new `ConditionElementListSyntax` with the last element removed.
  public func removingLast() -> ConditionElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `ConditionElementListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> ConditionElementListSyntax {
    return ConditionElementListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `ConditionElementListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> ConditionElementListSyntax {
    return ConditionElementListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `ConditionElementListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> ConditionElementListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `ConditionElementListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> ConditionElementListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `ConditionElementListSyntax` with all trivia removed.
  public func withoutTrivia() -> ConditionElementListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `ConditionElementListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `ConditionElementListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(ConditionElementSyntax.self)
    })
  }
}

/// Conformance for `ConditionElementListSyntax` to the `BidirectionalCollection` protocol.
extension ConditionElementListSyntax: BidirectionalCollection {
  public typealias Element = ConditionElementSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> ConditionElementSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return ConditionElementSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> ConditionElementSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return ConditionElementSyntax(data)
  }
}

/// `GenericRequirementListSyntax` represents a collection of one or more
/// `GenericRequirementSyntax` nodes. GenericRequirementListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct GenericRequirementListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericRequirementListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericRequirementList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericRequirementList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `GenericRequirementListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `GenericRequirementListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> GenericRequirementListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return GenericRequirementListSyntax(newData)
  }

  /// Creates a new `GenericRequirementListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `GenericRequirementListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: GenericRequirementSyntax) -> GenericRequirementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericRequirementListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `GenericRequirementListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: GenericRequirementSyntax) -> GenericRequirementListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `GenericRequirementListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `GenericRequirementListSyntax` with that element appended to the end.
  public func inserting(_ syntax: GenericRequirementSyntax,
                        at index: Int) -> GenericRequirementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericRequirementListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `GenericRequirementListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: GenericRequirementSyntax) -> GenericRequirementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericRequirementListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `GenericRequirementListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> GenericRequirementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericRequirementListSyntax` by removing the first element.
  ///
  /// - Returns: A new `GenericRequirementListSyntax` with the first element removed.
  public func removingFirst() -> GenericRequirementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericRequirementListSyntax` by removing the last element.
  ///
  /// - Returns: A new `GenericRequirementListSyntax` with the last element removed.
  public func removingLast() -> GenericRequirementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `GenericRequirementListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> GenericRequirementListSyntax {
    return GenericRequirementListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `GenericRequirementListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> GenericRequirementListSyntax {
    return GenericRequirementListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `GenericRequirementListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> GenericRequirementListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `GenericRequirementListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> GenericRequirementListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `GenericRequirementListSyntax` with all trivia removed.
  public func withoutTrivia() -> GenericRequirementListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `GenericRequirementListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `GenericRequirementListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(GenericRequirementSyntax.self)
    })
  }
}

/// Conformance for `GenericRequirementListSyntax` to the `BidirectionalCollection` protocol.
extension GenericRequirementListSyntax: BidirectionalCollection {
  public typealias Element = GenericRequirementSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> GenericRequirementSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return GenericRequirementSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> GenericRequirementSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return GenericRequirementSyntax(data)
  }
}

/// `GenericParameterListSyntax` represents a collection of one or more
/// `GenericParameterSyntax` nodes. GenericParameterListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct GenericParameterListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericParameterListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericParameterList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericParameterList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `GenericParameterListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `GenericParameterListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> GenericParameterListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return GenericParameterListSyntax(newData)
  }

  /// Creates a new `GenericParameterListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `GenericParameterListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: GenericParameterSyntax) -> GenericParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericParameterListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `GenericParameterListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: GenericParameterSyntax) -> GenericParameterListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `GenericParameterListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `GenericParameterListSyntax` with that element appended to the end.
  public func inserting(_ syntax: GenericParameterSyntax,
                        at index: Int) -> GenericParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericParameterListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `GenericParameterListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: GenericParameterSyntax) -> GenericParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericParameterListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `GenericParameterListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> GenericParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericParameterListSyntax` by removing the first element.
  ///
  /// - Returns: A new `GenericParameterListSyntax` with the first element removed.
  public func removingFirst() -> GenericParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericParameterListSyntax` by removing the last element.
  ///
  /// - Returns: A new `GenericParameterListSyntax` with the last element removed.
  public func removingLast() -> GenericParameterListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `GenericParameterListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> GenericParameterListSyntax {
    return GenericParameterListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `GenericParameterListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> GenericParameterListSyntax {
    return GenericParameterListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `GenericParameterListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> GenericParameterListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `GenericParameterListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> GenericParameterListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `GenericParameterListSyntax` with all trivia removed.
  public func withoutTrivia() -> GenericParameterListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `GenericParameterListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `GenericParameterListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(GenericParameterSyntax.self)
    })
  }
}

/// Conformance for `GenericParameterListSyntax` to the `BidirectionalCollection` protocol.
extension GenericParameterListSyntax: BidirectionalCollection {
  public typealias Element = GenericParameterSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> GenericParameterSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return GenericParameterSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> GenericParameterSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return GenericParameterSyntax(data)
  }
}

/// `CompositionTypeElementListSyntax` represents a collection of one or more
/// `CompositionTypeElementSyntax` nodes. CompositionTypeElementListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct CompositionTypeElementListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `CompositionTypeElementListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .compositionTypeElementList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .compositionTypeElementList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `CompositionTypeElementListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `CompositionTypeElementListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> CompositionTypeElementListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return CompositionTypeElementListSyntax(newData)
  }

  /// Creates a new `CompositionTypeElementListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `CompositionTypeElementListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: CompositionTypeElementSyntax) -> CompositionTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CompositionTypeElementListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `CompositionTypeElementListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: CompositionTypeElementSyntax) -> CompositionTypeElementListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `CompositionTypeElementListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `CompositionTypeElementListSyntax` with that element appended to the end.
  public func inserting(_ syntax: CompositionTypeElementSyntax,
                        at index: Int) -> CompositionTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CompositionTypeElementListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `CompositionTypeElementListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: CompositionTypeElementSyntax) -> CompositionTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `CompositionTypeElementListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `CompositionTypeElementListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> CompositionTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `CompositionTypeElementListSyntax` by removing the first element.
  ///
  /// - Returns: A new `CompositionTypeElementListSyntax` with the first element removed.
  public func removingFirst() -> CompositionTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `CompositionTypeElementListSyntax` by removing the last element.
  ///
  /// - Returns: A new `CompositionTypeElementListSyntax` with the last element removed.
  public func removingLast() -> CompositionTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `CompositionTypeElementListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> CompositionTypeElementListSyntax {
    return CompositionTypeElementListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `CompositionTypeElementListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> CompositionTypeElementListSyntax {
    return CompositionTypeElementListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `CompositionTypeElementListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> CompositionTypeElementListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `CompositionTypeElementListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> CompositionTypeElementListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `CompositionTypeElementListSyntax` with all trivia removed.
  public func withoutTrivia() -> CompositionTypeElementListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `CompositionTypeElementListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `CompositionTypeElementListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(CompositionTypeElementSyntax.self)
    })
  }
}

/// Conformance for `CompositionTypeElementListSyntax` to the `BidirectionalCollection` protocol.
extension CompositionTypeElementListSyntax: BidirectionalCollection {
  public typealias Element = CompositionTypeElementSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> CompositionTypeElementSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return CompositionTypeElementSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> CompositionTypeElementSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return CompositionTypeElementSyntax(data)
  }
}

/// `TupleTypeElementListSyntax` represents a collection of one or more
/// `TupleTypeElementSyntax` nodes. TupleTypeElementListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct TupleTypeElementListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TupleTypeElementListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .tupleTypeElementList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tupleTypeElementList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `TupleTypeElementListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `TupleTypeElementListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> TupleTypeElementListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return TupleTypeElementListSyntax(newData)
  }

  /// Creates a new `TupleTypeElementListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `TupleTypeElementListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: TupleTypeElementSyntax) -> TupleTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TupleTypeElementListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `TupleTypeElementListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: TupleTypeElementSyntax) -> TupleTypeElementListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `TupleTypeElementListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `TupleTypeElementListSyntax` with that element appended to the end.
  public func inserting(_ syntax: TupleTypeElementSyntax,
                        at index: Int) -> TupleTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TupleTypeElementListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `TupleTypeElementListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: TupleTypeElementSyntax) -> TupleTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `TupleTypeElementListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `TupleTypeElementListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> TupleTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TupleTypeElementListSyntax` by removing the first element.
  ///
  /// - Returns: A new `TupleTypeElementListSyntax` with the first element removed.
  public func removingFirst() -> TupleTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `TupleTypeElementListSyntax` by removing the last element.
  ///
  /// - Returns: A new `TupleTypeElementListSyntax` with the last element removed.
  public func removingLast() -> TupleTypeElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `TupleTypeElementListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> TupleTypeElementListSyntax {
    return TupleTypeElementListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `TupleTypeElementListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> TupleTypeElementListSyntax {
    return TupleTypeElementListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `TupleTypeElementListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> TupleTypeElementListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `TupleTypeElementListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> TupleTypeElementListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `TupleTypeElementListSyntax` with all trivia removed.
  public func withoutTrivia() -> TupleTypeElementListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `TupleTypeElementListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `TupleTypeElementListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(TupleTypeElementSyntax.self)
    })
  }
}

/// Conformance for `TupleTypeElementListSyntax` to the `BidirectionalCollection` protocol.
extension TupleTypeElementListSyntax: BidirectionalCollection {
  public typealias Element = TupleTypeElementSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> TupleTypeElementSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return TupleTypeElementSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> TupleTypeElementSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return TupleTypeElementSyntax(data)
  }
}

/// `GenericArgumentListSyntax` represents a collection of one or more
/// `GenericArgumentSyntax` nodes. GenericArgumentListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct GenericArgumentListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `GenericArgumentListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .genericArgumentList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .genericArgumentList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `GenericArgumentListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `GenericArgumentListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> GenericArgumentListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return GenericArgumentListSyntax(newData)
  }

  /// Creates a new `GenericArgumentListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `GenericArgumentListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: GenericArgumentSyntax) -> GenericArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericArgumentListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `GenericArgumentListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: GenericArgumentSyntax) -> GenericArgumentListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `GenericArgumentListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `GenericArgumentListSyntax` with that element appended to the end.
  public func inserting(_ syntax: GenericArgumentSyntax,
                        at index: Int) -> GenericArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericArgumentListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `GenericArgumentListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: GenericArgumentSyntax) -> GenericArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericArgumentListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `GenericArgumentListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> GenericArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericArgumentListSyntax` by removing the first element.
  ///
  /// - Returns: A new `GenericArgumentListSyntax` with the first element removed.
  public func removingFirst() -> GenericArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `GenericArgumentListSyntax` by removing the last element.
  ///
  /// - Returns: A new `GenericArgumentListSyntax` with the last element removed.
  public func removingLast() -> GenericArgumentListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `GenericArgumentListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> GenericArgumentListSyntax {
    return GenericArgumentListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `GenericArgumentListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> GenericArgumentListSyntax {
    return GenericArgumentListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `GenericArgumentListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> GenericArgumentListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `GenericArgumentListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> GenericArgumentListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `GenericArgumentListSyntax` with all trivia removed.
  public func withoutTrivia() -> GenericArgumentListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `GenericArgumentListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `GenericArgumentListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(GenericArgumentSyntax.self)
    })
  }
}

/// Conformance for `GenericArgumentListSyntax` to the `BidirectionalCollection` protocol.
extension GenericArgumentListSyntax: BidirectionalCollection {
  public typealias Element = GenericArgumentSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> GenericArgumentSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return GenericArgumentSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> GenericArgumentSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return GenericArgumentSyntax(data)
  }
}

/// `TuplePatternElementListSyntax` represents a collection of one or more
/// `TuplePatternElementSyntax` nodes. TuplePatternElementListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct TuplePatternElementListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `TuplePatternElementListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .tuplePatternElementList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tuplePatternElementList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `TuplePatternElementListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `TuplePatternElementListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> TuplePatternElementListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return TuplePatternElementListSyntax(newData)
  }

  /// Creates a new `TuplePatternElementListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `TuplePatternElementListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: TuplePatternElementSyntax) -> TuplePatternElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TuplePatternElementListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `TuplePatternElementListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: TuplePatternElementSyntax) -> TuplePatternElementListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `TuplePatternElementListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `TuplePatternElementListSyntax` with that element appended to the end.
  public func inserting(_ syntax: TuplePatternElementSyntax,
                        at index: Int) -> TuplePatternElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TuplePatternElementListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `TuplePatternElementListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: TuplePatternElementSyntax) -> TuplePatternElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `TuplePatternElementListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `TuplePatternElementListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> TuplePatternElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `TuplePatternElementListSyntax` by removing the first element.
  ///
  /// - Returns: A new `TuplePatternElementListSyntax` with the first element removed.
  public func removingFirst() -> TuplePatternElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `TuplePatternElementListSyntax` by removing the last element.
  ///
  /// - Returns: A new `TuplePatternElementListSyntax` with the last element removed.
  public func removingLast() -> TuplePatternElementListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `TuplePatternElementListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> TuplePatternElementListSyntax {
    return TuplePatternElementListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `TuplePatternElementListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> TuplePatternElementListSyntax {
    return TuplePatternElementListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `TuplePatternElementListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> TuplePatternElementListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `TuplePatternElementListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> TuplePatternElementListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `TuplePatternElementListSyntax` with all trivia removed.
  public func withoutTrivia() -> TuplePatternElementListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `TuplePatternElementListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `TuplePatternElementListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(TuplePatternElementSyntax.self)
    })
  }
}

/// Conformance for `TuplePatternElementListSyntax` to the `BidirectionalCollection` protocol.
extension TuplePatternElementListSyntax: BidirectionalCollection {
  public typealias Element = TuplePatternElementSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> TuplePatternElementSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return TuplePatternElementSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> TuplePatternElementSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return TuplePatternElementSyntax(data)
  }
}

/// `AvailabilitySpecListSyntax` represents a collection of one or more
/// `AvailabilityArgumentSyntax` nodes. AvailabilitySpecListSyntax behaves
/// as a regular Swift collection, and has accessors that return new
/// versions of the collection with different children.
public struct AvailabilitySpecListSyntax: SyntaxCollection, SyntaxHashable {
  public let _syntaxNode: Syntax

  /// Converts the given `Syntax` node to a `AvailabilitySpecListSyntax` if possible. Returns 
  /// `nil` if the conversion is not possible.
  public init?(_ syntax: Syntax) {
    guard syntax.raw.kind == .availabilitySpecList else { return nil }
    self._syntaxNode = syntax
  }

  /// Creates a Syntax node from the provided root and data. This assumes 
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .availabilitySpecList)
    self._syntaxNode = Syntax(data)
  }

  /// The number of elements, `present` or `missing`, in this collection.
  public var count: Int { return raw.numberOfChildren }

  /// Creates a new `AvailabilitySpecListSyntax` by replacing the underlying layout with
  /// a different set of raw syntax nodes.
  ///
  /// - Parameter layout: The new list of raw syntax nodes underlying this
  ///                     collection.
  /// - Returns: A new `AvailabilitySpecListSyntax` with the new layout underlying it.
  internal func replacingLayout(
    _ layout: [RawSyntax?]) -> AvailabilitySpecListSyntax {
    let newRaw = data.raw.replacingLayout(layout)
    let newData = data.replacingSelf(newRaw)
    return AvailabilitySpecListSyntax(newData)
  }

  /// Creates a new `AvailabilitySpecListSyntax` by appending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to append.
  /// - Returns: A new `AvailabilitySpecListSyntax` with that element appended to the end.
  public func appending(
    _ syntax: AvailabilityArgumentSyntax) -> AvailabilitySpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.append(syntax.raw)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AvailabilitySpecListSyntax` by prepending the provided syntax element
  /// to the children.
  ///
  /// - Parameter syntax: The element to prepend.
  /// - Returns: A new `AvailabilitySpecListSyntax` with that element prepended to the
  ///            beginning.
  public func prepending(
    _ syntax: AvailabilityArgumentSyntax) -> AvailabilitySpecListSyntax {
    return inserting(syntax, at: 0)
  }

  /// Creates a new `AvailabilitySpecListSyntax` by inserting the provided syntax element
  /// at the provided index in the children.
  ///
  /// - Parameters:
  ///   - syntax: The element to insert.
  ///   - index: The index at which to insert the element in the collection.
  ///
  /// - Returns: A new `AvailabilitySpecListSyntax` with that element appended to the end.
  public func inserting(_ syntax: AvailabilityArgumentSyntax,
                        at index: Int) -> AvailabilitySpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid insertion index (0 to 1 past the end)
    precondition((newLayout.startIndex...newLayout.endIndex).contains(index),
                 "inserting node at invalid index \(index)")
    newLayout.insert(syntax.raw, at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AvailabilitySpecListSyntax` by replacing the syntax element
  /// at the provided index.
  ///
  /// - Parameters:
  ///   - index: The index at which to replace the element in the collection.
  ///   - syntax: The element to replace with.
  ///
  /// - Returns: A new `AvailabilitySpecListSyntax` with the new element at the provided index.
  public func replacing(childAt index: Int,
                        with syntax: AvailabilityArgumentSyntax) -> AvailabilitySpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    /// Make sure the index is a valid index for replacing
    precondition((newLayout.startIndex..<newLayout.endIndex).contains(index),
                 "replacing node at invalid index \(index)")
    newLayout[index] = syntax.raw
    return replacingLayout(newLayout)
  }

  /// Creates a new `AvailabilitySpecListSyntax` by removing the syntax element at the
  /// provided index.
  ///
  /// - Parameter index: The index of the element to remove from the collection.
  /// - Returns: A new `AvailabilitySpecListSyntax` with the element at the provided index
  ///            removed.
  public func removing(childAt index: Int) -> AvailabilitySpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.remove(at: index)
    return replacingLayout(newLayout)
  }

  /// Creates a new `AvailabilitySpecListSyntax` by removing the first element.
  ///
  /// - Returns: A new `AvailabilitySpecListSyntax` with the first element removed.
  public func removingFirst() -> AvailabilitySpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeFirst()
    return replacingLayout(newLayout)
  }

  /// Creates a new `AvailabilitySpecListSyntax` by removing the last element.
  ///
  /// - Returns: A new `AvailabilitySpecListSyntax` with the last element removed.
  public func removingLast() -> AvailabilitySpecListSyntax {
    var newLayout = data.raw.formLayoutArray()
    newLayout.removeLast()
    return replacingLayout(newLayout)
  }

  /// Returns a new `AvailabilitySpecListSyntax` with its leading trivia replaced
  /// by the provided trivia.
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> AvailabilitySpecListSyntax {
    return AvailabilitySpecListSyntax(data.withLeadingTrivia(leadingTrivia))
  }

  /// Returns a new `AvailabilitySpecListSyntax` with its trailing trivia replaced
  /// by the provided trivia.
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> AvailabilitySpecListSyntax {
    return AvailabilitySpecListSyntax(data.withTrailingTrivia(trailingTrivia))
  }

  /// Returns a new `AvailabilitySpecListSyntax` with its leading trivia removed.
  public func withoutLeadingTrivia() -> AvailabilitySpecListSyntax {
    return withLeadingTrivia([])
  }

  /// Returns a new `AvailabilitySpecListSyntax` with its trailing trivia removed.
  public func withoutTrailingTrivia() -> AvailabilitySpecListSyntax {
    return withTrailingTrivia([])
  }

  /// Returns a new `AvailabilitySpecListSyntax` with all trivia removed.
  public func withoutTrivia() -> AvailabilitySpecListSyntax {
    return withoutLeadingTrivia().withoutTrailingTrivia()
  }

  /// The leading trivia (spaces, newlines, etc.) associated with this `AvailabilitySpecListSyntax`.
  public var leadingTrivia: Trivia? {
    get {
      return raw.formLeadingTrivia()
    }
    set {
      self = withLeadingTrivia(newValue ?? [])
    }
  }

  /// The trailing trivia (spaces, newlines, etc.) associated with this `AvailabilitySpecListSyntax`.
  public var trailingTrivia: Trivia? {
    get {
      return raw.formTrailingTrivia()
    }
    set {
      self = withTrailingTrivia(newValue ?? [])
    }
  }

  public func _validateLayout() {
    // Check that all children match the expected element type
    assert(self.allSatisfy { node in
      return Syntax(node).is(AvailabilityArgumentSyntax.self)
    })
  }
}

/// Conformance for `AvailabilitySpecListSyntax` to the `BidirectionalCollection` protocol.
extension AvailabilitySpecListSyntax: BidirectionalCollection {
  public typealias Element = AvailabilityArgumentSyntax
  public typealias Index = SyntaxChildrenIndex

  public struct Iterator: IteratorProtocol {
    private let parent: Syntax
    private var iterator: RawSyntaxChildren.Iterator

    init(parent: Syntax, rawChildren: RawSyntaxChildren) {
      self.parent = parent
      self.iterator = rawChildren.makeIterator()
    }

    public mutating func next() -> AvailabilityArgumentSyntax? {
      guard let (raw, info) = self.iterator.next() else {
        return nil
      }
      let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
      let data = SyntaxData(absoluteRaw, parent: parent)
      return AvailabilityArgumentSyntax(data)
    }
  }

  public func makeIterator() -> Iterator {
    return Iterator(parent: Syntax(self), rawChildren: rawChildren)
  }

  private var rawChildren: RawSyntaxChildren {
    // We know children in a syntax collection cannot be missing. So we can 
    // use the low-level and faster RawSyntaxChildren collection instead of
    // PresentRawSyntaxChildren.
    return RawSyntaxChildren(self.data.absoluteRaw)
  }

  public var startIndex: SyntaxChildrenIndex {
    return rawChildren.startIndex
  }
  public var endIndex: SyntaxChildrenIndex {
    return rawChildren.endIndex
  }

  public func index(after index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(after: index)
  }

  public func index(before index: SyntaxChildrenIndex) -> SyntaxChildrenIndex {
    return rawChildren.index(before: index)
  }

  public func distance(from start: SyntaxChildrenIndex, to end: SyntaxChildrenIndex)
      -> Int {
    return rawChildren.distance(from: start, to: end)
  }

  public subscript(position: SyntaxChildrenIndex) -> AvailabilityArgumentSyntax {
    let (raw, info) = rawChildren[position]
    let absoluteRaw = AbsoluteRawSyntax(raw: raw!, info: info)
    let data = SyntaxData(absoluteRaw, parent: Syntax(self))
    return AvailabilityArgumentSyntax(data)
  }
}

extension CodeBlockItemListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension TupleExprElementListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension ArrayElementListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension DictionaryElementListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension StringLiteralSegmentsSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension DeclNameArgumentListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension ExprListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension ClosureCaptureItemListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension ClosureParamListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension ObjcNameSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension FunctionParameterListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension IfConfigClauseListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension InheritedTypeListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension MemberDeclListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension ModifierListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension AccessPathSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension AccessorListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension PatternBindingListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension EnumCaseElementListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension IdentifierListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension PrecedenceGroupAttributeListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension PrecedenceGroupNameListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension TokenListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension NonEmptyTokenListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension AttributeListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension SpecializeAttributeSpecListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension ObjCSelectorSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension DifferentiationParamListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension SwitchCaseListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension CatchClauseListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension CaseItemListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension ConditionElementListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension GenericRequirementListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension GenericParameterListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension CompositionTypeElementListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension TupleTypeElementListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension GenericArgumentListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension TuplePatternElementListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
extension AvailabilitySpecListSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: self.map{ $0 })
  }
}
