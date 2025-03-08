//
//  Cor+DataGeneration.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 04/03/25.
//

import Foundation
import OSLog
import SwiftData

private let logger = Logger(subsystem: "PetsData", category: "Pets Generation")
private var descricao: [String] = ["Branco", "Preto", "Caramelo", "Castanho", "Malhado"]

extension Cor {
  static func generateCor(modelContext: ModelContext) {
    logger.info("Generating/Fetching Pets")

    descricao.forEach { nome in
      modelContext.insert(Cor(id: UUID().uuidString, nome: nome, ativo: true))
    }

    logger.info("Finished Generating/Fetching Cor")
  }
}
