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

  public init(initializationDate: Date?, lastSimulationDate: Date?, includeEarlyAccessSpecies: Bool = false) {
    self.initializationDate = initializationDate
    self.lastSimulationDate = lastSimulationDate
  }

  private func generateInitialData(modelContext: ModelContext) {
    logger.info("Generating initial data...")

    // First, generate all available bird food, bird species, and plant species.
//    logger.info("Generating all bird foods")
//    BirdFood.generateAll(modelContext: modelContext)

//    Backyard.generateAll(modelContext: modelContext)

    logger.info("Generating account")
    // The app content is complete, now it's time to create the person's account.
    Pet.generatePets(modelContext: modelContext)

    logger.info("Completed generating initial data")
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
    logger.info("Attempting to statically simulate historical events...")
    instance.simulateHistoricalEvents(modelContext: modelContext)
  }

  private func simulateHistoricalEvents(modelContext: ModelContext) {
    logger.info("Attempting to simulate historical events...")
    if requiresInitialDataGeneration {
      logger.info("Requires an initial data generation")
      generateInitialData(modelContext: modelContext)
    }
  }
}

extension DataGeneration {
  public static let container = try! ModelContainer(
    for: schema, configurations: [.init(isStoredInMemoryOnly: DataGenerationOptions.inMemoryPersistence)])

  public static let schema = SwiftData.Schema([
    DataGeneration.self,
    Pet.self
      //        PlantSpecies.self,
      //        Plant.self,
      //        BirdSpecies.self,
      //        BirdFood.self,
      //        Bird.self,
      //        Backyard.self,
      //        BackyardVisitorEvent.self
  ])
}
