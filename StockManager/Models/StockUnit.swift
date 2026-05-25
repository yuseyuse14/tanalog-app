//
//  StockUnit.swift
//  StockManager
//

import SwiftData

@Model
final class StockUnit {
    #Unique<StockUnit>([\.name])
    var name: String
    var order: Int = 0

    init(name: String, order: Int) {
        self.name = name
        self.order = order
    }
}
