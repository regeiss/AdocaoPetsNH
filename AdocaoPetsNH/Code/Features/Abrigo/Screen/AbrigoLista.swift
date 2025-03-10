//
//  AbrigoLista.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 10/03/25.
//

import SwiftUI

struct AbrigoLista: View {
  @State private var searchText = ""
  var abrigos: Abrigo

  var body: some View {
    LazyVGrid(columns: [.init(.adaptive(minimum: 300))], spacing: 10) {
      PetSearchResult(searchText: $searchText)
    }
  }
}
