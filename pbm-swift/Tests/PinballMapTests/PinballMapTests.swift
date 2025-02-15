import Testing
@testable import PinballMap

@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.

    //print(try await PinballMap.requestMachines(at: 10003))

    print(try await PinballMap.search(location: "ground k"))

}
