//
//  AdocaoPetsNHApp.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 12/02/25.
//

import SwiftData
import SwiftUI

@main
struct AdocaoPetsNHApp: App {
  @StateObject private var errorHandling = ErrorHandling()

  // TODO: Avaliar uso em container proprio do swiftdata
  var sharedModelContainer: ModelContainer = {
    let schema = Schema([
      Item.self
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

    do {
      return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .modifier(DarkModeViewModifier())
        .environmentObject(errorHandling)
        .alert(item: $errorHandling.currentError) { error in
          Alert(
            title: Text("Error"),
            message: Text(error.message),
            dismissButton: .default(Text("OK"))
          )
        }
    }
    .modelContainer(sharedModelContainer)
  }
}
