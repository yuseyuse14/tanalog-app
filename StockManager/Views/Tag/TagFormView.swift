//
//  TagFormView.swift
//  StockManager
//

import SwiftUI
import SwiftData

enum TagFormFocus {
    case name
}

struct TagFormView: View {
    @Binding var form: TagForm
    @FocusState var focus: TagFormFocus?

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
                .focused($focus, equals: .name)
                .submitLabel(.return)
            }
            Divider()
        }
        .onAppear {
            focus = .name
        }
    }
}

#Preview {
    @Previewable @State var previewForm = TagForm()
    TagFormView(form: $previewForm)
        .modelContainer(.preview)
}
