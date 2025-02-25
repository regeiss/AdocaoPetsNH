//
//  DataGenerationOptions.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 23/02/25.
//

import Foundation

public class DataGenerationOptions {
  /// When true, do not save data to disk. When false, saves data to disk.
  public static let inMemoryPersistence = false
}

// MARK: - FirstBackyardBirdStatus

extension DataGenerationOptions {

  public enum FirstBackyardBirdStatus {
    /// The bird is shown initially as if it's been there for a while.
    case alreadyVisible

    /// The bird is visiting but needs to be drawn flying in.
    case fliesIn

    /// No bird is visiting.
    case notVisiting
  }
}
