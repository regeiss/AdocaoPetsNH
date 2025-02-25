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

extension Pet {
  static func generatePets(modelContext: ModelContext) {
    logger.info("Generating/Fetching Pets")

    let pet = Pet(id: UUID().uuidString, nome: "Rex", ativo: true, isFavorite: true, creationDate: Date())
    modelContext.insert(pet)
    let pet1 = Pet(id: UUID().uuidString, nome: "Fido", ativo: true, isFavorite: true, creationDate: Date())
    modelContext.insert(pet1)
    let pet2 = Pet(id: UUID().uuidString, nome: "Max", ativo: true, isFavorite: true, creationDate: Date())
    modelContext.insert(pet2)
    let pet3 = Pet(id: UUID().uuidString, nome: "Faisca", ativo: true, isFavorite: true, creationDate: Date())
    modelContext.insert(pet3)

    logger.info("Finished Generating/Fetching Pets")
  }
}
