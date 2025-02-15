//
//  Machine.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

public struct Machine: Codable, Sendable {
    public let id: Int
    public let name: String
    public let year: Int
    public let manufacturer: String
    public let opdb_id: String
}
