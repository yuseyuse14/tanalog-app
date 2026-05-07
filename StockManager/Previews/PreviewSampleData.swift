//
//  PreviewSampleData.swift
//  StockManager
//

import Foundation
import SwiftData

extension ModelContainer {
    @MainActor
    static func setupPreviewData(for container: ModelContainer){
        let context = container.mainContext
        // TODO: プレビュー用データを追加
        let stocks = Stock.samples
        stocks.forEach { context.insert($0)}
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
        Stock(name: "ラップ", num: 10, minNum: 3, unit: "本")
    ]
}
