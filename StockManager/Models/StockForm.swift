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

    // Stockで初期化
    mutating func apply(from stock: Stock) {
        name = stock.name
        num = stock.num
        minNum = stock.minNum
        unit = stock.unit
        tags = Set(stock.tags)
        preStock = stock
    }
}

// MARK: ここから入力チェック
extension StockForm {
    // 空白チェック
    var isNameValid: Bool { !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
    var isNumValid: Bool { num != nil }
    var isMinNumValid: Bool { minNum != nil }
    var isUnitValid: Bool { !unit.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
    var isValid: Bool { isNameValid && isNumValid && isMinNumValid && isUnitValid }

    // ユニークチェック
    func isNameUnique(in allStocks: [Stock]) -> Bool {
        guard isNameValid else { return true }

        if let preStock, preStock.name == name {
            return true
        }
        return !allStocks.contains { $0.name == name }
    }

    func canSave(in allStocks: [Stock]) -> Bool {
        isValid && isNameUnique(in: allStocks)
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
