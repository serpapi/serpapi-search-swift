//
//  SerpApiError captures Error type
//

import Foundation

enum SerpApiError: Error {
  case ServiceDown
  case InvalidJson
  case DecodingError
}
