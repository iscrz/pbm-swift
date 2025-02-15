//
//  FuzzySearch.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

// GET /api/v1/locations/autocomplete.json

import Foundation

/// https://pinballmap.com/api/v1/locations/autocomplete.json?name=%22ground%20k%22

struct Search: Endpoint {

    typealias Response = [LocationSearchResult]

    var locationName: String

    var url: URL {
        get throws {
            try baseURL
                .appending(path: "/locations/autocomplete.json")
                .appending(queryItems: [.init(name: "name", value: locationName)])
        }
    }
}
