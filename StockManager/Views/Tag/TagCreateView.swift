//
//  TagCreateView.swift
//  StockManager
//

import SwiftUI
import SwiftData

struct TagCreateView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query private var tags: [Tag]

    @State private var form: TagForm = TagForm()

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 12) {
                // ヘッダー
                SheetHeaderView(
                    titleLabel: "タグ追加",
                    leftLabel: "キャンセル",
                    rightLabel: "追加",
                    leftAction: { dismiss() },
                    rightAction: { validateSave() }
                )

                // タグ詳細
                TagFormView(form: $form)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
        }
        .onAppear {
            form.setTagNames(from: tags)
        }
    }

    private func validateSave() {
        if form.canSave(in: tags) {
            createTag()
        } else {
            form.showError = true
        }
    }

    private func createTag() {
        let newTag = Tag(name: form.saveName)
        context.insert(newTag)
        try? context.save()
        dismiss()
    }
}

#Preview {
    TagCreateView()
}
