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
  @State private var novoPet: Pet?
  @Environment(\.modelContext) var context

  var body: some View {
    ScrollView {
      LazyVGrid(columns: [.init(.adaptive(minimum: 300))], spacing: 10) {
        PetSearchResult(searchText: $searchText)
      }
      .toolbar {
        ToolbarItem {
          Button("Add pet", systemImage: "plus", action: addPet)
        }
      }
    }
    .searchSuggestions {
      if searchText.isEmpty {
        PetsSearchSuggestions()
      }
    }
  }

  private func addPet() {
    let novoPet = Pet(id: UUID().uuidString, nome: "", ativo: true, isFavorite: false, creationDate: Date())
    context.insert(novoPet)
    self.novoPet = novoPet
  }
}

#Preview {
  PetGrid()
}

struct NewPetIndicatorCard: View {
  var body: some View {
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
