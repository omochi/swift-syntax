# Fixing Bugs

Guide to write test cases in the parser’s test suite and how to debug failures.

The general approach to fixing bugs in the parser is to first write an automated test case that reproduces the test case in isolation. This allows you to invoke the parser with minimal dependencies and allows you to set breakpoints inside of it. 

Once you’ve written a test case (see below), set a breakpoint in `Parser.parseSourceFile` and navigate the debugger to the place where the parser behaves unexpectedly. While the debugger is stopped at an instance function in <doc:SwiftParser/Parser>, `po self.currentToken` can show you the next token that will be parsed.

## Round-Trip Failure or Parser Crash

1. Add a new test case in `SwiftParserTest` that looks like the following
    ```swift
    try AssertParse({ $0.parseSourceFile() }) {
      """
      <#your code that does not round trip#>
      """
    }
    ```
2. Run the test case, read the error message to figure out which part of the source file does not round-trip
3. Optional: Reduce the test case even further by deleting more source code and calling into a specific production of the parser instead of `Parser.parseSourceFile`


## Parse of Valid Source Failed

Diagnostics are produced when the parsed syntax tree contains missing or unexpected nodes. The test case you should start with is identical to the one described in [Round-Trip Failure](#Round-Trip-Failure-or-Parser-Crash). You want to navigate the debugger to the place that incorrectly produces a missing or unexpected node.

## Parse of Valid Source Code Produced an Invalid Syntax Tree

1. Add a test case in `SwiftParserTest` that looks like the following
    ```swift
    let source = """
    <#your code that produces an invalid syntax tree#> 
    """

    let tree = withParser(source: source) {
      Syntax(raw: $0.parseSourceFile().raw)
    }
    XCTAssertHasSubstructure(
      tree,
      <#create a syntax node that you expect the tree to have#>
    )
    ```
2. Optional: Reduce the test case even further by deleting more source code and calling into a specific production of the parser instead of `Parser.parseSourceFile`
3. Run the test case and navigate the debugger to the place that produced the invalid syntax node. 

## Unhelpful Diagnostic Produced

Unhelpful diagnostics can result from two reasons:
1. The parser does a bad job at recovering from invalid source code and produces a syntax tree that does not match what the developer meant to write
2. The parser recovers reasonably well from the parse failure but complains about missing and unexpected text where a more contextual error would be more helpful.

To distinguish these cases run the following command and look at the dumped syntax tree. Use your own judgment to decide whether this models the intended meaning of the source code reasonably well.
```
swift-parser-test print-tree /path/to/file/with/bad/diagnostic
``` 

Fixing the first case where the parser does not recover according to the user’s intent is similar to [Parse of Valid Source Code Produced an Invalid Syntax Tree](#Parse-of-Valid-Source-Code-Produced-an-Invalid-Syntax-Tree). See <doc:SwiftParser/ParserRecovery> for documentation how parser recovery works and determine how to recover better from the invalid source code.

To add a new, more contextual diagnostic, perform the following steps.

1. Add a test case to `DiagnosticTests.swift` like the following:
    
    ```swift
    let source = """
    <#your code that produces a bad diagnostic#>
    }
    """
    let loop = withParser(source: source) {
      Syntax(raw: $0.parserSourceFile().raw)
    }
    ```
2. Optional: Call a more specific production than `parseSourceFile` in the test case.
3. Determine which node encompasses all information that is necessary to produce the improved diagnostic – for example `FunctionSignatureSyntax` contains all information to diagnose if the `throws` keyword was written after the `->` instead of in front of it.
4. If the diagnostic message you want to emit does not exist yet, add a case to <doc:SwiftParser/DiagnosticKind> for the new diagnostic.
5. If the function does not already exist, write a new visit method on <doc:SwiftParser/ParseDiagnosticsGenerator>.
6. In that visitation method, detect the pattern for which the improved diagnostic should be emitted and emit it using `diagnostics.append`.
7. Mark the missing or garbage nodes that are covered by the new diagnostic as handled by adding their `SyntaxIdentifier`s to `handledNodes`.
8. Assert that the new diagnostic is emitted by addding the following to your test case:
    ```swift
    XCTAssertSingleDiagnostic(in: tree, line: <#expected line#>, column: <#expected column#>, expectedKind: .<#expected diagnostic kind#>)
    ```
