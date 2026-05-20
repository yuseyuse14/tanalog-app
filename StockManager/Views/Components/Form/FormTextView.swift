//
//  FormTextView.swift
//  StockManager
//

import SwiftUI

struct FormTextView: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var errorType: StockForm.FormError.ErrorType

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text(label)
                    .formLabelStyle()
            }
            TextField(placeholder, text: $text)
                .formInputFieldStyle(borderColor: errorType.color)
        }
    }
}

#Preview {
    @Previewable @State var previewText: String = "初期値"
    FormTextView(label: "ラベル", placeholder: "プレースホルダー", text: $previewText, errorType: .none)
}
