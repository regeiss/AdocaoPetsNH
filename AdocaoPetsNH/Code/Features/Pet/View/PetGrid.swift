//
//  PetGrid.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 23/02/25.
//

import SwiftData
import SwiftUI

struct PetGrid: View {
  @State private var searchText = ""

  var body: some View {
    ScrollView {
      if presentingNewBirdIndicatorCard {
        NewPetIndicatorCard()
      }

      LazyVGrid(columns: [.init(.adaptive(minimum: 300))]) {
        PetsSearchResult(searchText: $searchText)
      }
    }
    #if os(macOS)
      .contentMargins(10, for: .scrollContent)
    #else
      .contentMargins([.horizontal, .bottom], 10, for: .scrollContent)
    #endif
    .searchable(text: $searchText)
    .searchSuggestions {
      if searchText.isEmpty {
        PetsSearchSuggestions()
      }
    }
  }

  var presentingNewBirdIndicatorCard: Bool {
      false // DataGenerationOptions.showNewBirdIndicatorCard
  }
}

#Preview {
  PetGrid()
}

struct NewPetIndicatorCard: View {
  var  body: some View {
    Text("")
  }
}

struct PetsSearchSuggestions: View {
    @Query private var pets: [Pet]

//    var events: [BackyardVisitorEvent] {
//        Set(backyards.compactMap(\.currentVisitorEvent))
//            .sorted { ($0.backyard?.name ?? "") < ($1.backyard?.name ?? "") }
//            .sorted { ($0.bird?.speciesName ?? "") < ($1.bird?.speciesName ?? "") }
//    }

    var body: some View {
      Text("")
//        ForEach(events) { event in
//            let backyardName = event.backyard?.name ?? "- Event without a backyard. -"
//            let speciesName = event.bird?.speciesName ?? "- Species name missing. -"
//            Text("**\(speciesName)** is currently in **\(backyardName)**")
//                .searchCompletion(backyardName)
//        }
    }
}
