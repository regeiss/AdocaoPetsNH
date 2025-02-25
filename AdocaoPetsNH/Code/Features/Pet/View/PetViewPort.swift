//
//  PetViewPort.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 22/02/25.
//

import SwiftUI

struct PetViewPort: View {
  var pet: Pet

    var body: some View {
      RoundedRectangle(cornerRadius: 25)
          .fill(.green)
          .frame(width: 150, height: 100)
    }
}

// #Preview {
//    PetViewPort()
// }
