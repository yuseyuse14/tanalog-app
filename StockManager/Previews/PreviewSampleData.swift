//
//  PreviewSampleData.swift
//  StockManager
//

import SwiftData

extension ModelContainer {
    @MainActor
    static func setupPreviewData(for container: ModelContainer){
        let context = container.mainContext
        // TODO: プレビュー用データを追加
        let stocks = Stock.samples
        let tags = Tag.samples
        stocks.forEach { context.insert($0) }
        tags.forEach { context.insert($0) }

        // StockのRelation
        let stockRelationDict = Dictionary(uniqueKeysWithValues: Stock.relations.map { ($0.stockName, $0) } )
        let tagDict = Dictionary(uniqueKeysWithValues: Tag.samples.map { ($0.name, $0) } )
        stocks.forEach { stock in
            // Tag
            if let tagNames = stockRelationDict[stock.name]?.tagNames {
                tagNames.forEach { tagName in
                    if let tag = tagDict[tagName] {
                        stock.tags.append(tag)
                    }
                }
            }
        }
    }
}

// MARK: - 各モデルのサンプルデータ定義
extension Stock {
    static let samples: [Stock] = [
        Stock(name: "ウイスキー", num: 3, minNum: 1, unit: "本"),
        Stock(name: "ガトーショコラ", num: 12, minNum: 4, unit: "個"),
        Stock(name: "鰹", num: 14, minNum: 6, unit: "本"),
        Stock(name: "ローストビーフ", num: 8, minNum: 4, unit: "個"),
        Stock(name: "玉ねぎ", num: 4, minNum: 2, unit: "個"),
        Stock(name: "卵", num: 12, minNum: 6, unit: "個"),
        Stock(name: "ラップ", num: 10, minNum: 3, unit: "本"),
    ]

    struct Relation {
        let stockName: String
        let tagNames: [String]
        init(_ stockName: String, tagNames: [String]) {
            self.stockName = stockName
            self.tagNames = tagNames
        }
    }

    static let relations: [Relation]  = [
        Relation("ウイスキー", tagNames: ["飲み物", "ウイスキー"]),
        Relation("ガトーショコラ", tagNames: ["食べ物", "デザート"]),
        Relation("鰹", tagNames: ["食べ物"]),
        Relation("ローストビーフ", tagNames: ["食べ物", "肉"]),
        Relation("玉ねぎ", tagNames: ["食べ物"]),
        Relation("卵", tagNames: ["食べ物"]),
        Relation("ラップ", tagNames: ["消耗品"])
    ]
}

extension Tag {
    static let samples: [Tag] = [
        Tag(name: "食べ物"),
        Tag(name: "スピード"),
        Tag(name: "揚げ物"),
        Tag(name: "肉"),
        Tag(name: "ご飯もの"),
        Tag(name: "パスタ"),
        Tag(name: "パン"),
        Tag(name: "デザート"),
        Tag(name: "飲み物"),
        Tag(name: "ビール"),
        Tag(name: "ウイスキー"),
        Tag(name: "スピリッツ"),
        Tag(name: "日本酒"),
        Tag(name: "ワイン"),
        Tag(name: "ソフトドリンク"),
        Tag(name: "調味料"),
        Tag(name: "消耗品"),
    ]
}
