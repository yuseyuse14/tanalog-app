//
//  StockCreateView.swift
//  StockManager
//

import SwiftUI
import SwiftData

struct StockCreateView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Tag.name) private var tags: [Tag]

    @State private var form: StockForm = StockForm(name: "", num: 8, minNum: 2, unit: "個", tags: [])

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
                StockFormView(stock: nil, form: $form)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
        }
    }

    // FIXME: 同一の名前がある場合上書きしてしまうので修正
    private func createStock() {
        let newStock = Stock(name: form.name, num: form.num, minNum: form.minNum, unit: form.unit)
        newStock.tags = Array(form.tags)
        context.insert(newStock)
        try? context.save()
        dismiss()
    }
}

#Preview {
    StockCreateView()
        .modelContainer(.preview)
}
