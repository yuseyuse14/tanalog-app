//
//  StockForm.swift
//  StockManager
//

import SwiftUI

struct StockForm {
    var name: String = ""
    var num: Int? = nil
    var minNum: Int? = nil
    var unit: String = ""
    var tags: Set<Tag> = []

    private var preStock: Stock? = nil

    // Stockで初期化
    mutating func apply(from stock: Stock) {
        name = stock.name
        num = stock.num
        minNum = stock.minNum
        unit = stock.unit
        tags = Set(stock.tags)
        preStock = stock
    }

    func canSave(in allStocks: [Stock]) -> Bool {
        validation.allFilled && validation.nameUnique(in: allStocks)
    }
}

// MARK: ここから入力検証ロジック
extension StockForm {
    struct Validation {
        let form: StockForm
        let preStock: Stock?

        var nameFilled: Bool { !form.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
        var numFilled: Bool { form.num != nil }
        var minNumFilled: Bool { form.minNum != nil }
        var unitFilled: Bool { !form.unit.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
        var allFilled: Bool { nameFilled && numFilled && minNumFilled && unitFilled }

        func nameUnique(in allStocks: [Stock]) -> Bool {
            guard nameFilled else { return true }

            if let preStock, preStock.name == form.name {
                return true
            }
            return !allStocks.contains { $0.name == form.name }
        }
    }

    var validation: Validation {
        Validation(form: self, preStock: preStock)
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
