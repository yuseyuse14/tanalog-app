//
//  StockUnit.swift
//  StockManager
//

import SwiftData

@Model
final class StockUnit {
    #Unique<StockUnit>([\.name])
    var name: String

    init(name: String) {
        self.name = name
    }
}
