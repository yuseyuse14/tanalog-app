//
//  StockUnit.swift
//  StockManager
//

import SwiftData

@Model
final class StockUnit {
    #Unique<StockUnit>([\.name])
    var name: String
    var order: Int

    init(name: String, order: Int) {
        self.name = name
        self.order = order
    }
}
