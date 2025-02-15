//
//  LocationMachines.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

import Foundation

struct LocationMachines: Endpoint {

    typealias Response = LocationMachineDetails

    var locationID: UInt

    var url: URL {
        get throws {
            try baseURL.appending(path: "/locations/\(locationID)/machine_details.json")
        }
    }
}
