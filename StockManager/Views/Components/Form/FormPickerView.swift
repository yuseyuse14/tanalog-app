//
//  FormPickerView.swift
//  StockManager
//

import SwiftUI

struct FormPickerView: View {
    let label: String
    @Binding var selectedItem: String
    var errorType: StockForm.FormError.ErrorType

    let items = ["個", "本", "枚", "袋"]

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
            // Picker風
            Menu {
                ForEach(items, id: \.self) { item in
                    Button(item) {
                        selectedItem = item
                    }
                }
            } label: {
                HStack {
                    Text(selectedItem)
                }
                Spacer()
                Image(systemName: "chevron.up.chevron.down")
            }
        }
    }
}

#Preview {
    @Previewable @State var previewItem: String = "初期値"
    FormPickerView(label: "ラベル", selectedItem: $previewItem, errorType: .none)
}
