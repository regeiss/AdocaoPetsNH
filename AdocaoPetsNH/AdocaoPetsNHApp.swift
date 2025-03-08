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
  @Environment(\.scenePhase) private var scenePhase
  @Environment(\.modelContext) private var context
  @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
  @StateObject private var errorHandling = ErrorHandling()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .modifier(DarkModeViewModifier())
        .environmentObject(errorHandling)
        .petsDataContainer()
        .onChange(of: needsAppOnboarding) {_, needsAppOnboarding in

          if needsAppOnboarding {

            // Scenario #2: User has completed app onboarding during current app launch
            // appSetupState = "App setup"
          }
        }
        .sheet(isPresented: $needsAppOnboarding) {
          // Scenario #1: User has NOT completed app onboarding
          OnBoardingView()
        }
    }
    .onChange(of: scenePhase) {_, phase in
      switch phase {
      case .active:
        print("active")
      //            prepareAppContext()
      //            //setAppVars()
      //            getCoreDataDBPath()
      case .inactive:
        print("inactive")
      case .background:
        print("background")
        saveContext()
      @unknown default:
        fatalError()
      }
    }
  }

  func saveContext() {
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
}
