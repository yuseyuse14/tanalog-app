//
//  Shared.swift
//  StockManager
//

import Foundation

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

    // 初期データ投入(初回のみ)
    @MainActor
    static func setupInitialData(for context: ModelContext) throws {
        // 初回かどうか確認
        let key = "hasSetupInitialData"
        guard !UserDefaults.standard.bool(forKey: key) else {
            print("初期データは追加済みです.")
            return
        }

        // 初期データを追加
        Tag.Sample.all.forEach { context.insert($0) }
        StockUnit.Sample.all.forEach { context.insert($0) }
        Stock.relations.forEach { relation in
            let stock = relation.stock
            context.insert(stock)
            stock.yomi = YomiganaUtils.getYomiganaOf(stock.name)
            stock.tags = relation.tags
            stock.unit = relation.unit
        }

        do {
            try context.save()
            print("初期データを追加しました.")
        } catch {
            print("初期データ追加に失敗しました: \(error)")
            return
        }

        // 初期データを保存できた場合のみ初回フラグを切り替え
        UserDefaults.standard.set(true, forKey: key)
    }
}
