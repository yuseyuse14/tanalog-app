//
//  StockQuery.swift
//  StockManager
//

import Foundation

struct StockQuery {
    var sort: SortQuery = SortQuery()
    var selectedTags: Set<Tag> = []

    func filter(_ stocks: [Stock]) -> [Stock] {
        if selectedTags.isEmpty { return stocks }
        return stocks.filter { stock in
            selectedTags.isSubset(of: stock.tags)
        }
    }

    func sort(_ stocks: [Stock]) -> [Stock] {
        let sortedStock = switch sort.type {
        case .name:
            stocks.sorted { $0.name < $1.name }
        case .num:
            stocks.sorted { $0.num < $1.num }
        }

        return switch sort.order {
        case .forward: sortedStock
        case .reverse: sortedStock.reversed()
        }
    }

    func apply(to stocks: [Stock]) -> [Stock] {
        let filteredStocks = filter(stocks)
        let sortedStocks = sort(filteredStocks)
        return sortedStocks
    }
}
