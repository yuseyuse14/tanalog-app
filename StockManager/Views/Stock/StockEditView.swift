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

    @State private var form: StockForm = StockForm()
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
                StockFormView(stock: stock, form: $form)

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
                form.name = stock.name
                form.num = stock.num
                form.minNum = stock.minNum
                form.unit = stock.unit
                form.tags = Set(stock.tags)
            }
        }
    }

    // FIXME: 同一の名前がある場合上書きしてしまうので修正
    private func updateStock() {
        stock.name = form.name
        stock.num = form.num!
        stock.minNum = form.minNum!
        stock.unit = form.unit
        stock.tags = Array(form.tags)
        try? context.save()
        dismiss()
    }

    private func deleteStock() {
        context.delete(stock)
        try? context.save()
        dismiss()
    }
}

#Preview {
    StockEditView(stock: Stock.samples[0])
        .modelContainer(.preview)
}
