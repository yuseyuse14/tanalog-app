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
    @State private var isValidationError: Bool = false

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
                    rightAction: { validateSave() }
                )

                // 在庫詳細
                StockFormView(form: $form, isValidationError: isValidationError, isUniqueError: !form.validation.nameUnique(in: stocks))
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
        }
    }

    private func validateSave() {
        if form.canSave(in: stocks) {
            createStock()
        } else {
            isValidationError = true
        }
    }

    // FIXME: 同一の名前がある場合上書きしてしまうので修正
    private func createStock() {
        let newStock = Stock(name: form.name, num: form.num!, minNum: form.minNum!, unit: form.unit)
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
