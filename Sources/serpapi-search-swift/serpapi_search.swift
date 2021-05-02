import Combine
import Foundation

/*
 * JSON parsing example
 *
 * https://www.avanderlee.com/swift/json-parsing-decoding
 * https://app.quicktype.io
 * https://www.fivestars.blog/articles/codable-swift-dictionaries/
 */
struct serpapi_search_swift {
  var text = "init"
  
  func search() -> [String] {
    return ["a", "b", "c"]
  }
}

//class GoogleSearch: SerpApiSearch {
//  init(parameter: Hasher, api_key: String) {
//    super.init(engine: "google", parameter: parameter, api_key: api_key)
//  }
//}
//
//
//class BingSearch {
//  init(parameter: Hasher, api_key: String) {
//    super.init(engine: "google", parameter: parameter, api_key: api_key)
//  }
//
//  init(api_key: String) {
//    super.init(engine: "google", api_key: api_key)
//  }
//
//  func search() {
//
//  }
//}


class SerpApiSearch {
  var engine: String
  var parameter: Dictionary<String,String>
  var api_key: String
  var decoder: JSONDecoder
  
  init(engine: String, parameter: Dictionary<String,String>, api_key: String) {
    // initiliaze serp api
    self.engine = engine
    self.parameter = parameter
    self.api_key = api_key
    
    // initialize JSON decoder
    self.decoder = JSONDecoder()
    self.decoder.keyDecodingStrategy = .convertFromSnakeCase
  }
  
  func makeURL() -> URL {
    let url = URL(string: "https://serpapi.com/search?q=coffee&api_key=\(api_key)&engine=\(engine)")
    print(url!)
    return url!
  }
  
  func makeRequest() -> URLRequest {
    // TODO encode parameter
    var request = URLRequest(url: makeURL())
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    return request
  }
  
//  func execute(completion: @escaping(Result<SearchResult, Error>) -> Void) {
//     let task = URLSession.shared.searchResultTask(with: makeURL()) { searchResult, response, error in
//       if let searchResult = searchResult {
//        completion(.success(searchResult))
//       } else {
//        completion(.failure(SerpApiError.DecodingError))
//       }
//     }
//     task.resume()
//  }
//
  // run search query
  func execute(completion: @escaping(Result<GoogleSearchResult, Error>) -> Void) {
    let task = URLSession.shared.dataTask(with: makeRequest()) { payload, _, error in
      guard error == nil else {
        completion(.failure(SerpApiError.ServiceDown))
        return
      }
      guard let data = payload else {
        completion(.failure(SerpApiError.InvalidJson))
        return
      }

      do {
        let results = try? newJSONDecoder().decode(GoogleSearchResult.self, from: data)
        completion(.success(results))
      } catch (let e) {
        print("ERROR: Decoding JSON datastructure")
        print("ERROR: dump start")
        dump(e)
        print("ERROR: dump end")
        completion(.failure(SerpApiError.DecodingError))
      }
    }
    task.resume()
  }
}
