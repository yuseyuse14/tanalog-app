//
//  StocksView.swift
//  StockManager
//

import SwiftUI
import SwiftData

struct StocksView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Stock.name) private var stocks: [Stock]

    @State private var selectedStock: Stock? = nil

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("在庫一覧")
                    .font(.system(size: 36, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                // TODO: ソート機能
                Image(systemName: "arrow.up.arrow.down")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .padding(.horizontal, 16)
                // TODO: 検索機能
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .padding(.horizontal, 16)
                // TODO: 新規追加機能
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .padding(.horizontal, 16)
            }
            .padding(.horizontal, 16)
            Divider()

            // TODO: タグ一覧機能
            HStack(spacing: 0) {
                Image(systemName: "tag")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.horizontal, 16)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8) {
                        ForEach(0..<10) { i in
                            Text("タグ\(i)")
                                .frame(width: 80, height: 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.cyan.opacity(0.2))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.cyan, lineWidth: 1)
                                    )
                                )
                        }
                    }
                    .frame(height: 30)
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            Divider()

            HStack(spacing: 0) {
                // 在庫一覧表示(左側)
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(stocks) { stock in
                            HStack(spacing: 0) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(stock.statusColor)
                                    .frame(width: 8, height: 30)
                                Text(stock.name)
                                    .font(.title)
                                    .frame(maxWidth: .infinity)
                                Button {
                                    stock.decrement()
                                } label: {
                                    Image(systemName: "minus.square")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                }
                                Text("\(stock.num)")
                                    .font(.title)
                                    .monospacedDigit()
                                    .frame(width: 55)
                                Button {
                                    stock.increment()
                                } label: {
                                    Image(systemName: "plus.square")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                }
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedStock = stock
                            }
                            Divider()
                        }
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                Divider()

                // 詳細情報(右側)
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 0) {
                        Text("詳細情報")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        // TODO: 在庫編集機能
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 16)
                    }
                    Divider()
                    // TODO: 在庫詳細機能
                    if let stock = selectedStock {
                        HStack(spacing: 0) {
                            Text("在庫名：")
                            Text(stock.name)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Divider()
                        HStack(spacing: 0) {
                            Text("個数：")
                            Text("\(stock.num)")
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("基準個数：")
                            Text("\(stock.minNum)")
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("単位：")
                            Text(stock.unit)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Divider()
                        Label("タグ", systemImage: "tag")
                        // TODO: 在庫別のタグ一覧
                        Divider()
                        Label("仕入れ先", systemImage: "building.2")
                        // TODO: 在庫別の仕入れ先一覧
                        Divider()
                        Label("発注履歴", systemImage: "cart")
                    } else {
//                        Text("在庫が選択されていません")
                        ContentUnavailableView("在庫を選択してください", systemImage: "hand.tap")
                    }
                    Spacer()
                }
                .padding(16)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    StocksView()
        .modelContainer(.preview)
}
