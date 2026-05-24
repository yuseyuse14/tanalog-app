//
//  SortQuery.swift
//  StockManager
//

import Foundation

struct SortQuery {
    var type: SortType = .name
    var order: SortOrder = .forward

    mutating func selectType(_ newType: SortType) {
        if type == newType {
            order = (order == .forward) ? .reverse : .forward
        } else {
            type = newType
            order = .forward
        }
    }

    func selected(as buttonType: SortType) -> Bool {
        type == buttonType
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

    func subTitle(in sort: SortQuery) -> String {
        guard self == sort.type else { return "" }
        switch self {
        case .name:
            return sort.order == .forward ? "昇順" : "降順"
        case .num:
            return sort.order == .forward ? "小さい順" : "大きい順"
        }
    }
}
