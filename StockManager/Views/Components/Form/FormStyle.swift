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

// MARK: エラー用
struct FormErrorStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.red)
            .padding(.vertical, 2)
            .padding(.horizontal, 4)
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
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color(.systemBackground))
                    .stroke(Color(.systemGray2), lineWidth: 0.5)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(borderColor, lineWidth: 1)
            )
            .formContentStyle()
    }
}

extension View {
    func formHeadlineStyle() -> some View {
        self.modifier(FormHeadlineStyle())
    }

    func formLabelStyle() -> some View {
        self.modifier(FormLabelStyle())
    }

    func formErrorStyle() -> some View {
        self.modifier(FormErrorStyle())
    }

    func formContentStyle() -> some View {
        self.modifier(FormContentStyle())
    }

    func formInputFieldStyle(borderColor: Color = .clear) -> some View {
        self.modifier(FormInputFieldStyle(borderColor: borderColor))
    }
}
