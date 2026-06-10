//
//  StockQuery.swift
//  StockManager
//

import Foundation

struct StockQuery {
    var search: QuerySearch = QuerySearch()
    var filter: QueryFilter = QueryFilter()
    var sort: QuerySort = QuerySort()

    func search(_ stocks: [Stock]) -> [Stock] {
        if search.text.isEmpty { return stocks }
        return stocks.filter { stock in
            search.matches(stock.searchKey) ||
            stock.tags.contains { tag in
                search.matches(tag.name)
            }
        }
    }

    func filter(_ stocks: [Stock]) -> [Stock] {
        if filter.tags.isEmpty { return stocks }
        return stocks.filter { stock in
            filter.tags.isSubset(of: stock.tags)
        }
    }

    func sort(_ stocks: [Stock]) -> [Stock] {
        let sortedStock = switch sort.type {
        case .order:
            stocks.sorted { $0.order < $1.order}
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
        let searchedStocks = search(stocks)
        let filteredStocks = filter(searchedStocks)
        let sortedStocks = sort(filteredStocks)
        return sortedStocks
    }
}
