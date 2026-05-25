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
            SplashView()
                .modelContainer(.shared)
        }
    }
}
