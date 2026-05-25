//
//  FormTagView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

struct FormTagView: View {
    @Query(sort: \Tag.order) private var tags: [Tag]

    @Binding var selectedTags: Set<Tag>

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HFlow(alignment: .center, spacing: 12) {
                ForEach(tags) { tag in
                    Text(tag.name)
                        .font(.title3)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(
                            selectedTags.contains(tag) ? RoundedRectangle(cornerRadius: 16)
                                .fill(.blue.opacity(0.4)) : RoundedRectangle(cornerRadius: 16)
                                .fill(.blue.opacity(0.05))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.blue.opacity(0.4))
                        )
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                if selectedTags.contains(tag) {
                                    selectedTags.remove(tag)
                                } else {
                                    selectedTags.insert(tag)
                                }
                            }
                        }
                }
            }
            .formContentStyle()
        }
    }
}

#Preview {
    @Previewable @State var previewTags: Set<Tag> = []
    FormTagView(selectedTags: $previewTags)
        .modelContainer(.preview)
}
