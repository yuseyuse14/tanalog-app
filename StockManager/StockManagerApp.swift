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
                .modelContainer(.shared)
        }
    }
}

extension ModelContainer {
    // 共通スキーマ
    static let schema = Schema([
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
            return setupPreviewData(for: container)
        } catch {
            fatalError("Could not create PreviewContainer: \(error)")
        }
    }()

    @MainActor
    static func setupPreviewData(for container: ModelContainer) -> ModelContainer {
        let context = container.mainContext
        // TODO: プレビュー用データを追加
        do {
            try context.save()
        } catch {
            print("Failed to save preview data: \(error)")
        }
        return container
    }
}
