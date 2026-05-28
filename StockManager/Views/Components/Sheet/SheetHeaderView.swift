//
//  SheetHeaderView.swift
//  StockManager
//

import SwiftUI

struct SheetHeaderView: View {
    let titleLabel: String
    let leftLabel: String
    let rightLabel: String
    let leftAction: () -> Void
    let rightAction: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Text(titleLabel)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack(spacing: 0) {
                    Button(role: .cancel) {
                        leftAction()
                    } label: {
                        Text(leftLabel)
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                    }
                    Spacer()
                    Button {
                        rightAction()
                    } label: {
                        Text(rightLabel)
                            .font(.subheadline)
                            .bold()
                            .padding(.horizontal, 8)
                    }
                }
            }
            Divider()
        }
    }
}

#Preview {
    SheetHeaderView(titleLabel: "シートヘッダー", leftLabel: "キャンセル", rightLabel: "決定", leftAction: {print("left")}, rightAction: {print("right")})
}
