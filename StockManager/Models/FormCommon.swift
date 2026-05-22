//
//  FormCommon.swift
//  StockManager
//

import SwiftUI

enum FormErrorType {
    case emptyString, emptyInt
    case notUnique(String)
    case outOfRange(Int)
    case none

    var color: Color {
        switch self {
        case .emptyString, .emptyInt, .outOfRange:
            return .red
        case .notUnique:
            return .yellow
        default: return .clear
        }
    }

    var message: String? {
        switch self {
        case .emptyString, .emptyInt:
            return "必須項目です"
        case .notUnique(let str):
            return "「\(str)」は既に使われています"
        case .outOfRange(let int):
            return "\(int)以上の数値を入力してください"
        default: return nil
        }
    }
}
