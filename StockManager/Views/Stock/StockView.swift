//
//  StockView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

struct StockView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Stock.order) private var stocks: [Stock]
    @Query(sort: \Tag.order) private var tags: [Tag]

    @State private var selectedStock: Stock? = nil
    @State private var selectedTags: Set<Tag> = []
    @State private var isEdit: Bool = false
    @State private var isCreate: Bool = false
    @FocusState var isSearchFocused: Bool
    @State private var query: StockQuery = StockQuery()
    private var queryStocks: [Stock] {
        query.apply(to: stocks)
    }

    var body: some View {
        VStack(spacing: 0) {
            // ヘッダー
            PageHeaderView(titleLabel: "在庫一覧") {
                // 検索機能
                HStack(spacing: 0) {
                    Button {
                        withAnimation(.spring(duration: 0.6, bounce: 0.24)) {
                            query.search.isActive.toggle()
                            isSearchFocused = query.search.isActive
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .pageHeaderButtonStyle()
                    }
                    // 検索フィールド
                    if query.search.isActive {
                        TextField("在庫を検索", text: $query.search.text)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .focused($isSearchFocused)
                        // リセットボタン
                        if !query.search.text.isEmpty {
                            Button {
                                withAnimation(.linear(duration: 0.2)) {
                                    query.search.text = ""
                                }
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(Color(.label))
                                    .padding(.horizontal, 12)
                            }
                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .fill(query.search.isActive ? Color(.systemGray6) : .clear)
                        .stroke(query.search.isActive ? Color(.separator) : .clear)
                )

                // TODO: ソート機能
                Menu {
                    ForEach(SortType.allCases, id: \.self) { type in
                        Button {
                            withAnimation(.easeInOut(duration: 0.4)) {
                                query.sort.selectType(type)
                            }
                        } label: {
                            Label(type.title, systemImage: query.sort.selected(as: type) ? "checkmark" :"")
                            Text(type.subTitle(in: query.sort))
                        }
                    }
                } label: {
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
                                .font(.title3)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(.blue.opacity(query.filter.tags.contains(tag) ? 0.4 : 0.05))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.blue.opacity(0.4))
                                )
                                .onTapGesture {
                                    withAnimation(.spring(duration: 0.3)) {
                                        if query.filter.tags.contains(tag) {
                                            query.filter.tags.remove(tag)
                                        } else {
                                            query.filter.tags.insert(tag)
                                        }
                                    }
                                }
                        }
                    }
                    .padding(8)
                }
                .fixedSize(horizontal: false, vertical: true)
            }
            Divider()

            // メイン画面
            HStack(spacing: 0) {
                if !queryStocks.isEmpty {
                    // 在庫一覧(左側)
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(queryStocks) { stock in
                                StockLowView(stock: stock, selectedStock: $selectedStock)
                            }
                        }
                    }
                    .padding(8)
                    .frame(maxWidth: .infinity)
                } else {
                    ContentUnavailableView(
                        "該当する在庫はありません",
                        systemImage: "archivebox",
                        description: Text("検索ワードや選択中のタグを見直してください。")
                    )
                }
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
                                ForEach(stock.tags.sorted(by: {$0.order < $1.order })) { tag in
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
                        // TODO: 在庫別の仕入れ先一覧
//                        Label("仕入れ先", systemImage: "building.2")
                        // TODO: 在庫別の発注履歴一覧
//                        Divider()
//                        Label("発注履歴", systemImage: "cart")
                    } else {
                        ContentUnavailableView("在庫を選択してください", systemImage: "hand.tap")
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .contentShape(Rectangle())
            .simultaneousGesture(
                TapGesture().onEnded {
                    withAnimation(.spring(duration: 0.6, bounce: 0.24)) {
                        isSearchFocused = false
                    }
                }
            )
        }
        .onAppear {
            if selectedStock == nil {
                selectedStock = queryStocks.first
            }
        }
        .sheet(isPresented: $isCreate) {
            StockCreateView()
        }
        .sheet(isPresented: $isEdit) {
            if let stock = selectedStock {
                StockEditView(stock: stock, selectedStock: $selectedStock)
            }
        }
    }
}

#Preview {
    StockView()
        .modelContainer(.preview)
}

