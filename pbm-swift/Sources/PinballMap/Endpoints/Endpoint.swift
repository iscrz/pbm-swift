//
//  Untitled.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

import Foundation

protocol Endpoint {
    associatedtype Response: Decodable
    var url: URL { get throws }
}

extension Endpoint {
    var baseURL: URL {
        get throws {
            guard let url = URL(string: "https://pinballmap.com/api/v1") else {
                throw URLError(.badURL)
            }
            return url
        }
    }
}
