//
//  AbrigosSearchResult.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 10/03/25.
//

import SwiftData
import SwiftUI

struct AbrigoSearchResult: View {
  @Environment(\.modelContext) private var modelContext
  @Binding var searchText: String
  @Query private var abrigos: [Abrigo]

  init(searchText: Binding<String>) {
    _searchText = searchText
    if searchText.wrappedValue.isEmpty {
      _abrigos = Query(sort: \.creationDate)
    } else {
      let term = searchText.wrappedValue
      _abrigos = Query(filter: #Predicate { abrigos in
          abrigos.nome.contains(term)
        }, sort: \.nome)
    }
  }

  var body: some View {
    List {
      ForEach(abrigos) { abrigo in
        AbrigoDetail(abrigo: abrigo)
          .padding([.trailing, .leading], 10)
      }
      .onDelete(perform: deleteAbrigo)
    }
    .overlay {
      if abrigos.isEmpty {
        ContentUnavailableView {
          Label("No animals in this category", systemImage: "pawprint")
        } description: {
          Text("Novos abrigos aparecem aqui")
        }
      }
    }
  }

  private func deleteAbrigo(at indexSet: IndexSet) {
    for index in indexSet {
      let abrigo = abrigos[index]
      modelContext.delete(abrigo)
    }
  }
}
