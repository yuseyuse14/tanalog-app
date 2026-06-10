//
//  QuerySearch.swift
//  StockManager
//

import SwiftUI

struct QuerySearch {
    var text: String = ""
    var isActive: Bool = false

    func matches(_ target: String) -> Bool{
        target.localizedStandardContains(text)
    }
}
