//
//  StandingsTableView.swift
//  XCAFootballStats
//
//  Created by Brenda Saavedra Cantu on 30/06/23.
//

import SwiftUI
import XCAFootballDataClient

struct StandingsTableView: View {
    
    let competition: Competition
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle(competition.name)
    }
}

#Preview {
    NavigationStack {
        StandingsTableView(competition: .defaultCompetitions[1])
    }
}
