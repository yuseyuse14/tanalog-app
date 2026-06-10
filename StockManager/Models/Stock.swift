//
//  Stock.swift
//  StockManager
//

import SwiftData

@Model
final class Stock {
    #Unique<Stock>([\.name])

    var name: String
    var yomi: String?
    var num: Int
    var minNum: Int
    var unit: StockUnit?

    // 対応Tagが存在しても削除可能, 多対多
    @Relationship(deleteRule: .nullify, inverse: \Tag.stocks)
    var tags: [Tag]

    var order: Int

    init(name: String, yomi: String? = nil, num: Int, minNum: Int, unit: StockUnit? = nil, order: Int) {
        self.name = name
        self.yomi = yomi
        self.num = num
        self.minNum = minNum
        self.unit = unit
        self.tags = []
        self.order = order
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
}

// MARK: ここから状態
extension Stock {
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

// MARK: ここからソート用ロジック
extension Stock {
    static func nextOrder(stocks: [Stock]) -> Int {
        let maxOrder = stocks.max(by: { $0.order < $1.order })?.order ?? 0
        return maxOrder + 1
    }
}
