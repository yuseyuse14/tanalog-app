//
//  StockEditView.swift
//  StockManager
//

import SwiftUI
import SwiftData

struct StockEditView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @Bindable var stock: Stock

    @State private var name: String = ""
    @State private var num: Int = 0
    @State private var minNum: Int = 0
    @State private var unit: String = ""

    var body: some View {
        // 詳細情報(右側)
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                // ヘッダー
                HStack {
                    Button {
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
                    Button {
                        saveStock()
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
                    TextField(stock.name, text: $name)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                }
                Divider()
                HStack(spacing: 0) {
                    Text("個数：")
                    TextField("\(stock.num)", value: $num, format: .number)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                    Text("基準個数：")
                    TextField("\(stock.minNum)", value: $minNum, format: .number)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                    Text("単位：")
                    TextField(stock.unit, text: $unit)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                }
                Divider()
                Label("タグ", systemImage: "tag")
                // TODO: タグ編集機能
                Divider()
                Label("仕入れ先", systemImage: "building.2")
                // TODO: 仕入れ先編集機能
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
            .onAppear {
                name = stock.name
                num = stock.num
                minNum = stock.minNum
                unit = stock.unit
            }
        }
    }

    // FIXME: 同一の名前がある場合上書きしてしまうので修正
    private func saveStock() {
        stock.name = name
        stock.num = num
        stock.minNum = minNum
        stock.unit = unit
        try? context.save()
        dismiss()
    }
}

#Preview {
    StockEditView(stock: Stock.samples[0])
        .modelContainer(.preview)
}
