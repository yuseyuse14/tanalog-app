//
//  StockCreateView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

struct StockCreateView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Tag.name) private var tags: [Tag]

    @State private var name: String = ""
    @State private var num: Int = 0
    @State private var minNum: Int = 0
    @State private var unit: String = ""
    @State private var selectedTags: Set<Tag> = []

    var body: some View {
        // 詳細情報(右側)
        ScrollView {
            VStack(alignment: .center, spacing: 12) {
                // ヘッダー
                HStack(spacing: 0) {
                    Button(role: .cancel) {
                        dismiss()
                    } label: {
                        Text("キャンセル")
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.foreground)
                    }
                    Text("在庫編集")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Button(role: .confirm) {
                        updateStock()
                    } label: {
                        Text("保存")
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundStyle(.foreground)
                    }
                }
                Divider()

                // 在庫詳細
                HStack(spacing: 0) {
                    Text("在庫名：")
                    TextField("チーズケーキ", text: $name)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                }
                Divider()
                HStack(spacing: 0) {
                    Text("個数：")
                    TextField("6", value: $num, format: .number)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                    Text("基準個数：")
                    TextField("4", value: $minNum, format: .number)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                    Text("単位：")
                    TextField("個", text: $unit)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                }
                Divider()

                Label("タグ", systemImage: "tag")
                    .frame(maxWidth: .infinity, alignment: .leading)
                // TODO: タグ編集機能
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

                Spacer()
                    .frame(minHeight: 40)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
        }
    }

    // FIXME: 同一の名前がある場合上書きしてしまうので修正
    private func updateStock() {
        let newStock = Stock(name: name, num: num, minNum: minNum, unit: unit)
        newStock.tags = Array(selectedTags)
        context.insert(newStock)
        try? context.save()
        dismiss()
    }
}

#Preview {
    StockCreateView()
        .modelContainer(.preview)
}
