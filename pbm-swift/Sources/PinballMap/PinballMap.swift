// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

struct PinballMap {

    static let baseURL = URL(string: "https://pinballmap.com/api/v1/")

//    static func getLocationMachines(locationID: String) async throws -> LocationMachines {
//        Endpoint.locationMachineDetails(locationID)
//        try await request(url: "https://pinballmap.com/api/v1/locations/\(pinballMapID)/machine_details.json")
//    }

    static func get<T: PinballMapEndpoint>(endpoint: T) async throws -> T.Response {
        let path = try endpoint.path

        let url = baseURL!.appending(path: path.absoluteString)

        let (data, _) = try await URLSession.shared.data(from: url)

        let posts = try JSONDecoder().decode(T.Response.self, from: data)
        return posts
    }
}

enum Endpoints {
    static func locationDetails(_ location: String) -> some PinballMapEndpoint {
        LocationMachinesAPI(locationID: location)
    }
}

enum Endpoint2 {

    case locationMachineDetails(String)

    var path: URL {
        get throws {
            switch self {
            case let .locationMachineDetails(locationID):
                guard let url = URL(string:"locations/\(locationID)/machine_details.json") else {
                    throw URLError(.badURL)
                }
                return url
            }
        }
    }
}

struct LocationMachinesAPI: PinballMapEndpoint {

    typealias Response = LocationMachines

    var locationID: String

    var path: URL {
        get throws {
            guard let url = URL(string:"locations/\(locationID)/machine_details.json") else {
                throw URLError(.badURL)
            }
            return url
        }
    }
}

protocol PinballMapEndpoint {
    associatedtype Response: Decodable
    var path: URL { get throws }
}


extension PinballMapEndpoint {
    static func location(string: String) -> some PinballMapEndpoint {
        LocationMachinesAPI(locationID: string)
    }
}
