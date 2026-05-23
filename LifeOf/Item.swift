//
//  Item.swift
//  LifeOf
//
//  Created by Ray on 2026/5/22.
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
