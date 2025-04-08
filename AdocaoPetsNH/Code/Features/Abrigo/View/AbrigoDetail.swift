//
//  AbrigoDetail.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 10/03/25.
//

import Foundation
import OSLog
import SwiftData
import SwiftUI

private let logger = Logger(subsystem: "PetsData", category: "Abrigo cadastro")

struct AbrigoDetail: View {
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) private var modelContext

  let abrigo: Abrigo?
  private var editorTitle: String {
    abrigo == nil ? "Novo abrigo" : "Editar abrigo"
  }
  @State private var nome: String = ""
  @State private var creationDate: Date = Date()
  @State private var ativo: Bool = false

  var body: some View {
    // NavigationStack {
    Form {
      TextField("Nome", text: $nome)
        .autocorrectionDisabled()

      DatePicker("Data", selection: $creationDate, displayedComponents: .date)

      Toggle("Ativo", isOn: $ativo)
    }
    .onAppear {
      if let abrigo {
        nome = abrigo.nome
        creationDate = abrigo.creationDate
        ativo = abrigo.ativo
      }
    }

    .navigationTitle("Abrigo detalhe")
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
    if let abrigo {
      // Edit the abrigo.
      abrigo.nome = nome
      abrigo.ativo = true
      abrigo.creationDate = creationDate
      logger.info("Finished changing abrigos")
    } else {
      // Add an abrigo.
      logger.info("Finished Generating abrigos")
      modelContext.insert(Abrigo(id: UUID().uuidString, nome: nome, ativo: true, creationDate: Date()))
    }
  }
}
