//
//  TagFormView.swift
//  StockManager
//

import SwiftUI
import SwiftData

struct TagFormView: View {
    @Binding var form: TagForm

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 4){
                Label("基本情報", systemImage: "list.bullet.clipboard")
                    .formHeadlineStyle()
                FormTextView(
                    label: "タグ名",
                    placeholder: form.placeholder.name,
                    text: $form.name,
                    errorType: form.error.name
                )
            }
            Divider()
        }
    }
}

#Preview {
    @Previewable @State var previewForm = TagForm()
    TagFormView(form: $previewForm)
        .modelContainer(.preview)
}
