//
//  TagCreateView.swift
//  StockManager
//

import SwiftUI

struct TagCreateView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var form: TagForm = TagForm()

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 12) {
                // ヘッダー
                SheetHeaderView(
                    titleLabel: "タグ追加",
                    leftLabel: "キャンセル",
                    rightLabel: "追加",
                    leftAction: { dismiss() },
                    rightAction: { }
                )

                // タグ詳細
                Text("タグの詳細")
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    TagCreateView()
}
