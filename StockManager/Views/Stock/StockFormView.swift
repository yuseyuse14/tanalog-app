//
//  StockFormView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

struct StockFormView: View {
    @Environment(\.modelContext) private var context
    @Query private var stocks: [Stock]
    @Query(sort: \Tag.name) private var tags: [Tag]

    @Binding var form: StockForm

    var body: some View {
        VStack(spacing: 12) {
            FormTextView(
                label: "在庫名",
                placeholder: form.placeholder.name,
                text: $form.name,
                borderColor: (form.showError && !form.validation.nameFilled) ? .red : !form.validation.nameUnique(in: stocks) ? .yellow : .clear
            )
            Divider()
            HStack(spacing: 0) {
                FormNumberView(
                    label: "個数",
                    placeholder: form.placeholder.num,
                    num: $form.num,
                    borderColor: (form.showError && !form.validation.numFilled) ? .red : .clear,
                )
                FormNumberView(
                    label: "基準個数",
                    placeholder: form.placeholder.minNum,
                    num: $form.minNum,
                    borderColor: (form.showError && !form.validation.minNumFilled) ? .red : .clear,
                )
                FormTextView(
                    label: "単位",
                    placeholder: form.placeholder.unit,
                    text: $form.unit,
                    borderColor: (form.showError && !form.validation.unitFilled) ? .red : .clear,
                )
            }
            Divider()

            // タグ編集
            Label("タグ", systemImage: "tag")
                .frame(maxWidth: .infinity, alignment: .leading)
            HFlow(alignment: .center, spacing: 16) {
                ForEach(tags) { tag in
                    Text(tag.name)
                        .font(.title3)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(
                            form.tags.contains(tag) ? RoundedRectangle(cornerRadius: 15)
                                .fill(.blue.opacity(0.4)) : RoundedRectangle(cornerRadius: 15)
                                .fill(.blue.opacity(0.05))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.blue.opacity(0.4))
                        )
                        .onTapGesture {
                            if form.tags.contains(tag) {
                                form.tags.remove(tag)
                            } else {
                                form.tags.insert(tag)
                            }
                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()

            Label("仕入れ先", systemImage: "building.2")
                .frame(maxWidth: .infinity, alignment: .leading)
            // TODO: 仕入れ先編集機能
            Divider()
        }
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    @Previewable @State var previewForm = StockForm()
    StockFormView(form: $previewForm)
}
