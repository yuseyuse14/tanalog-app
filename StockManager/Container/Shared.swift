//
//  Shared.swift
//  StockManager
//

import SwiftData

extension ModelContainer {
    // 共通スキーマ
    static let schema = Schema([
        Stock.self,
        Tag.self,
        StockUnit.self
    ])

    // 公開用コンテナ
    static let shared: ModelContainer = {
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}
