//
//  Item.swift
//  FetchNestedJsonDataCovid19
//
//  Created by User on 20/01/24.
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
