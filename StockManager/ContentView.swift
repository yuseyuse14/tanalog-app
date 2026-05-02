//
//  ContentView.swift
//  StockManager
//

import SwiftUI

enum TabItem: Hashable {
    case home
    case stocks
    case dishes
    case orders
    case shops
}

struct ContentView: View {
    @State private var selectedTab: TabItem? = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("ホーム", systemImage: "house", value: TabItem.home) {
                Text("ホーム")
            }
            Tab("在庫", systemImage: "shippingbox", value: TabItem.stocks) {
                Text("在庫一覧")
            }
            Tab("メニュー", systemImage: "fork.knife", value: TabItem.dishes) {
                Text("メニュー一覧")
            }
            Tab("発注履歴", systemImage: "cart", value: TabItem.orders) {
                Text("発注履歴")
            }
            Tab("仕入れ先", systemImage: "building.2", value: TabItem.shops) {
                Text("仕入れ先一覧")
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    ContentView()
}
