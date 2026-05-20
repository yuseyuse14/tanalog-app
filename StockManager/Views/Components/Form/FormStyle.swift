//
//  FormStyle.swift
//  StockManager
//

import SwiftUI

// MARK: 見出し用
struct FormHeadlineStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.medium)
            .padding(.vertical, 4)
            .padding(.horizontal, 4)
    }
}

// MARK: ラベル用
struct FormLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(.vertical, 2)
            .padding(.horizontal, 12)
    }
}

// MARK: コンテンツ用
struct FormContentStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 2)
            .padding(.horizontal, 4)
            .frame(maxWidth: .infinity)
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
            .formContentStyle()
    }
}

extension View {
    func formLabelStyle() -> some View {
        self.modifier(FormLabelStyle())
    }
    func formInputFieldStyle(borderColor: Color = .clear) -> some View {
        self.modifier(FormInputFieldStyle(borderColor: borderColor))
    }
    func formHeadlineStyle() -> some View {
        self.modifier(FormHeadlineStyle())
    }
    func formContentStyle() -> some View {
        self.modifier(FormContentStyle())
    }
}
