//
//  PetDetailView.swift
//  ProjetoCusco
//
//  Created by Roberto Edgar Geiss on 23/08/24.
//

import SwiftData
import SwiftUI

struct PetDetail: View {
  @Bindable var pet: Pet

  init(pet: Pet, isNovo: Bool) {
    self.pet = pet
  }

  var body: some View {
    Form {
      TextField("Nome", text: $pet.nome)
        .autocorrectionDisabled()
      DatePicker("Data", selection: $pet.creationDate, displayedComponents: .date)
      Toggle("Favorito", isOn: $pet.isFavorite)

      Image(systemName: "photo")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding()

    }
    .navigationTitle("Pet detalhe")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        EditButton()
      }
    }
    .frame(maxWidth: .infinity, alignment: .trailing)
  }
}
