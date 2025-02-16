//
//  Endpoint.swift
//  PinballMap
//
//  Created by Isaac Ruiz on 2/15/25.
//

import Foundation

public struct Endpoint<T: Codable> {

    let url: URL

    init(path: String) throws {
        self.url = try PinballMap.baseURL
            .appending(path: path)
    }

    init(path: String, queryItems: URLQueryItem ...) throws {
        self.url = try PinballMap.baseURL
            .appending(path: path)
            .appending(queryItems: queryItems)
    }
}

extension Endpoint {

    /// Display the details of the machines at this location
    public static func locationMachines(id: UInt) throws -> Endpoint<LocationMachines> {
        try Endpoint<LocationMachines>(path: "/locations/\(id)/machine_details.json")
    }

    /// Send back fuzzy search results of search params
    public static func search(locationName: String) throws -> Endpoint<[LocationSearchResult]> {
        try Endpoint<[LocationSearchResult]>(
            path: "/locations/autocomplete.json",
            queryItems: .init(name: "name", value: locationName)
        )
    }
}
