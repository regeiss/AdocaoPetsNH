/*
 See the LICENSE.txt file for this sample’s licensing information.
 
 Abstract:
 The sidebar list.
 */

import SwiftUI

struct AppSidebarList: View {
  @Binding var selection: AppScreen?

  var body: some View {
    List(AppScreen.allCases, selection: $selection) { screen in
      NavigationLink(value: screen) {
        screen.label
      }
    }
    .navigationTitle("Adote um pet")
  }
}
