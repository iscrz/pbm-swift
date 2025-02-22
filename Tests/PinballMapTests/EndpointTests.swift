//
//  EndpointTests.swift
//  PinballMapTests
//
//  Created by Isaac Ruiz on 2/15/25.
//

import Testing
import Foundation

@testable import PinballMap

@Suite("Endpoint Tests")
struct EndpointTests {

    @Test("LocationMachines", arguments: [
        1,
        0000,
        0182381,
        10238833
    ])
    func locationMachines(_ id: UInt) async throws {
        let endpoint = try Endpoint<Int>.locationMachines(id: id)
        let expected = try #require(URL(string: "https://pinballmap.com/api/v1/locations/\(id)/machine_details.json"))
        #expect(endpoint.url.absoluteString == expected.absoluteString)
    }

    @Test("Search Location Name", arguments: [
        "Wedgehead",
        "Ground Kontrol",
        "c-bar",
        "back-space //asdf",
        "1)(*&(*&^(*&%@#$*&@P)(#&*@)_(&$)(*^098"
    ])
    func fuzzySearch(_ query: String) async throws {

        let endpoint = try Endpoint<Int>.search(locationName: query)

        var expected = try #require(URL(string: "https://pinballmap.com/api/v1/locations/autocomplete.json"))
        expected.append(queryItems: [.init(name: "name", value: query)])

        #expect(endpoint.url.absoluteString == expected.absoluteString)
    }
}

