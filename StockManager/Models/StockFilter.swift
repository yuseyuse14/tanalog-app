//
//  StockFilter.swift
//  StockManager
//

import Foundation

struct StockQuery {
    var sortType: SortType = .name
    var sortOrder: SortOrder = .forward

    mutating func selectSortType(_ newType: SortType) {
        if sortType == newType {
            sortOrder = (sortOrder == .forward) ? .reverse : .forward
        } else {
            sortType = newType
            sortOrder = .forward
        }
    }

    func sort(stocks: [Stock]) -> [Stock] {
        let sortedStock = switch sortType {
        case .name:
            stocks.sorted { $0.name < $1.name }
        case .num:
            stocks.sorted { $0.num < $1.num }
        }

        return switch sortOrder {
        case .forward: sortedStock
        case .reverse: sortedStock.reversed()
        }
    }
}

enum SortType {
    case name, num
}
