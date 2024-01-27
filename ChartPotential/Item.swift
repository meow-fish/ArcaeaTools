//
//  Item.swift
//  ChartPotential
//
//  Created by Darren Li on 27/1/2024.
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
