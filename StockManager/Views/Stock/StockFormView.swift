//
//  StockFormView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

enum StockFormFocus {
    case name, num, minNum
}

struct StockFormView: View {
    @Environment(\.modelContext) private var context
    @Query private var units: [StockUnit]

    @Binding var form: StockForm
    @FocusState var focus: StockFormFocus?

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
                .focused($focus, equals: .name)
                .submitLabel(.next)
                .onSubmit {
                    focus = .num
                }

                HStack(spacing: 0) {
                    FormNumberView(
                        label: "個数",
                        placeholder: form.placeholder.num,
                        num: $form.num,
                        errorType: form.error.num
                    )
                    .focused($focus, equals: .num)
                    .submitLabel(.next)
                    .onSubmit {
                        focus = .minNum
                    }

                    FormNumberView(
                        label: "基準個数",
                        placeholder: form.placeholder.minNum,
                        num: $form.minNum,
                        errorType: form.error.minNum
                    )
                    .focused($focus, equals: .minNum)
                    .submitLabel(.return)
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
        .onAppear {
            focus = .name
        }
    }
}

#Preview {
    @Previewable @State var previewForm = StockForm()
    StockFormView(form: $previewForm)
        .modelContainer(.preview)
}
