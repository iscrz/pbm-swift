//
//  PinballMap.swift
//  PinballMap
//
//  Created by Isaac Ruiz on 2/15/25.
//

import Foundation

public enum PinballMap {

    static var baseURL: URL {
        get throws {
            guard let url = URL(string: "https://pinballmap.com/api/v1") else {
                throw URLError(.badURL)
            }
            return url
        }
    }

    public static func request<T: Decodable>(_ endpoint: Endpoint<T>) async throws -> T {
        let url = endpoint.url
        let (data, _) = try await URLSession.shared.data(from: url)
        let posts = try JSONDecoder().decode(T.self, from: data)
        return posts
    }
}
