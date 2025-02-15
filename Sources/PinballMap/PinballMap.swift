//
//  PinballMap.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

import Foundation

public enum PinballMap {

    public static func requestMachines(at locationID: UInt) async throws -> [Machine] {
        let endpoint = LocationMachines(locationID: locationID)
        let locationMachines = try await request(endpoint: endpoint)
        return locationMachines.machines
    }

    public static func search(location name: String) async throws -> [LocationSearchResult] {
        let endpoint = Search(locationName: name)
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

