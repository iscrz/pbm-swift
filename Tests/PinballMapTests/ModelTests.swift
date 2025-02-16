//
//  Test.swift
//  pbm-swift
//
//  Created by Isaac Ruiz on 2/16/25.
//

import Foundation
import Testing
@testable import PinballMap

@Suite("ModelTests")
struct ModelTests {

    @Test("Location Machines")
    func testLocationMachines() async throws {
        let json = """
        [{"label":"Ground Kontrol Classic Arcade (Portland, OR)","value":"Ground Kontrol Classic Arcade","id":874}]
        """

        let searchResults = try JSONDecoder().decode([LocationSearchResult].self, from: Data(json.utf8))
        let result = try #require(searchResults.first)
        #expect(result.label == "Ground Kontrol Classic Arcade (Portland, OR)")
        #expect(result.value == "Ground Kontrol Classic Arcade")
        #expect(result.id == 874)
    }

    @Test("asdf")
    func asdf() async throws {
        let json = """
        {"machines":[{"id":3416,"name":"Godzilla (Premium)","year":2021,"manufacturer":"Stern","ipdb_link":"https://www.ipdb.org/machine.cgi?id=6842","ipdb_id":6842,"kineticist_url":"https://www.kineticist.com/pinball-machines/godzilla-2021","opdb_id":"GweeP-Ml9pZ-ARZoY"},{"id":3280,"name":"Led Zeppelin (Premium)","year":2020,"manufacturer":"Stern","ipdb_link":"https://www.ipdb.org/machine.cgi?id=6761","ipdb_id":6761,"kineticist_url":"https://www.kineticist.com/pinball-machines/led-zeppelin-2020","opdb_id":"Gweel-ME0pP-ARqVK"},{"id":3227,"name":"Stranger Things (Premium)","year":2019,"manufacturer":"Stern","ipdb_link":"https://www.ipdb.org/machine.cgi?id=6643","ipdb_id":6643,"kineticist_url":"https://www.kineticist.com/pinball-machines/stranger-things-2019","opdb_id":"Gzy89-M0oPy-A1zrL"}]}
        """

        let location = try JSONDecoder().decode(LocationMachines.self, from: Data(json.utf8))
        #expect(location.machines.count == 3)
    }

    @Test("Machine")
    func machine() async throws {
        let json = """
        {"id":3416,"name":"Godzilla (Premium)","year":2021,"manufacturer":"Stern","ipdb_link":"https://www.ipdb.org/machine.cgi?id=6842","ipdb_id":6842,"kineticist_url":"https://www.kineticist.com/pinball-machines/godzilla-2021","opdb_id":"GweeP-Ml9pZ-ARZoY"}
        """
        let machine = try JSONDecoder().decode(LocationMachines.Machine.self, from: Data(json.utf8))

        #expect(machine.name == "Godzilla (Premium)")
        #expect(machine.id == 3416)
        #expect(machine.year == 2021)
        #expect(machine.manufacturer == "Stern")
        #expect(machine.opdb_id == "GweeP-Ml9pZ-ARZoY")
    }
}
