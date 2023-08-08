//
//  TopScorersTabItemView.swift
//  XCAFootballStats
//
//  Created by Brenda Saavedra Cantu on 08/08/23.
//

import SwiftUI
import XCAFootballDataClient

struct TopScorersTabItemView: View {
    
    @State var selectedCompetition: Competition?
    
    var body: some View {
        NavigationSplitView {
            List(Competition.defaultCompetitions, id: \.self, selection: $selectedCompetition) {
                Text($0.name)
            }.navigationBarTitle("XCA 🥇 Scorers")
        } detail: {
            if let selectedCompetition {
                TopScorersTableView(competition: selectedCompetition).id(selectedCompetition)
            } else {
                Text("Select a competition")
            }
        }    }
}

#Preview {
    TopScorersTabItemView()
}
