//
//  AppMigration.swift
//  StockManager
//

import Foundation
import SwiftData

enum AppMigration {
    private static let migrationKey = "migration_version"
    private static let currentVersion: Int = 1

    static func migrateIfNeeded(for context: ModelContext) throws {
        let version = UserDefaults.standard.integer(forKey: migrationKey)
        guard version < currentVersion else {
            print("バージョンは最新です.")
            return
        }

        let stocks = try context.fetch(FetchDescriptor<Stock>())

        if version < 1 {
            migrateYomi(stocks)
        }

        do {
            try context.save()
            print("データ移行に成功しました.")
        } catch {
            print("データ移行に失敗しました: \(error)")
            return
        }

        UserDefaults.standard.set(currentVersion, forKey: migrationKey)
    }

    private static func migrateYomi(_ stocks: [Stock]) {
        for stock in stocks {
            if stock.yomi.isEmpty {
                stock.yomi = YomiganaUtils.getYomiganaOf(stock.name)
            }
        }
    }
}
