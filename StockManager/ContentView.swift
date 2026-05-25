//
//  ContentView.swift
//  StockManager
//

import SwiftUI
import SwiftData

enum TabItem: Hashable {
    case home
    case stocks
    case dishes
    case orders
    case shops
    case tags
}

struct ContentView: View {
    @State private var selectedTab: TabItem? = .stocks

    var body: some View {
        TabView(selection: $selectedTab) {
//            Tab("ホーム", systemImage: "house", value: TabItem.home) {
//                Text("ホーム")
//            }
            Tab("在庫", systemImage: "shippingbox", value: TabItem.stocks) {
                StockView()
            }
//            Tab("メニュー", systemImage: "fork.knife", value: TabItem.dishes) {
//                Text("メニュー一覧")
//            }
//            Tab("発注履歴", systemImage: "cart", value: TabItem.orders) {
//                Text("発注履歴")
//            }
//            TabSection("その他") {
//                Tab("仕入れ先", systemImage: "building.2", value: TabItem.shops) {
//                    Text("仕入れ先一覧")
//                }
                Tab("タグ", systemImage: "tag", value: TabItem.tags) {
                    TagView()
                }
//            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    ContentView()
        .modelContainer(.preview)
}
