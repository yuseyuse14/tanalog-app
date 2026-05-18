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

    @Binding var form: StockForm

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            FormTextView(
                label: "在庫名",
                placeholder: form.placeholder.name,
                text: $form.name,
                borderColor: form.error.name.color
            )
            Divider()
            HStack(spacing: 0) {
                FormNumberView(
                    label: "個数",
                    placeholder: form.placeholder.num,
                    num: $form.num,
                    borderColor: form.error.num.color
                )
                FormNumberView(
                    label: "基準個数",
                    placeholder: form.placeholder.minNum,
                    num: $form.minNum,
                    borderColor: form.error.minNum.color
                )
                FormTextView(
                    label: "単位",
                    placeholder: form.placeholder.unit,
                    text: $form.unit,
                    borderColor: form.error.unit.color
                )
            }
            Divider()

            // タグ編集
            FormTagView(label: "タグ", icon: "tag", selectedTags: $form.tags)
            Divider()

            Label("仕入れ先", systemImage: "building.2")
                .formHeadlineStyle()
            // TODO: 仕入れ先編集機能
            Divider()
        }
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    @Previewable @State var previewForm = StockForm()
    StockFormView(form: $previewForm)
        .modelContainer(.preview)
}
