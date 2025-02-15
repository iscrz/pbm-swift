//
//  LocationMachines.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

import Foundation

struct LocationMachinesAPI: Endpoint {

    typealias Response = LocationMachines

    var locationID: UInt

    var url: URL {
        get throws {
            guard let url = URL(string: "/locations/\(locationID)/machine_details.json", relativeTo: baseURL) else {
                throw URLError(.badURL)
            }
            return url
        }
    }
}
