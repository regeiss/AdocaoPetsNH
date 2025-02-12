//
//  Item.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 12/02/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
