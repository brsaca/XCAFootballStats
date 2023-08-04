//
//  StandingsTableObservable.swift
//  XCAFootballStats
//
//  Created by Brenda Saavedra Cantu on 30/06/23.
//

import Foundation
import Observation
import XCAFootballDataClient

@Observable
class StandingsTableObservable {
    
    let client = FootballDataClient(apiKey: apiKey)
    
    var fetchPhase = FetchPhase<[TeamStandingTable]>.initial
    var standings: [TeamStandingTable]? { fetchPhase.value }
    
    var selectedFilter = FilterOption.latest
    var filterOptions: [FilterOption] = {
        var date = Calendar.current.date(byAdding: .year, value: -4, to: Date())!
        var options = [FilterOption]()
        for ii in 0..<3 {
            if let nextYear = Calendar.current.date(byAdding: .year, value: 1, to: date) {
                options.append(.year(Calendar.current.component(.year, from: nextYear)))
                date = nextYear
            }
        }
        options.append(.latest)
        return options
    }()
    
    func fetchStandings(competition: Competition) async {
        fetchPhase = .fetching
        do {
            let standings = try await client.fetchStandings(competitionId: competition.id, filterOption: selectedFilter)
            if Task.isCancelled { return }
            fetchPhase = .success(standings)
        } catch {
            if Task.isCancelled { return }
            fetchPhase = .failure(error)
        }
    }
}

extension TeamStandingTable {
    
    static var stubs: [TeamStandingTable] {
        let url = Bundle.main.url(forResource: "standings", withExtension: "json")!
        let standingResponse: StandingResponse = Utilities.loadStub(url: url)
        return standingResponse.standings!.first { $0.type == "TOTAL" }!.table
    }
}
