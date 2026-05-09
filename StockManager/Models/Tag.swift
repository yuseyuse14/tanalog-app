//
//  Tag.swift
//  StockManager
//

import Foundation
import SwiftData

@Model
final class Tag {
    var name: String

    // 対応Stockが存在していても削除可能, 多対多
    @Relationship(deleteRule: .nullify)
    var stocks: [Stock]

    init(name: String) {
        self.name = name
        self.stocks = []
    }
}
