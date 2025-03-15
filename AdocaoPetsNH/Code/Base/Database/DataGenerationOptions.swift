//
//  DataGenerationOptions.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 23/02/25.
//

import Foundation

public class DataGenerationOptions {
  public static let inMemoryPersistence = false
}

// MARK: - FirstBackyardBirdStatus

extension DataGenerationOptions {

  public enum FirstBackyardBirdStatus {
    case alreadyVisible
    case fliesIn
    case notVisiting
  }
}
