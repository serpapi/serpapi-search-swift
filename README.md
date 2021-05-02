# serpapi-search-swift

This swift 5 package is meant to scrape and parse search resutls from Google, Bing, Baidu, Yandex, Yahoo, Home depot, Ebay and more.. using [SerpApi](https://serpapi.com). 
The package allows seamless integration of [SerpApi](https://serpapi.com) in ios, macOS ...

### Requirements
  - Swift 5
  - MacOS / IO
  - Cocapod for dependency management

Test platform macOS big sur only.

### Status

Early development phase as of May 2021.

### Developer note
Swift 5 JSON parse is limited to static object.
We took a approach to compose a set of struct to map all various search result provided by SerpApi. However, the SerpApi service results evolve quickly as the search engine are updated on weekly basis. Mapping a dynamic JSON data structure to a static one is a challenging problem.
Not all the field you're looking for might be present.
We do some testing but it's difficult to cover the entire space in a new product like this.
We invest our resource based on customer usage and request. So, feel free to file a bug if something is broken or missing.

In the future we will provide hook so you can create your own decodable SearchResult object. 

To keep thing simple, the SearchResult is Codable. So you'll have more flexibility to resuable the object in another context.
