//
//  StockLowView.swift
//  StockManager
//

import SwiftUI

struct StockLowView: View {
    let stock: Stock
    @Binding var selectedStock: Stock?

    var isSelected: Bool {
        stock == selectedStock
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                // 在庫状態
                RoundedRectangle(cornerRadius: 4)
                    .fill(stock.status.color)
                    .frame(width: 8, height: 30)
                // 在庫名
                Text(stock.name)
                    .font(.title)
                    .frame(maxWidth: .infinity)
                // マイナス
                Button {
                    stock.decrement()
                } label: {
                    Image(systemName: "minus.square")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                // 個数
                Text("\(stock.num)")
                    .font(.title)
                    .monospacedDigit()
                    .frame(width: 55)
                // プラス
                Button {
                    stock.increment()
                } label: {
                    Image(systemName: "plus.square")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isSelected ? Color(.systemGray).opacity(0.28) : Color.clear)
            )
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.linear(duration: 0.16)) {
                    selectedStock = stock
                }
            }

            if !isSelected {
                Divider()
                    .padding(.horizontal, 28)
            }
        }
    }
}

#Preview {
    @Previewable @State var previewSelected: Stock? = Stock.Sample.beef
    StockLowView(stock: Stock.Sample.beef, selectedStock: $previewSelected)
}
