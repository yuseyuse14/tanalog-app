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

// MARK: ここからUIロジック
extension StockQuery {
    func subTitle(for buttonType: SortType) -> String {
        guard sortType == buttonType else { return "" }
        switch sortType {
        case .name:
            return sortOrder == .forward ? "昇順" : "降順"
        case .num:
            return sortOrder == .forward ? "小さい順" : "大きい順"
        }
    }
}
enum SortType {
    case name, num
}
