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
    @State private var num: Int = 8
    @State private var minNum: Int = 4
    @State private var unit: String = ""
    @State private var selectedTags: Set<Tag> = []

    var body: some View {
        // 詳細情報(右側)
        ScrollView {
            VStack(alignment: .center, spacing: 12) {
                // ヘッダー
                SheetHeaderView(
                    titleLabel: "在庫追加",
                    leftLabel: "キャンセル",
                    rightLabel: "追加",
                    leftAction: { dismiss() },
                    rightAction: { createStock() }
                )

                // 在庫詳細
                StockFormView(stock: nil, name: $name, num: $num, minNum: $minNum, unit: $unit, selectedTags: $selectedTags)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
        }
    }

    // FIXME: 同一の名前がある場合上書きしてしまうので修正
    private func createStock() {
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
