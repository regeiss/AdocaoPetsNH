//
//  PetNavigationStack.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 27/02/25.
//

import SwiftData
import SwiftUI

struct PetNavigationStack: View {
  @Query(sort: \Pet.creationDate)
  private var pets: [Pet]

  var body: some View {
    NavigationStack {
      PetLista()
        .navigationTitle("Pets ")
        .navigationDestination(for: Pet.ID.self) { petID in
          if let pet = pets.first(where: { $0.id == petID }) {
            PetAddEdit(pet: pet)
          }
        }
    }
  }
}
