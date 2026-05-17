//
//  FormNumberView.swift
//  StockManager
//

import SwiftUI

struct FormNumberView: View {
    let label: String
    let placeholder: String
    @Binding var num: Int?
    let isError: Bool

    var body: some View {
        HStack(spacing: 0) {
            Text(label)
                .formLabelStyle()
            TextField(placeholder, value: $num, format: .number)
                .formInputFieldStyle()
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(isError ? .red : .clear, lineWidth: 1)
                )
        }
    }
}

#Preview {
    @Previewable @State var num: Int? = 0
    FormNumberView(label: "ラベル", placeholder: "プレースホルダー", num: $num, isError: true)
}
