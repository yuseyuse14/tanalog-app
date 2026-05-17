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
            .padding(4)
            .frame(maxWidth: .infinity)
    }
}

// MARK: 入力フィールド用
struct FormInputFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.medium)
            .padding(4)
            .frame(maxWidth: .infinity)
    }
}

extension View {
    func formLabelStyle() -> some View {
        self.modifier(FormLabelStyle())
    }
    func formInputFieldStyle() -> some View {
        self.modifier(FormInputFieldStyle())
    }
}
