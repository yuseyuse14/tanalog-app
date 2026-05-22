//
//  TagView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

struct TagView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Tag.name) private var tags: [Tag]

    var body: some View {
        VStack(spacing: 0) {
            Text("タグ一覧")
                .pageHeadlineStyle()
            Divider()
            ScrollView {
                HFlow(alignment: .center, spacing: 16) {
                    ForEach(tags) { tag in
                        Text(tag.name)
                            .font(.title)
                            .padding(.horizontal, 12)
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
        .modelContainer(.preview)
}
