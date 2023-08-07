//
//  StandingsTabItemView.swift
//  XCAFootballStats
//
//  Created by Brenda Saavedra Cantu on 07/08/23.
//

import SwiftUI
import XCAFootballDataClient

struct StandingsTabItemView: View {
    
    @State var selectedCompetition: Competition?
    
    var body: some View {
        NavigationSplitView {
            List(Competition.defaultCompetitions, id: \.self, selection: $selectedCompetition) {
                Text($0.name)
            }.navigationBarTitle("XCA ⚽️ Standings")
        } detail: {
            if let selectedCompetition {
                StandingsTableView(competition: selectedCompetition).id(selectedCompetition)
            } else {
                Text("Select a competition")
            }
        }
    }
}

#Preview {
    StandingsTabItemView()
}
