//
//  StockView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

struct StockView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Stock.name) private var stocks: [Stock]
    @Query(sort: \Tag.name) private var tags: [Tag]

    @State private var selectedStock: Stock? = nil
    @State private var isEdit: Bool = false
    @State private var isCreate: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            // ヘッダー
            PageHeaderView(titleLabel: "在庫一覧") {
                // TODO: 検索機能
                Button { } label: {
                    Image(systemName: "magnifyingglass")
                        .pageHeaderButtonStyle()
                }
                // TODO: ソート機能
                Button { } label: {
                    Image(systemName: "arrow.up.arrow.down")
                        .pageHeaderButtonStyle()
                }
                // 新規追加
                Button {
                    isCreate.toggle()
                } label: {
                    Image(systemName: "plus")
                        .pageHeaderButtonStyle()
                }
            }

            // タグ一覧
            HStack(spacing: 0) {
                Image(systemName: "tag")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.horizontal, 16)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8) {
                        ForEach(tags) { tag in
                            Text(tag.name)
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.blue.opacity(0.1))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.blue.opacity(0.4))
                                )
                        }
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 4)
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            Divider()

            // メイン画面
            HStack(spacing: 0) {
                // 在庫一覧(左側)
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(stocks) { stock in
                            HStack(spacing: 0) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(stock.status.color)
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
                    // ヘッダー
                    HStack(spacing: 0) {
                        Text("詳細情報")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        // 在庫編集ボタン
                        Button {
                            if selectedStock != nil {
                                isEdit.toggle()
                            }
                        } label: {
                            Image(systemName: "pencil")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.horizontal, 16)
                                .foregroundStyle(.foreground)
                        }
                    }
                    Divider()
                    // 在庫詳細
                    if let stock = selectedStock {
                        HStack(spacing: 0) {
                            Text("在庫名：")
                            Text(stock.name)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(stock.status.name)
                                .padding(.horizontal, 8)
                                .frame(height: 24)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(stock.status.color.opacity(0.2))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(stock.status.color, lineWidth: 1)
                                        )
                                )
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
                            Text(stock.unit!.name)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Divider()
                        Label("タグ", systemImage: "tag")
                        // TODO: 在庫別のタグ一覧
                        if !stock.tags.isEmpty {
                            HFlow(alignment: .center, spacing: 16) {
                                ForEach(stock.tags) { tag in
                                    Text(tag.name)
                                        .font(.title3)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 4)
                                        .background(
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(.blue.opacity(0.05))
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(.blue.opacity(0.4))
                                        )
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Divider()
                        Label("仕入れ先", systemImage: "building.2")
                        // TODO: 在庫別の仕入れ先一覧
                        Divider()
                        Label("発注履歴", systemImage: "cart")
                    } else {
                        ContentUnavailableView("在庫を選択してください", systemImage: "hand.tap")
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
        .sheet(isPresented: $isCreate) {
            StockCreateView()
        }
        .sheet(isPresented: $isEdit) {
            if let stock = selectedStock {
                StockEditView(stock: stock)
            }
        }
    }
}

#Preview {
    StockView()
        .modelContainer(.preview)
}
