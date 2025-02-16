//
//  Untitled.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

import Foundation

public struct Endpoint<T: Codable> {

    let url: URL

    init(urlBuilder: (URL) -> URL) throws {

        guard let url = URL(string: "https://pinballmap.com/api/v1") else {
            throw URLError(.badURL)
        }
        
        self.url = urlBuilder(url)
    }
}

extension Endpoint {

    public static func locationMachines(id: UInt) throws -> Endpoint<LocationMachineDetails> {
        try Endpoint<LocationMachineDetails> { url in
            url.appending(path: "/locations/\(id)/machine_details.json")
        }
    }

    public static func search(query: String) throws -> Endpoint<LocationSearchResult> {
        try Endpoint<LocationSearchResult> { url in
            url
                .appending(path: "/locations/autocomplete.json")
                .appending(queryItems: [.init(name: "name", value: query)])
        }
    }
}
