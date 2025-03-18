//
//  AbrigoNavigationStack.swift
//  AdocaoAbrigosNH
//
//  Created by Roberto Edgar Geiss on 17/03/25.
//

import SwiftData
import SwiftUI

struct AbrigoNavigationStack: View {
  @Query(sort: \Abrigo.creationDate)
  private var abrigos: [Abrigo]

  var body: some View {
    NavigationStack {
      AbrigoLista()
        .navigationTitle("Abrigos ")
        .navigationDestination(for: Abrigo.ID.self) { abrigoID in
          if let abrigo = abrigos.first(where: { $0.id == abrigoID }) {
            AbrigoDetail(abrigo: abrigo)
          }
        }
    }
  }
}
