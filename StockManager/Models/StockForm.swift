//
//  StockForm.swift
//  StockManager
//

import Foundation

struct StockForm {
    var name: String = ""
    var num: Int? = nil
    var minNum: Int? = nil
    var unit: String = ""
    var tags: Set<Tag> = []

    mutating func apply(from stock: Stock) {
        self.name = stock.name
        self.num = stock.num
        self.minNum = stock.minNum
        self.unit = stock.unit
        self.tags = Set(stock.tags)
    }
}
