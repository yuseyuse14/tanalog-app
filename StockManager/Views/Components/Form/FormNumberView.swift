//
//  FormNumberView.swift
//  StockManager
//

import SwiftUI

struct FormNumberView: View {
    let label: String
    let placeholder: String
    @Binding var num: Int?
    let errorType: StockForm.FormError.ErrorType

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text(label)
                    .formLabelStyle()
                if let message = errorType.message {
                    Text(message)
                        .formErrorStyle()
                }
            }
            TextField(placeholder, value: $num, format: .number)
                .formInputFieldStyle(borderColor: errorType.color)
        }
    }
}

#Preview {
    @Previewable @State var num: Int? = 0
    FormNumberView(label: "ラベル", placeholder: "プレースホルダー", num: $num, errorType: .none)
}
