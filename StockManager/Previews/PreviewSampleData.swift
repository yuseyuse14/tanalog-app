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
        stocks.forEach { context.insert($0) }
        let tags = Tag.samples
        tags.forEach { context.insert($0) }
        let units = StockUnit.samples
        units.forEach { context.insert($0) }

        // StockのRelation
        let stockRelationDict = Dictionary(uniqueKeysWithValues: Stock.relations.map { ($0.stockName, $0) })
        let tagDict = Dictionary(uniqueKeysWithValues: Tag.samples.map { ($0.name, $0) })
        let unitDict = Dictionary(uniqueKeysWithValues: StockUnit.samples.map { ($0.name, $0) })
        stocks.forEach { stock in
            // Tag
            if let tagNames = stockRelationDict[stock.name]?.tagNames {
                tagNames.forEach { tagName in
                    if let tag = tagDict[tagName] {
                        stock.tags.append(tag)
                    }
                }
            }
            // Unit
            if let unitName = stockRelationDict[stock.name]?.unitName, let unit = unitDict[unitName] {
                stock.unit = unit
            }
        }
    }
}

// MARK: - 各モデルのサンプルデータ定義
extension Stock {
    static let samples: [Stock] = [
        Stock(name: "ウイスキー", num: 3, minNum: 1),
        Stock(name: "ガトーショコラ", num: 12, minNum: 4),
        Stock(name: "鰹", num: 14, minNum: 6),
        Stock(name: "ローストビーフ", num: 8, minNum: 4),
        Stock(name: "玉ねぎ", num: 4, minNum: 2),
        Stock(name: "卵", num: 12, minNum: 6),
        Stock(name: "ラップ", num: 10, minNum: 3),
    ]

    struct Relation {
        let stockName: String
        let tagNames: [String]
        let unitName: String
        init(_ stockName: String, tagNames: [String], unitName: String) {
            self.stockName = stockName
            self.tagNames = tagNames
            self.unitName = unitName
        }
    }

    static let relations: [Relation]  = [
        Relation("ウイスキー", tagNames: ["飲み物", "ウイスキー"], unitName: "本"),
        Relation("ガトーショコラ", tagNames: ["食べ物", "デザート"], unitName: "個"),
        Relation("鰹", tagNames: ["食べ物"], unitName: "本"),
        Relation("ローストビーフ", tagNames: ["食べ物", "肉"], unitName: "個"),
        Relation("玉ねぎ", tagNames: ["食べ物"], unitName: "個"),
        Relation("卵", tagNames: ["食べ物"], unitName: "個"),
        Relation("ラップ", tagNames: ["消耗品"], unitName: "本")
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

extension StockUnit {
    static let samples: [StockUnit] = [
        StockUnit(name: "個"),
        StockUnit(name: "本"),
        StockUnit(name: "枚")
    ]
}
