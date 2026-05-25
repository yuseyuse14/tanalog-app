//
//  Preview.swift
//  StockManager
//

import SwiftData

extension ModelContainer {
    // プレビュー用コンテナ
    static let preview: ModelContainer = {
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            try setupPreviewData(for: container.mainContext)
            return container
        } catch {
            fatalError("Could not create PreviewContainer: \(error)")
        }
    }()
    
    @MainActor
    static func setupPreviewData(for context: ModelContext) throws {
        // プレビュー用データを追加
        Tag.Sample.all.forEach { context.insert($0) }
        StockUnit.Sample.all.forEach { context.insert($0) }
        Stock.relations.enumerated().forEach { i, relation in
            let stock = relation.stock
            stock.order = i + 1
            context.insert(stock)
            stock.tags = relation.tags
            stock.unit = relation.unit
        }

        do {
            try context.save()
        } catch {
            print("プレビューデータ追加に失敗しました: \(error)")
        }
    }
}
