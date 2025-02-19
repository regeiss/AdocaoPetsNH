/*
 See the LICENSE.txt file for this sample’s licensing information.

 Abstract:
 An enum that defines the label of the active screen.
 */

import SwiftUI

//import BackyardBirdsUI
//import BackyardBirdsData

enum AppScreen: Codable, Hashable, Identifiable, CaseIterable {
  case home
  case pets
  case abrigos
  case localizacao
  case perfil

  var id: AppScreen { self }
}

extension AppScreen {
  @ViewBuilder
  var label: some View {
    switch self {
    case .home:
      Label("Home", systemImage: "house")
    case .pets:
      Label("Pets", systemImage: "dog")
    case .abrigos:
      Label("Abrigos", systemImage: "leaf")
    case .localizacao:
      Label("Localizacao", systemImage: "location")
    case .perfil:
      Label("Perfil", systemImage: "person.crop.circle")
    }
  }

  @ViewBuilder
  var destination: some View {
    switch self {
    case .home:
      HomeNavigationStack()
    case .abrigos:
      PlantsNavigationStack()
    case .pets:
      BirdsNavigationStack()
    case .localizacao:
      MapView()
    case .perfil:
      AccountNavigationStack()
    }
  }
}
