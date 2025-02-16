//
//  Endpoint.swift
//  pbm-swift
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

    public static func locationMachines(id: UInt) throws -> Endpoint<LocationMachines> {
        try Endpoint<LocationMachines>(path: "/locations/\(id)/machine_details.json")
    }

    public static func search(locationName: String) throws -> Endpoint<[LocationSearchResult]> {
        try Endpoint<[LocationSearchResult]>(
            path: "/locations/autocomplete.json",
            queryItems: .init(name: "name", value: locationName)
        )
    }
}
