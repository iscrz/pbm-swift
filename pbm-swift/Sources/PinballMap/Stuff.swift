//
//  Stuff.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

// MARK: - Pinball Map

import Foundation

///// https://pinballmap.com/api/v1/docs/1.0/locations/machine_details.html
//func getLocationMachines(pinballMapID: String) async throws -> LocationMachines {
//    try await request(url: "https://pinballmap.com/api/v1/locations/\(pinballMapID)/machine_details.json")
//}

// MARK: URL Request
func request<T: Decodable>(url: URL) async throws -> T {

    let (data, _) = try await URLSession.shared.data(from: url)

    let posts = try JSONDecoder().decode(T.self, from: data)
    return posts
}
