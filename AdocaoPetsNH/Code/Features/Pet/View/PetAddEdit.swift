//
//  PetDetailView.swift
//  ProjetoCusco
//
//  Created by Roberto Edgar Geiss on 23/08/24.
//

import SwiftData
import SwiftUI

struct PetAddEdit: View {
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) private var modelContext

  @Query(sort: \Raca.nome) private var racas: [Raca]
  @Query(sort: \Porte.nome) private var portes: [Porte]
  @Query(sort: \Cor.nome) private var cores: [Cor]

  let pet: Pet?
  @State private var nome: String = ""
  @State private var creationDate: Date = Date()
  @State private var isFavorite: Bool = false
  @State private var selectedRaca: Raca?
  @State private var selectedPorte: Porte?
  @State private var selectedCor: Cor?

  private var editorTitle: String {
    pet == nil ? "Adidionar pet" : "Editar pet"
  }

  var body: some View {
    Form {
      Image(systemName: "photo")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()

      TextField("Nome", text: $nome)
        .autocorrectionDisabled()

      DatePicker("Data", selection: $creationDate, displayedComponents: .date)

      Toggle("Favorito", isOn: $isFavorite)

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
    .onAppear {
      if let pet {
        nome = pet.nome
        creationDate = pet.creationDate
        isFavorite = pet.isFavorite
        selectedRaca = pet.raca
        selectedPorte = pet.porte
        selectedCor = pet.cor
      }
    }
    .navigationTitle("Pet detalhe")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .principal) {
        Text(editorTitle)
      }

      ToolbarItem(placement: .confirmationAction) {
        Button("Salvar") {
          withAnimation {
            save()
            dismiss()
          }
        }
      }

      ToolbarItem(placement: .cancellationAction) {
        Button("Cancelar", role: .cancel) {
          dismiss()
        }
      }
    }
    .frame(maxWidth: .infinity, alignment: .trailing)
  }

  private func save() {
    if let pet {
      // Edit the pet.
      pet.nome = nome
      pet.creationDate = creationDate
      pet.isFavorite = isFavorite
      pet.cor = selectedCor
      pet.raca = selectedRaca
      pet.porte = selectedPorte

    } else {
      // Add an pet.
      let novoPet = Pet(
        id: UUID().uuidString, nome: nome, ativo: true, isFavorite: isFavorite, creationDate: creationDate)
      novoPet.cor = selectedCor
      novoPet.raca = selectedRaca
      novoPet.porte = selectedPorte

      modelContext.insert(novoPet)
    }
  }
}
