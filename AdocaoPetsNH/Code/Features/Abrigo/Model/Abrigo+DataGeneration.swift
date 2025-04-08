//
//  Abrigo+DataGeneration.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 19/03/25.
//

import Foundation
import OSLog
import SwiftData

private let logger = Logger(subsystem: "PetsData", category: "Pets Generation")
private var descricao: [String] = ["Fenac", "Lomba Grande", "Canil da Costa", "Canil 2"]

extension Abrigo {
  static func generateAbrigos(modelContext: ModelContext) {
    logger.info("Generating/Fetching abrigos")

    descricao.forEach { nome in
      modelContext.insert(
        Abrigo(id: UUID().uuidString, nome: nome, ativo: true, creationDate: Date()))
    }

    logger.info("Finished Generating/Fetching Pets")
  }
}
