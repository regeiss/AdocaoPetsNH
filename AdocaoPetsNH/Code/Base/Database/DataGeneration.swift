//
//  DataGeneration.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 23/02/25.
//

import OSLog
import Observation
import SwiftData

private let logger = Logger(subsystem: "PetsData", category: "DataGeneration")

// MARK: - Data Generation

@Model public class DataGeneration {
  public var initializationDate: Date?
  public var lastSimulationDate: Date?

  public var requiresInitialDataGeneration: Bool {
    initializationDate == nil
  }

  public init(initializationDate: Date?, lastSimulationDate: Date?) {
    self.initializationDate = initializationDate
    self.lastSimulationDate = lastSimulationDate
  }

  private func generateInitialData(modelContext: ModelContext) {
    logger.info("Gerando dados iniciais")

    Pet.generatePets(modelContext: modelContext)
    Pelagem.generatePelagem(modelContext: modelContext)
    Raca.generateRaca(modelContext: modelContext)
    Porte.generatePorte(modelContext: modelContext)
    Cor.generateCor(modelContext: modelContext)
    Abrigo.generateAbrigos(modelContext: modelContext)
    logger.info("Geração dos dados iniciais concluída")
    initializationDate = .now
  }

  private static func instance(with modelContext: ModelContext) -> DataGeneration {
    if let result = try! modelContext.fetch(FetchDescriptor<DataGeneration>()).first {
      return result
    } else {
      let instance = DataGeneration(
        initializationDate: nil,
        lastSimulationDate: nil
      )
      modelContext.insert(instance)
      return instance
    }
  }

  public static func generateAllData(modelContext: ModelContext) {
    let instance = instance(with: modelContext)
    instance.simulateHistoricalEvents(modelContext: modelContext)
  }

  private func simulateHistoricalEvents(modelContext: ModelContext) {
    logger.info("Simulando eventos históricos...")
    if requiresInitialDataGeneration {
      logger.info("Requer inicialização de dados...")
      generateInitialData(modelContext: modelContext)
    }
  }
}

extension DataGeneration {
  public static let container = try! ModelContainer(
    for: schema, configurations: [.init(isStoredInMemoryOnly: DataGenerationOptions.inMemoryPersistence) ])

  public static let schema = SwiftData.Schema([
    DataGeneration.self,
    Pet.self,
    Pelagem.self,
    Raca.self,
    Porte.self,
    Cor.self
  ])
}
