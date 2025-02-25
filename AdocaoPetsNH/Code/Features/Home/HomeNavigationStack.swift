//
//  HomeNavigationStack.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 16/02/25.
//

import SwiftData
import SwiftUI

struct HomeNavigationStack: View {
  @Query(sort: \Pet.creationDate)
  private var pets: [Pet]

  var body: some View {
    NavigationStack {
      PetGrid()
        .navigationTitle("Home")
        .navigationDestination(for: Pet.ID.self) { petID in
          if let pet = pets.first(where: { $0.id == petID }) {
            PetDetailView(pet: pet)
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
