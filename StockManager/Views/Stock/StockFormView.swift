//
//  StockFormView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

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

#Preview {
    @Previewable @State var name = "チーズケーキ"
    @Previewable @State var num = 8
    @Previewable @State var minNum = 2
    @Previewable @State var unit = "個"
    @Previewable @State var selectedTags: Set<Tag> = []
    StockFormView(stock: nil, name: $name, num: $num, minNum: $minNum, unit: $unit, selectedTags: $selectedTags)
}
