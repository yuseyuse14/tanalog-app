//
//  StockEditView.swift
//  StockManager
//

import SwiftUI
import SwiftData

struct StockEditView: View {
    @Bindable var stock: Stock

    @State private var name: String = ""
    @State private var num: Int = 0
    @State private var minNum: Int = 0
    @State private var unit: String = ""

    var body: some View {
        // 詳細情報(右側)
        VStack(alignment: .leading, spacing: 12) {
            // ヘッダー
            HStack {
                Button {} label: {
                    Text("キャンセル")
                        .font(.subheadline)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Text("在庫編集")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                Button {} label: {
                    Text("保存")
                        .font(.subheadline)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            Divider()
            // 在庫詳細
            HStack(spacing: 0) {
                Text("在庫名：")
                TextField(stock.name, text: $name)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Divider()
            HStack(spacing: 0) {
                Text("個数：")
                TextField("\(stock.num)", value: $num, format: .number)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("基準個数：")
                TextField("\(stock.minNum)", value: $minNum, format: .number)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("単位：")
                TextField(stock.unit, text: $unit)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Divider()
            Label("タグ", systemImage: "tag")
            // TODO: タグ編集機能
            Divider()
            Label("仕入れ先", systemImage: "building.2")
            // TODO: 仕入れ先編集機能
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 32)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            name = stock.name
            num = stock.num
            minNum = stock.minNum
            unit = stock.unit
        }
    }
}

#Preview {
    StockEditView(stock: Stock.samples[0])
        .modelContainer(.preview)
}
