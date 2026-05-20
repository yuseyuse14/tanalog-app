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
            Text(label)
                .formLabelStyle()
            TextField(placeholder, value: $num, format: .number)
                .formInputFieldStyle(borderColor: errorType.color)
        }
    }
}

#Preview {
    @Previewable @State var num: Int? = 0
    FormNumberView(label: "ラベル", placeholder: "プレースホルダー", num: $num, errorType: .none)
}
