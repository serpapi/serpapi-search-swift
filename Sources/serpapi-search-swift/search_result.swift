// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchResult = try? newJSONDecoder().decode(SearchResult.self, from: jsonData)

import Foundation

public struct SearchResult: Decodable {
  var data: [String: Any]

  init(data: [String: Any]) {
    self.data = data
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let data = try! container.decode([String: Any].self)

    data = [:]
    for (key, value) in data {
      guard let key = key else {
        throw DecodingError.dataCorruptedError(
          in: container,
          debugDescription: "Invalid key '\(stringKey)'"
        )
      }
      dictionary[key] = value
    }
  }
}
