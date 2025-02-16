//
//  SearchResults.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

public struct LocationSearchResult: Codable, Identifiable, Hashable, Sendable {
    public let id: UInt
    public let label: String
    public let value: String
}
