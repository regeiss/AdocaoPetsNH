//
//  Raca+DataGeneration.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 03/03/25.
//

import Foundation
import OSLog
import SwiftData

private let logger = Logger(subsystem: "PetsData", category: "Pets Generation")
private var descricao: [String] = ["Fox", "Pastor Alemão", "ViraLata", "Schnauzer"]

extension Raca {
  static func generateRaca(modelContext: ModelContext) {
    logger.info("Generating/Fetching Pets")

    descricao.forEach { nome in
      modelContext.insert(Raca(id: UUID().uuidString, nome: nome, ativo: true))
    }

    logger.info("Finished Generating/Fetching Pelagem")
  }
}
