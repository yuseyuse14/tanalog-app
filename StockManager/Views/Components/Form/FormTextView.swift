//
//  FormTextView.swift
//  StockManager
//

import SwiftUI

struct FormTextView: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    let isError: Bool
    var errorColor: Color = .red

    var body: some View {
        HStack(spacing: 0) {
            Text(label)
                .formLabelStyle()
            TextField(placeholder, text: $text)
                .formInputFieldStyle()
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(isError ? errorColor : .clear, lineWidth: 1)
                )
        }
    }
}

#Preview {
    @Previewable @State var previewText: String = "初期値"
    FormTextView(label: "ラベル", placeholder: "プレースホルダー", text: $previewText, isError: true)
}
