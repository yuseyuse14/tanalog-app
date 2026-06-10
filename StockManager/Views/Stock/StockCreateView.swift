//
//  StockCreateView.swift
//  StockManager
//

import SwiftUI
import SwiftData

struct StockCreateView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query private var stocks: [Stock]

    @State private var form: StockForm = StockForm()

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 12) {
                // ヘッダー
                SheetHeaderView(
                    titleLabel: "在庫追加",
                    leftLabel: "キャンセル",
                    rightLabel: "追加",
                    leftAction: { dismiss() },
                    rightAction: { validateSave() }
                )

                // 在庫詳細
                StockFormView(form: $form)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
        }
        .onAppear {
            form.setStockNames(from: stocks)
        }
    }

    private func validateSave() {
        if form.canSave(in: stocks) {
            createStock()
        } else {
            form.showError = true
        }
    }

    private func createStock() {
        let newStock = Stock(name: form.saveName, yomi: form.yomi, num: form.num!, minNum: form.minNum!, unit: form.unit!, order: Stock.nextOrder(stocks: stocks))
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
