//
//  PetDetailView.swift
//  ProjetoCusco
//
//  Created by Roberto Edgar Geiss on 23/08/24.
//

import SwiftData
import SwiftUI

struct PetDetail: View {
  @Environment(\.dismiss) var dismiss
  @Bindable var pet: Pet
  @Query(sort: \Raca.nome) private var racas: [Raca]
  @Query(sort: \Porte.nome) private var portes: [Porte]
  @Query(sort: \Cor.nome) private var cores: [Cor]

  @State private var selectedRaca: Raca?
  @State private var selectedPorte: Porte?
  @State private var selectedCor: Cor?
  
  init(pet: Pet, isNovo: Bool) {
    self.pet = pet
  }

  var body: some View {
    Form {
      Image(systemName: "photo")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding()
      TextField("Nome", text: $pet.nome)
        .autocorrectionDisabled()
      DatePicker("Data", selection: $pet.creationDate, displayedComponents: .date)
      Toggle("Favorito", isOn: $pet.isFavorite)
      Picker("Raça", selection: $selectedRaca) {
        Text("Selecione a raça").tag(nil as Raca?)
        ForEach(racas) { raca in
          Text(raca.nome).tag(raca as Raca?)
        }
      }
      Picker("Cor", selection: $selectedCor) {
        Text("Selecione a cor").tag(nil as Cor?)
        ForEach(cores) { cor in
          Text(cor.nome).tag(cor as Cor?)
        }
      }
      Picker("Tamanho", selection: $selectedPorte) {
        Text("Selecione o tamanho").tag(nil as Porte?)
        ForEach(portes) { porte in
          Text(porte.nome).tag(porte as Porte?)
        }
      }
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
