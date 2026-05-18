//
//  FormTagView.swift
//  StockManager
//

import SwiftUI
import SwiftData
import Flow

struct FormTagView: View {
    @Query(sort: \Tag.name) private var tags: [Tag]

    let label: String
    let icon: String?
    @Binding var selectedTags: Set<Tag>

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(label, systemImage: icon ?? "")
                .formHeadlineStyle()
            HFlow(alignment: .center, spacing: 12) {
                ForEach(tags) { tag in
                    Text(tag.name)
                        .font(.title3)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(
                            selectedTags.contains(tag) ? RoundedRectangle(cornerRadius: 15)
                                .fill(.blue.opacity(0.4)) : RoundedRectangle(cornerRadius: 15)
                                .fill(.blue.opacity(0.05))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.blue.opacity(0.4))
                        )
                        .onTapGesture {
                            if selectedTags.contains(tag) {
                                selectedTags.remove(tag)
                            } else {
                                selectedTags.insert(tag)
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
    FormTagView(label: "ラベル", icon: "tag", selectedTags: $previewTags)
        .modelContainer(.preview)
}
