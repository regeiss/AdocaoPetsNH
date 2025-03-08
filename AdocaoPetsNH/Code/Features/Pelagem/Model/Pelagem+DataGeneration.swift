//
//  Pelagem+DataGeneration.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 03/03/25.
//

import Foundation
import OSLog
import SwiftData

private let logger = Logger(subsystem: "PetsData", category: "Pets Generation")
private var descricao: [String] = ["Curto", "Médio", "Longo", "Extra"]

extension Pelagem {
  static func generatePelagem(modelContext: ModelContext) {
    logger.info("Generating/Fetching Pets")

    descricao.forEach { nome in
      modelContext.insert(Pelagem(id: UUID().uuidString, nome: nome, ativo: true))
    }

    logger.info("Finished Generating/Fetching Pelagem")
  }
}
