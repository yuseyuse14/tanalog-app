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
            setupPreviewData(for: container)
            return container
        } catch {
            fatalError("Could not create PreviewContainer: \(error)")
        }
    }()
    
    @MainActor
    static func setupPreviewData(for container: ModelContainer){
        let context = container.mainContext

        // プレビュー用データを追加
        Tag.Sample.all.forEach { context.insert($0) }
        StockUnit.Sample.all.forEach { context.insert($0) }
        Stock.relations.forEach { relation in
            let stock = relation.stock
            context.insert(stock)
            stock.tags = relation.tags
            stock.unit = relation.unit
        }
    }
}
