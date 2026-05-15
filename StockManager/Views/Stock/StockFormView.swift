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
        VStack(spacing: 12) {
            HStack(spacing: 0) {
                Text("在庫名：")
                TextField(StockForm.Placeholder.name, text: $form.name)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
            }
            Divider()
            HStack(spacing: 0) {
                Text("個数：")
                TextField(StockForm.Placeholder.num, value: $form.num, format: .number)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                Text("基準個数：")
                TextField(StockForm.Placeholder.minNum, value: $form.minNum, format: .number)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                Text("単位：")
                TextField(StockForm.Placeholder.unit, text: $form.unit)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
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
    }
}

#Preview {
    @Previewable @State var previewForm = StockForm()
    StockFormView(form: $previewForm)
}
