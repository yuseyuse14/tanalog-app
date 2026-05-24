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

    func selected(as buttonType: SortType) -> Bool {
        sortType == buttonType
    }
}

enum SortType {
    case name, num

    var title: String {
        switch self {
        case .name: return "名前"
        case .num: return "個数"
        }
    }

    func subTitle(in query: StockQuery) -> String {
        guard self == query.sortType else { return "" }
        switch self {
        case .name:
            return query.sortOrder == .forward ? "昇順" : "降順"
        case .num:
            return query.sortOrder == .forward ? "小さい順" : "大きい順"
        }
    }
}
