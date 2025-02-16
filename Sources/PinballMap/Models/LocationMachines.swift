//
//  LocationMachines.swift
//  PinballMap
//
//  Created by Isaac Ruiz on 2/15/25.
//

import Foundation

public struct LocationMachines: Codable, Hashable, Sendable {
    
    public let machines: [Machine]

    public struct Machine: Codable, Identifiable, Hashable, Sendable {
        public let id: UInt
        public let name: String
        public let year: Int
        public let manufacturer: String
        public let opdb_id: String
    }
}
