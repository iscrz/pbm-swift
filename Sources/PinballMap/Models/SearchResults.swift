//
//  SearchResults.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/15/25.
//

//[{"label":"Ground Kontrol Classic Arcade (Portland, OR)","value":"Ground Kontrol Classic Arcade","id":874}]

public struct LocationSearchResult: Codable, Sendable {
    public let label: String
    public let value: String
    public let id: UInt
}
