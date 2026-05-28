//
//  Tag.swift
//  StockManager
//

import SwiftData

@Model
final class Tag {
    #Unique<Tag>([\.name])
    var name: String

    // 対応Stockが存在していても削除可能, 多対多
    @Relationship(deleteRule: .nullify)
    var stocks: [Stock]

    var order: Int

    init(name: String, order: Int) {
        self.name = name
        self.stocks = []
        self.order = order
    }
}

// MARK: ここからソート用ロジック
extension Tag {
    static func nextOrder(tag: [Tag]) -> Int {
        let maxOrder = tag.max(by: { $0.order < $1.order })?.order ?? 0
        return maxOrder + 1
    }
}
