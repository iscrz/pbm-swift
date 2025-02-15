//
//  Machine.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

public struct Machine: Codable, Identifiable, Sendable {
    public let id: UInt
    public let name: String
    public let year: Int
    public let manufacturer: String
    public let opdb_id: String
}
