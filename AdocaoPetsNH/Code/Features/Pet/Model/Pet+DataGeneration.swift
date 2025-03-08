//
//  Pet+DataGeneration.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 23/02/25.
//

import Foundation
import OSLog
import SwiftData

private let logger = Logger(subsystem: "PetsData", category: "Pets Generation")
private var descricao: [String] = ["Rex", "Heiko", "Paco", "Dolly"]

extension Pet {
  static func generatePets(modelContext: ModelContext) {
    logger.info("Generating/Fetching Pets")

    descricao.forEach { nome in
      modelContext.insert(
        Pet(id: UUID().uuidString, nome: nome, ativo: true, isFavorite: true, creationDate: Date()))
    }

    logger.info("Finished Generating/Fetching Pets")
  }
}
