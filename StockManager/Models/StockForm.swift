//
//  StockForm.swift
//  StockManager
//

import SwiftUI

struct StockForm {
    var name: String = ""
    var saveName: String { name.trimming(for: .edge) }
    var num: Int? = nil
    var minNum: Int? = nil
    var unit: StockUnit? = nil
    var tags: Set<Tag> = []

    // 数値の範囲
    let numMin: Int = 0
    let minNumMin: Int = 1

    // UI状態
    var showError: Bool = false

    // 関連データ
    private var preStock: Stock? = nil
    private var stockNames: Set<String> = []

    // Stockで初期化
    mutating func apply(from stock: Stock, allStocks: [Stock]) {
        name = stock.name
        num = stock.num
        minNum = stock.minNum
        tags = Set(stock.tags)
        preStock = stock
        setStockNames(from: allStocks)
    }

    // 全在庫の在庫名Setを作成
    mutating func setStockNames(from allStocks: [Stock]) {
        stockNames = Set(allStocks.map { $0.name.trimming(for: .all) })
    }

    func canSave(in allStocks: [Stock]) -> Bool {
        validation.allFilled && validation.nameUnique && validation.allNumValid
    }
}

// MARK: ここから入力検証ロジック
extension StockForm {
    struct Validation {
        let form: StockForm
        let preStock: Stock?

        // 入力確認
        var nameFilled: Bool { !form.saveName.isEmpty }
        var numFilled: Bool { form.num != nil }
        var minNumFilled: Bool { form.minNum != nil }
        var unitFilled: Bool {
            guard let unit = form.unit else { return false }
            return !unit.name.trimming(for: .edge).isEmpty
        }
        var allFilled: Bool { nameFilled && numFilled && minNumFilled && unitFilled }

        // ユニーク確認
        var nameUnique: Bool {
            guard nameFilled else { return true }

            if let preStock, preStock.name.trimming(for: .all) == form.name.trimming(for: .all) {
                return true
            }
            return !form.stockNames.contains(form.name.trimming(for: .all))
        }

        // 数値範囲確認
        var numValid: Bool {
            guard numFilled else { return true }
            return form.num! >= form.numMin
        }
        var minNumValid: Bool {
            guard minNumFilled else { return true }
            return form.minNum! >= form.minNumMin
        }
        var allNumValid: Bool { numValid && minNumValid }
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
            else if form.showError && !form.validation.nameUnique { return .notUnique(form.saveName) }
            else { return .none }
        }
        var num: ErrorType {
            if form.showError && !form.validation.numFilled { return .emptyInt }
            else if form.showError && !form.validation.numValid { return .outOfRange(form.numMin) }
            else { return .none }
        }
        var minNum: ErrorType {
            if form.showError && !form.validation.minNumFilled { return .emptyInt }
            else if form.showError && !form.validation.minNumValid { return .outOfRange(form.minNumMin) }
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
