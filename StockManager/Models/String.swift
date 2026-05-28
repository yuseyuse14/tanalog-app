//
//  String.swift
//  StockManager
//

import Foundation

extension String {
    enum TrimType {
        case edge
        case all
    }

    func trimming(for type: TrimType) -> String {
        switch type {
        case .edge:
            return self.trimmingCharacters(in: .whitespacesAndNewlines)
        case .all:
            return self.filter{ !$0.isWhitespace }
        }
    }
}
