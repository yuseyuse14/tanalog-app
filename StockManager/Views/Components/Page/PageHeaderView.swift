//
//  PageHeaderView.swift
//  StockManager
//

import SwiftUI

struct PageHeaderView<Content: View>: View {
    let titleLabel: String
    @ViewBuilder let items: () -> Content

    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text(titleLabel)
                .pageHeadlineStyle()
            Spacer()
            HStack(spacing: 8) {
                items()
            }
        }
        .pageContentStyle()

        Divider()
    }
}

#Preview {
    PageHeaderView(titleLabel: "タイトル") {
        Button("ボタン"){}
        Button("ボタン2"){}
    }
}
