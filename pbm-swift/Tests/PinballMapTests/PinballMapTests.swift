import Testing
@testable import PinballMap

@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.

    try await PinballMap.get(endpoint: .location(string: "asdf"))

}
