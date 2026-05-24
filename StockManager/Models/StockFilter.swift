//
//  StockFilter.swift
//  StockManager
//

import Foundation

struct StockQuery {
    var sortType: SortType = .name

    mutating func selectSortType(_ newType: SortType) {
        if sortType == newType {
        } else {
            sortType = newType
        }
    }

    func sort(stocks: [Stock]) -> [Stock] {
        return switch sortType {
        case .name:
            stocks.sorted { $0.name < $1.name }
        case .num:
            stocks.sorted { $0.num < $1.num }
        }
    }
}

enum SortType {
    case name, num
}
