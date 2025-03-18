//
//  AbrigoLista.swift
//  AdocaoAbrigosNH
//
//  Created by Roberto Edgar Geiss on 10/03/25.
//

import SwiftData
import SwiftUI

struct AbrigoLista: View {
  @Environment(\.modelContext) var context
  @Query private var abrigos: [Abrigo]
  @State private var isEditorPresented = false
  @State private var searchText = ""
  @State private var novoAbrigo: Abrigo?

  var body: some View {
    ScrollView {
      LazyVGrid(columns: [.init(.adaptive(minimum: 300))], spacing: 10) {
        AbrigoSearchResult(searchText: $searchText)
      }
      .sheet(isPresented: $isEditorPresented) {
        AbrigoDetail(abrigo: nil)
      }
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          AddAbrigoButton(isActive: $isEditorPresented)
        }
      }
    }
    .overlay {
      if abrigos.isEmpty {
        ContentUnavailableView {
          Label("Não há abrigos cadastrados", systemImage: "house")
        } description: {
          AddAbrigoButton(isActive: $isEditorPresented)
        }
      }
    }
    .searchSuggestions {
      if searchText.isEmpty {
        AbrigosSearchSuggestions()
      }
    }
  }
}

private struct AddAbrigoButton: View {
  @Binding var isActive: Bool

  var body: some View {
    Button {
      isActive = true
    } label: {
      Label("Adicione um abrigo", systemImage: "plus")
        .help("Adicione um abrigo")
    }
  }
}

struct NewAbrigoIndicatorCard: View {
  var body: some View {
    Text("")
  }
}

struct AbrigosSearchSuggestions: View {
  @Query private var pets: [Abrigo]

  var body: some View {
    Text("")
  }
}
