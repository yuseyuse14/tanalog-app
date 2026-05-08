//
//  StockEditView.swift
//  StockManager
//

import SwiftUI
import SwiftData

struct StockEditView: View {
    @Bindable var stock: Stock

    var body: some View {
        Text(stock.name)
    }
}

#Preview {
    StockEditView(stock: Stock.samples[0])
        .modelContainer(.preview)
}
