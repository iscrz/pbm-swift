// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

struct PinballMap {

    public static func requestMachines(at locationID: UInt) async throws -> [Machine] {
        let endpoint = LocationMachinesAPI(locationID: locationID)
        let locationMachines = try await request(endpoint: endpoint)
        return locationMachines.machines
    }

    public static func search(location name: String) async throws -> [LocationSearchResult] {
        let endpoint = FuzzySearch(locationName: name)
        return try await request(endpoint: endpoint)
    }
}

extension PinballMap {
    static func request<T: Endpoint>(endpoint: T) async throws -> T.Response {
        let url = try endpoint.url

        let (data, _) = try await URLSession.shared.data(from: url)

        let posts = try JSONDecoder().decode(T.Response.self, from: data)
        return posts
    }
}

