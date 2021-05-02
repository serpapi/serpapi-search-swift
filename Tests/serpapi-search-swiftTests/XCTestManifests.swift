import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(serpapi_search_swiftTests.allTests),
    ]
}
#endif
