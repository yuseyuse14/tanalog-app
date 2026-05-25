//
//  TagView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

struct TagView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Tag.name) private var tags: [Tag]

    @State var showCreate: Bool = false
    @State var isEditMode: Bool = false

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
                        ZStack(alignment: .topLeading) {
                            // タグ
                            Text(tag.name)
                                .font(.title)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 5)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(15)

                            // 削除ボタン
                            if isEditMode {
                                Button {
                                    withAnimation(.bouncy(duration: 0.8)) {
                                        deleteTag(tag)
                                    }
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.title2)
                                        .foregroundStyle(Color(.label), Color(.systemGray4))
                                }
                                .offset(x: -10, y: -10)
                            }
                        }
                        // 震えるアニメーション
                        .phaseAnimator([1.2, -1.2]) { content, value in
                            content
                                .rotationEffect(.degrees(isEditMode ? value : 0))
                        } animation: { _ in
                                .linear(duration: 0.08)
                        }
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            // 長押し
            .simultaneousGesture(
                LongPressGesture(minimumDuration: 0.5)
                    .onEnded { _ in
                        isEditMode = true
                    }
            )
        }
        .onTapGesture {
            if isEditMode {
                withAnimation(.easeOut(duration: 0.24)) {
                    isEditMode = false
                }
            }
        }
        .sheet(isPresented: $showCreate) {
            TagCreateView()
        }
    }

    private func deleteTag(_ tag: Tag) {
        context.delete(tag)
        try? context.save()
    }
}

#Preview {
    TagView()
        .modelContainer(.preview)
}
