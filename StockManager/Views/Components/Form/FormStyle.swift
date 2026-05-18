//
//  FormStyle.swift
//  StockManager
//

import SwiftUI

// MARK: ラベル用
struct FormLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(.vertical, 2)
            .padding(.horizontal, 4)
    }
}

// MARK: 入力フィールド用
struct FormInputFieldStyle: ViewModifier {
    var borderColor: Color
    func body(content: Content) -> some View {
        content
            .fontWeight(.medium)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(borderColor, lineWidth: 1)
            )
            .padding(.vertical, 2)
            .padding(.horizontal, 4)
            .frame(maxWidth: .infinity)
    }
}

extension View {
    func formLabelStyle() -> some View {
        self.modifier(FormLabelStyle())
    }
    func formInputFieldStyle(borderColor: Color = .clear) -> some View {
        self.modifier(FormInputFieldStyle(borderColor: borderColor))
    }
}
