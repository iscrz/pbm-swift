//
//  FuzzySearch.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

// GET /api/v1/locations/autocomplete.json

import Foundation

/// https://pinballmap.com/api/v1/locations/autocomplete.json?name=%22ground%20k%22

struct FuzzySearch: Endpoint {

    typealias Response = [LocationSearchResult]

    var locationName: String

    var url: URL {
        get throws {

            var url = URL(string: "/locations/autocomplete.json", relativeTo: baseURL)
            url?.append(queryItems: [.init(name: "name", value: locationName)])

            guard let url else {
                throw URLError(.badURL)
            }

            return url
        }
    }
}
