//
//  StockFormView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

struct StockFormView: View {
    @Environment(\.modelContext) private var context
    @Query private var units: [StockUnit]

    @Binding var form: StockForm

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 4){
                Label("基本情報", systemImage: "list.bullet.clipboard")
                    .formHeadlineStyle()
                FormTextView(
                    label: "在庫名",
                    placeholder: form.placeholder.name,
                    text: $form.name,
                    errorType: form.error.name
                )
                HStack(spacing: 0) {
                    FormNumberView(
                        label: "個数",
                        placeholder: form.placeholder.num,
                        num: $form.num,
                        errorType: form.error.num
                    )
                    FormNumberView(
                        label: "基準個数",
                        placeholder: form.placeholder.minNum,
                        num: $form.minNum,
                        errorType: form.error.minNum
                    )
                }
                FormPickerView(
                    label: "単位",
                    placeholder: form.placeholder.unit,
                    items: units,
                    selectedItem: $form.unit,
                    errorType: form.error.unit
                )
            }
            Divider()

            // タグ編集
            VStack(alignment: .leading, spacing: 4) {
                Label("タグ", systemImage: "tag")
                    .formHeadlineStyle()
                FormTagView(selectedTags: $form.tags)
            }
            Divider()

            // 仕入れ先編集
            VStack(alignment: .leading, spacing: 4) {
                Label("仕入れ先", systemImage: "building.2")
                    .formHeadlineStyle()
                // TODO: 仕入れ先編集機能
            }
            Divider()
        }
    }
}

#Preview {
    @Previewable @State var previewForm = StockForm()
    StockFormView(form: $previewForm)
        .modelContainer(.preview)
}
