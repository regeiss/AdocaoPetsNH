//
//  PetViewPort.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 22/02/25.
//

import SwiftUI

struct PetFundoLista: View {
  var pet: Pet

  var body: some View {
    GeometryReader { geometry in
      RoundedRectangle(cornerRadius: 25)
        .fill(.gray)
        .frame(width: geometry.size.width, height: geometry.size.height)
    }
  }
}
