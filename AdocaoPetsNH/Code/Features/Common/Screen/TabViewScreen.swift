//
//  TabViewScreen.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 05/01/25.
//

import SwiftUI

struct TabViewScreen: View {

  var body: some View {

    TabView {
      Tab("Home", systemImage: "house") {
        PlaceholderScreen()
      }
      Tab("Cadastros", systemImage: "person.crop.square.on.square.angled") {
        PlaceholderScreen()
      }

      Tab("Abrigos", systemImage: "house") {
        Text("SwiftUI topic")
      }

      Tab("Localizacao", systemImage: "map") {
        PlaceholderScreen()
      }

      Tab("Perfil", systemImage: "person") {
        PlaceholderScreen()
      }
    }
  }
}
