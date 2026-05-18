//
//  FormNumberView.swift
//  StockManager
//

import SwiftUI

struct FormNumberView: View {
    let label: String
    let placeholder: String
    @Binding var num: Int?
    let borderColor: Color

    var body: some View {
        HStack(spacing: 0) {
            Text(label)
                .formLabelStyle()
            TextField(placeholder, value: $num, format: .number)
                .formInputFieldStyle(borderColor: borderColor)
        }
    }
}

#Preview {
    @Previewable @State var num: Int? = 0
    FormNumberView(label: "ラベル", placeholder: "プレースホルダー", num: $num, borderColor: .red)
}
