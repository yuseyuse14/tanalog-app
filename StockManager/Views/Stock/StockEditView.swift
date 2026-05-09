//
//  StockEditView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

struct StockEditView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @Bindable var stock: Stock

    @State private var name: String = ""
    @State private var num: Int = 0
    @State private var minNum: Int = 0
    @State private var unit: String = ""
    @State private var selectedTags: Set<Tag> = []

    @State private var isDeleteAlert: Bool = false

    var body: some View {
        // 詳細情報(右側)
        ScrollView {
            VStack(alignment: .center, spacing: 12) {
                // ヘッダー
                SheetHeaderView(
                    titleLabel: "在庫編集",
                    leftLabel: "キャンセル",
                    rightLabel: "保存",
                    leftAction: { dismiss() },
                    rightAction: { updateStock() }
                )

                // 在庫詳細
                StockFormView(stock: stock, name: $name, num: $num, minNum: $minNum, unit: $unit, selectedTags: $selectedTags)

                Spacer()
                    .frame(minHeight: 40)
                // 削除ボタン
                Button(role: .destructive) {
                    isDeleteAlert.toggle()
                } label: {
                    Label("削除する", systemImage: "trash")
                        .font(.headline)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.red, lineWidth: 1)
                                )
                        )
                }
                .alert("在庫の削除", isPresented: $isDeleteAlert) {
                    Button("削除", role: .destructive) {
                        deleteStock()
                    }
                    Button("キャンセル", role: .cancel) { }
                } message: {
                    Text("この在庫を削除してもよろしいですか？この操作は取り消せません。")
                }
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
            .onAppear {
                name = stock.name
                num = stock.num
                minNum = stock.minNum
                unit = stock.unit
                selectedTags = Set(stock.tags)
            }
        }
    }

    // FIXME: 同一の名前がある場合上書きしてしまうので修正
    private func updateStock() {
        stock.name = name
        stock.num = num
        stock.minNum = minNum
        stock.unit = unit
        stock.tags = Array(selectedTags)
        try? context.save()
        dismiss()
    }

    private func deleteStock() {
        context.delete(stock)
        try? context.save()
        dismiss()
    }
}

struct StockFormView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Tag.name) private var tags: [Tag]

    let stock: Stock?
    @Binding var name: String
    @Binding var num: Int
    @Binding var minNum: Int
    @Binding var unit: String
    @Binding var selectedTags: Set<Tag>

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 0) {
                Text("在庫名：")
                TextField(stock?.name ?? "チーズケーキ", text: $name)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
            }
            Divider()
            HStack(spacing: 0) {
                Text("個数：")
                TextField("\(stock?.num ?? 8)", value: $num, format: .number)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                Text("基準個数：")
                TextField("\(stock?.minNum ?? 4)", value: $minNum, format: .number)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                Text("単位：")
                TextField(stock?.unit ?? "個", text: $unit)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
            }
            Divider()

            // タグ編集
            Label("タグ", systemImage: "tag")
                .frame(maxWidth: .infinity, alignment: .leading)
            HFlow(alignment: .center, spacing: 16) {
                ForEach(tags) { tag in
                    Text(tag.name)
                        .font(.title3)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(
                            selectedTags.contains(tag) ? RoundedRectangle(cornerRadius: 15)
                                .fill(.blue.opacity(0.4)) : RoundedRectangle(cornerRadius: 15)
                                .fill(.blue.opacity(0.05))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.blue.opacity(0.4))
                        )
                        .onTapGesture {
                            if selectedTags.contains(tag) {
                                selectedTags.remove(tag)
                            } else {
                                selectedTags.insert(tag)
                            }
                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()

            Label("仕入れ先", systemImage: "building.2")
                .frame(maxWidth: .infinity, alignment: .leading)
            // TODO: 仕入れ先編集機能
            Divider()
        }
    }
}

struct SheetHeaderView: View {
    let titleLabel: String
    let leftLabel: String
    let rightLabel: String
    let leftAction: () -> Void
    let rightAction: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Text(titleLabel)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack(spacing: 0) {
                    Button(role: .cancel) {
                        leftAction()
                    } label: {
                        Text(leftLabel)
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                    }
                    Spacer()
                    Button {
                        rightAction()
                    } label: {
                        Text(rightLabel)
                            .font(.subheadline)
                            .bold()
                            .padding(.horizontal, 8)
                    }
                }
            }
            Divider()
        }
    }
}

#Preview {
    StockEditView(stock: Stock.samples[0])
        .modelContainer(.preview)
}
