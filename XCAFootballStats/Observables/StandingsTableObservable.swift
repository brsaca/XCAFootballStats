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
    
    func fetchStandings(competition: Competition) async {
        fetchPhase = .fetching
        do {
            let standings = try await client.fetchStandings(competitionId: competition.id)
            if Task.isCancelled { return }
            fetchPhase = .success(standings)
        } catch {
            if Task.isCancelled { return }
            fetchPhase = .failure(error)
        }
    }
    
}
