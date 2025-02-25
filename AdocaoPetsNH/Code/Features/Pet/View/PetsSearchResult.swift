//
//  PetSearchResult.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 19/02/25.
//

import SwiftData
import SwiftUI

struct PetsSearchResult: View {
  @Binding var searchText: String
  @Query private var pets: [Pet]

  init(searchText: Binding<String>) {
    _searchText = searchText
    if searchText.wrappedValue.isEmpty {
      _pets = Query(sort: \.creationDate)
    } else {
      let term = searchText.wrappedValue
      _pets = Query(
        filter: #Predicate { pets in
          pets.nome.contains(term)
        }, sort: \.nome)
    }
  }

  var body: some View {
    ForEach(pets) { pet in
      PetGridItem(pet: pet)
    }
  }
}
