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

extension View {
    func pageHeadlineStyle() -> some View {
        self.modifier(PageHeadlineStyle())
    }
}
