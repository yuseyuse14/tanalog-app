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

    let numMin: Int = 0

    private var preStock: Stock? = nil
    var showError: Bool = false
    private var stockNames: Set<String> = []

    // Stockで初期化
    mutating func apply(from stock: Stock, allStocks: [Stock]) {
        name = stock.name
        num = stock.num
        minNum = stock.minNum
        unit = stock.unit
        tags = Set(stock.tags)
        preStock = stock
        setStockNames(from: allStocks)
    }

    // 全在庫の在庫名Setを作成
    mutating func setStockNames(from allStocks: [Stock]) {
        stockNames = Set(allStocks.map(\.name))
    }

    func canSave(in allStocks: [Stock]) -> Bool {
        validation.allFilled && validation.nameUnique && validation.numValid
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

        var nameUnique: Bool {
            guard nameFilled else { return true }

            if let preStock, preStock.name == form.name {
                return true
            }
            return !form.stockNames.contains(form.name)
        }

        var numValid: Bool {
            guard numFilled else { return true }
            return form.num! >= form.numMin
        }
    }

    var validation: Validation {
        Validation(form: self, preStock: preStock)
    }
}

// MARK: ここからエラー
extension StockForm {
    struct FormError {
        let form: StockForm

        enum ErrorType {
            case emptyString, emptyInt
            case notUnique(String)
            case outOfRange(Int)
            case none

            var color: Color {
                switch self {
                case .emptyString, .emptyInt, .outOfRange:
                    return .red
                case .notUnique:
                    return .yellow
                default: return .clear
                }
            }

            var message: String? {
                switch self {
                case .emptyString, .emptyInt:
                    return "必須項目です"
                case .notUnique(let str):
                    return "「\(str)」は既に使われています"
                case .outOfRange(let int):
                    return "\(int)以上の数値を入力してください"
                default: return nil
                }
            }
        }

        var name: ErrorType {
            if form.showError && !form.validation.nameFilled { return .emptyString }
            else if form.showError && !form.validation.nameUnique { return .notUnique(form.name) }
            else { return .none }
        }
        var num: ErrorType {
            if form.showError && !form.validation.numFilled { return .emptyInt }
            else if form.showError && !form.validation.numValid { return .outOfRange(form.numMin) }
            else { return .none }
        }
        var minNum: ErrorType {
            if form.showError && !form.validation.minNumFilled { return .emptyInt }
            else { return .none }
        }
        var unit: ErrorType {
            if form.showError && !form.validation.unitFilled { return .emptyString }
            else { return .none }
        }
    }

    var error: FormError {
        FormError(form: self)
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
