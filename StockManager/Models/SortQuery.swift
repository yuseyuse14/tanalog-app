//
//  SortQuery.swift
//  StockManager
//

import Foundation

struct SortQuery {
    var type: SortType = .order
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

enum SortType: CaseIterable {
    case order, name, num

    var title: String {
        switch self {
        case .order: return "デフォルト"
        case .name: return "名前"
        case .num: return "個数"
        }
    }

    func subTitle(in sort: SortQuery) -> String {
        guard self == sort.type else { return "" }
        switch self {
        case .order:
            return sort.order == .forward ? "古い順" : "新しい順"
        case .name:
            return sort.order == .forward ? "昇順" : "降順"
        case .num:
            return sort.order == .forward ? "少ない順" : "多い順"
        }
    }
}
