//
//  FormPickerView.swift
//  StockManager
//

import SwiftUI

struct FormPickerView: View {
    let label: String
    let placeholder: String
    let items: [StockUnit]
    @Binding var selectedItem: StockUnit?
    var errorType: FormErrorType

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
                ForEach(items) { item in
                    Button {
                        selectedItem = item
                    } label: {
                        HStack {
                            if selectedItem == item {
                                Image(systemName: "checkmark")
                            }
                            Text(item.name)
                        }
                    }
                }
            } label: {
                HStack {
                    Text(selectedItem?.name ?? placeholder)
                        .foregroundStyle(selectedItem == nil ? Color(.systemGray2) : Color(.label))
                    Spacer()
                    Image(systemName: "chevron.up.chevron.down")
                        .foregroundStyle(Color(.label))
                }
                .formInputFieldStyle(borderColor: errorType.color)
            }
        }
    }
}

#Preview {
    @Previewable @State var previewItem: StockUnit?
    FormPickerView(label: "ラベル", placeholder: "プレースホルダー", items: StockUnit.Sample.all, selectedItem: $previewItem, errorType: .none)
}
