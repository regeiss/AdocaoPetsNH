//
//  ContentView.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 12/02/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
  @Environment(\.prefersTabNavigation) var prefersTabNavigation
  @State private var selection: AppScreen? = .home

  var body: some View {
    if prefersTabNavigation {
      AppTabView(selection: $selection)
    } else {
      NavigationSplitView {
          AppSidebarList(selection: $selection)
      } detail: {
          AppDetailColumn(screen: selection)
      }
    }
  }
}
