//
//  HomeNavigationStack.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 16/02/25.
//

import SwiftData
import SwiftUI

struct HomeNavigationStack: View {
  @State private var isSettingsScreenPresented = false
  @Query(sort: \Pet.creationDate)
  private var pets: [Pet]

  private func presentSettingsScreen() {
    isSettingsScreenPresented.toggle()
  }

  var body: some View {
    NavigationStack {
      PetGrid()
        .navigationTitle("Home")
        .sheet(isPresented: $isSettingsScreenPresented) {
          AjustesScreen()
        }
        .toolbar {
          ToolbarItemGroup(placement: .confirmationAction) {
            Button(action: presentSettingsScreen) {
              Image(systemName: "gearshape")
            }
          }
        }
        .navigationDestination(for: Pet.ID.self) { petID in
          if let pet = pets.first(where: { $0.id == petID }) {
            PetDetail(pet: pet, isNovo: false)
              #if os(macOS)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
              #endif
          }
        }
    }
  }
}

#Preview {
  HomeNavigationStack()
}
