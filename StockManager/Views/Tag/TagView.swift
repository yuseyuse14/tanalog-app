//
//  TagView.swift
//  StockManager
//

import SwiftUI
import Flow

struct TagView: View {
    let tags = ["食べ物", "スピード", "揚げ物", "肉", "ご飯もの", "パスタ", "デザート",
                "飲み物", "ビール", "ハイボール", "ウイスキー", "日本酒", "ワイン", "ソフトドリンク"]

    var body: some View {
        VStack(spacing: 0) {
            Text("タグ一覧")
                .font(.system(size: 40, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
            Divider()
            ScrollView {
                HFlow(alignment: .center, spacing: 16) {
                    ForEach(tags, id: \.self) { tag in
                        Text(tag)
                            .font(.title)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(15)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    TagView()
}
