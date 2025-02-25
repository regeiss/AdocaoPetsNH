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

  var body: some Scene {
    WindowGroup {
      ContentView()
        .modifier(DarkModeViewModifier())
        .environmentObject(errorHandling)
        .petsDataContainer()
    }
  }
}
