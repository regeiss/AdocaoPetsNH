//
//  Porte+DataGeneration.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 03/03/25.
//
import Foundation
import OSLog
import SwiftData

private let logger = Logger(subsystem: "PetsData", category: "Pets Generation")
private var descricao: [String] = ["Pequena", "Médio", "Grande", "ExtraGrande"]

extension Porte {
  static func generatePorte(modelContext: ModelContext) {
    logger.info("Generating/Fetching Pets")

    descricao.forEach { nome in
      modelContext.insert(Porte(id: UUID().uuidString, nome: nome, ativo: true))
    }

    logger.info("Finished Generating/Fetching Pelagem")
  }
}
