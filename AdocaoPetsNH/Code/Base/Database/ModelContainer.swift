//
//  ModelContainer.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 23/02/25.
//

import SwiftData
import SwiftUI

struct PetsDataContainerViewModifier: ViewModifier {
  let container: ModelContainer

  init(inMemory: Bool) {
    container = try! ModelContainer(
      for: DataGeneration.schema, configurations: [ModelConfiguration(isStoredInMemoryOnly: inMemory)])
  }

  func body(content: Content) -> some View {
    content
      .generateData()
      .modelContainer(container)
  }
}

struct GenerateDataViewModifier: ViewModifier {
  @Environment(\.modelContext) private var modelContext

  func body(content: Content) -> some View {
    content.onAppear {
      DataGeneration.generateAllData(modelContext: modelContext)
    }
  }
}

extension View {
  public func petsDataContainer(inMemory: Bool = DataGenerationOptions.inMemoryPersistence) -> some View {
    modifier(PetsDataContainerViewModifier(inMemory: inMemory))
  }
}

extension View {
  fileprivate func generateData() -> some View {
    modifier(GenerateDataViewModifier())
  }
}
