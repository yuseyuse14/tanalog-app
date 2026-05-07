//
//  Stock.swift
//  StockManager
//

import Foundation
import SwiftData

@Model
final class Stock {
    #Unique<Stock>([\.name])

    var name: String
    var num: Int
    var minNum: Int
    var unit: String

    init(name: String, num: Int, minNum: Int, unit: String) {
        self.name = name
        self.num = num
        self.minNum = minNum
        self.unit = unit
    }
}
