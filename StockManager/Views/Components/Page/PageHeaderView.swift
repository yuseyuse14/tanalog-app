//
//  PageHeaderView.swift
//  StockManager
//

import SwiftUI

struct PageHeaderView<Content: View>: View {
    let titleLabel: String
    @ViewBuilder let items: () -> Content

    var body: some View {
        HStack(spacing: 0) {
            Text(titleLabel)
                .pageHeadlineStyle()
            Spacer()
            items()
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 16)

        Divider()
    }
}

#Preview {
    PageHeaderView(titleLabel: "タイトル") {
        Button("ボタン"){}
        Button("ボタン2"){}
    }
}
