//
//  PageStyle.swift
//  StockManager
//

import SwiftUI

// MARK: 見出し用
struct PageHeadlineStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 40, weight: .semibold))
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: ヘッダーボタン用
extension Image {
    func pageHeaderButtonStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 28, height: 28)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .foregroundStyle(.foreground)
    }
}

// MARK: コンテンツ用
struct PageContentStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
    }
}

extension View {
    func pageHeadlineStyle() -> some View {
        self.modifier(PageHeadlineStyle())
    }

    func pageContentStyle() -> some View {
        self.modifier(PageContentStyle())
    }
}
