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

    mutating func apply(from stock: Stock) {
        self.name = stock.name
        self.num = stock.num
        self.minNum = stock.minNum
        self.unit = stock.unit
        self.tags = Set(stock.tags)
        self.preStock = stock
    }

    mutating func restore(field: Field) {
        guard let preStock else { return }

        switch field {
        case .name:
            if self.name.isEmpty { self.name = preStock.name }
        case .num:
            if self.num == nil { self.num = preStock.num }
        case .minNum:
            if self.minNum == nil { self.minNum = preStock.minNum }
        case .unit:
            if self.unit.isEmpty { self.unit = preStock.unit }
        }
    }
}

// MARK: ここからプレースホルダー
extension StockForm {
    struct Placeholder {
        let preStock: Stock?

        var name: String { preStock?.name ?? "例：チーズケーキ" }
        var num: String { preStock?.num.description ?? "例：10" }
        var minNum: String { preStock?.minNum.description ?? "例：4" }
        var unit: String { preStock?.unit ?? "例：個" }
    }

    var placeholder: Placeholder {
        Placeholder(preStock: preStock)
    }
}

// MARK: ここからフィールド
extension StockForm {
    enum Field {
        case name, num, minNum, unit
    }
}
