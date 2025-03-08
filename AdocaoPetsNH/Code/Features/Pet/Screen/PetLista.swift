//
//  PetLista.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 27/02/25.
//

import SwiftData
import SwiftUI

struct PetLista: View {
  @State private var searchText = ""
  var pet: Pet

  var body: some View {
    LazyVGrid(columns: [.init(.adaptive(minimum: 300))], spacing: 10) {
      PetsSearchResult(searchText: $searchText)
    }
  }

}
