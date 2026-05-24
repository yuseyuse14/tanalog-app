//
//  StockQuery.swift
//  StockManager
//

import Foundation

struct StockQuery {
    var sort: SortQuery = SortQuery()

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
}
