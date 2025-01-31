//===--- DiagnosticMessage.swift ------------------------------------------===//
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


/// An identifier that identifies a diagnostic message's type.
/// Fundamentally different diagnostics should have a different `diagnosticID`
/// so that clients may filter/prioritise/highlight/... certain diagnostics.
/// Two diagnostics with the same ID don’t need to necessarily have the exact
/// same wording. Eg. it’s possible that the message contains more context when
/// available.
public struct DiagnosticMessageID: Hashable {
  private let value: String

  public init(_ value: String) {
    self.value = value
  }
}

/// Types conforming to this protocol represent diagnostic messages that can be
/// shown to the client.
public protocol DiagnosticMessage {
  /// The diagnostic message that should be displayed in the client.
  var message: String { get }

  /// See ``DiagnosticMessageID``.
  var diagnosticID: DiagnosticMessageID { get }
}

/// A diagnostic how's ID is determined by the diagnostic's type.
public protocol TypedDiagnosticMessage: DiagnosticMessage {
  var diagnosticID: DiagnosticMessageID { get }
}

public extension TypedDiagnosticMessage {
  static var diagnosticID: DiagnosticMessageID {
    return DiagnosticMessageID("\(self)")
  }

  var diagnosticID: DiagnosticMessageID {
    return Self.diagnosticID
  }
}
