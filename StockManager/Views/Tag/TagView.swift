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

    @State var showCreate: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            PageHeaderView(titleLabel: "タグ一覧") {
                // 新規追加
                Button {
                    showCreate.toggle()
                } label: {
                    Image(systemName: "plus")
                        .pageHeaderButtonStyle()
                }
            }
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
        .sheet(isPresented: $showCreate) {
            TagCreateView()
        }
    }
}

#Preview {
    TagView()
        .modelContainer(.preview)
}
