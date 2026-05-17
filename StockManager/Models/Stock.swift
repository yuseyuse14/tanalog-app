//
//  Stock.swift
//  StockManager
//

import SwiftData

@Model
final class Stock {
    #Unique<Stock>([\.name])

    var name: String
    var num: Int
    var minNum: Int
    var unit: String

    // 対応Tagが存在しても削除可能, 多対多
    @Relationship(deleteRule: .nullify, inverse: \Tag.stocks)
    var tags: [Tag]

    init(name: String, num: Int, minNum: Int, unit: String) {
        self.name = name
        self.num = num
        self.minNum = minNum
        self.unit = unit
        self.tags = []
    }
}

import SwiftUI
// MARK: - ここからロジック
extension Stock {
    func decrement() {
        if self.num > 0 {
            self.num -= 1
        }
    }
    func increment() {
        self.num += 1
    }

    enum Status {
        case empty, low, sufficient

        var name: String {
            switch self {
            case .empty: return "品切れ"
            case .low: return "残りわずか"
            case .sufficient: return "在庫あり"
            }
        }

        var color: Color {
            switch self {
            case .empty: return .red
            case .low: return .yellow
            case .sufficient: return .green
            }
        }
    }

    var status: Status {
        if num == 0 { return .empty }
        if num <= minNum { return .low }
        return .sufficient
    }
}
