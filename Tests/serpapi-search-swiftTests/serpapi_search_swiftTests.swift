import XCTest
@testable import serpapi_search_swift

final class serpapi_search_swiftTests: XCTestCase {
//  func testExample() {
//    XCTAssertEqual(BingSearch().search(), ["ok"])
//  }
//
  func testSearchApSearch() {
    let expectation = self.expectation(description: "search completed")
    var query = [String:String]()
    query["q"] = "coffee"
    //  "location": "Austin, Texas"
    
    let search = SerpApiSearch.init(engine: "google", parameter: query, api_key: "7f15b42770fa78f3de7776bfbfbee641a6cb1d33564668e12005917c56886f34")
    search.execute { result in
      switch result {
      case .failure(let error):
        XCTAssertNotNil(error)

        switch error {
        case SerpApiError.DecodingError:
          XCTFail("decoding error")
        case SerpApiError.InvalidJson:
          XCTFail("invalid JSON")
        case SerpApiError.ServiceDown:
          XCTFail("service is down")
        default:
          XCTFail("unexpected error")
        }
        
        expectation.fulfill()
      case .success(let searchResult):
        XCTAssertNotNil(searchResult)
        expectation.fulfill()
      }
    }
    
    wait(for: [expectation], timeout: 30)
  }
  
  static var allTests = [
    ("testSearchApSearch", testSearchApSearch),
  ]
}
