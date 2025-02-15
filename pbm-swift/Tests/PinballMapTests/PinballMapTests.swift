import Testing
import Foundation

@testable import PinballMap

@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.

    //print(try await PinballMap.requestMachines(at: 10003))

    print(try await PinballMap.search(location: "wedgeh"))

}

@Test("Search Location Name", arguments: [
    "Wedgehead",
    "Ground Kontrol",
    "c-bar",
    "back-space //asdf",
    "1)(*&(*&^(*&%@#$*&@P)(#&*@)_(&$)(*^098"
])
func fuzzySearch(_ query: String) async throws {
    let endpoint = Search(locationName: query)
    let url = try #require(try endpoint.url)
    var encoded = try #require(URL(string: "https://pinballmap.com/api/v1/locations/autocomplete.json"))
    encoded.append(queryItems: [.init(name: "name", value: query)])
    #expect(url.absoluteString == encoded.absoluteString)
}
