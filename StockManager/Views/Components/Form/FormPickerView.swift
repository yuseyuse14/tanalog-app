//
//  FormPickerView.swift
//  StockManager
//

import SwiftUI

struct FormPickerView: View {
    let label: String
    let items: [StockUnit]
    @Binding var selectedItem: StockUnit?
    var errorType: StockForm.FormError.ErrorType

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
                    Text(selectedItem?.name ?? "")
                    Spacer()
                    Image(systemName: "chevron.up.chevron.down")
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var previewItem: StockUnit?
    FormPickerView(label: "ラベル", items: [StockUnit(name: "個"), StockUnit(name: "本")], selectedItem: $previewItem, errorType: .none)
}
