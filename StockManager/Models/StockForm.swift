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

    private var preStock: Stock? = nil

    struct Placeholder {
        static let name: String = "例：チーズケーキ"
        static let num: String = "例：10"
        static let minNum: String = "例：4"
        static let unit: String = "例：個"
    }

    mutating func apply(from stock: Stock) {
        self.name = stock.name
        self.num = stock.num
        self.minNum = stock.minNum
        self.unit = stock.unit
        self.tags = Set(stock.tags)
        self.preStock = stock
    }
}
