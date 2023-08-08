//
//  XCAFootballStatsApp.swift
//  XCAFootballStats
//
//  Created by Brenda Saavedra Cantu on 30/06/23.
//

import SwiftUI

// Get free api key from https://www.football-data.org
let apiKey = "e521ce48768246a581d1eec504e04fa6"

@main
struct XCAFootballStatsApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                StandingsTabItemView()
                    .tabItem { Label("Standings", systemImage: "table.fill") }
                
                TopScorersTabItemView()
                    .tabItem { Label("Top Scorers", systemImage: "soccerball.inverse") }
            }
        }
    }
}
