//
//  AbrigoDetail.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 10/03/25.
//

import SwiftUI

struct AbrigoDetail: View {
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) private var modelContext

  let abrigo: Abrigo?
  private var editorTitle: String {
    abrigo == nil ? "Novo Abrigo" : "Editar Abrigo"
  }
  @State private var nome: String = ""
  @State private var creationDate: Date = Date()
  @State private var ativo: Bool = false

  var body: some View {
    Form {
      TextField("Nome", text: $nome)
        .autocorrectionDisabled()

      DatePicker("Data", selection: $creationDate, displayedComponents: .date)

      Toggle("Ativo", isOn: $ativo)
    }
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
    .onAppear {
      if let abrigo {
        nome = abrigo.nome
        creationDate = abrigo.creationDate
        ativo = abrigo.ativo
      }
    }
  }
  private func save() {
    if let abrigo {
      // Edit the abrigo.
      abrigo.nome = nome
      abrigo.ativo = true
      abrigo.creationDate = creationDate
    } else {
      // Add an abrigo.
      let novoAbrigo = Abrigo(id: UUID().uuidString, nome: nome, ativo: true, creationDate: Date())

      modelContext.insert(novoAbrigo)
    }
  }
}
