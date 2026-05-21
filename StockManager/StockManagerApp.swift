//
//  StockManagerApp.swift
//  StockManager
//

import SwiftUI
import SwiftData

@main
struct StockManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(.preview)
        }
    }
}

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
}
