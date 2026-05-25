//
//  SampleData.swift
//  StockManager
//

import Foundation

// MARK: - ここからStockのサンプルデータ
extension Stock {
    enum Sample {
        static let whisky = Stock(name: "ビール", num: 3, minNum: 1)
        static let beef = Stock(name: "ローストビーフ", num: 8, minNum: 4)
        static let katsuo = Stock(name: "鰹", num: 14, minNum: 6)
        static let onion = Stock(name: "玉ねぎ", num: 4, minNum: 2)
        static let egg = Stock(name: "卵", num: 12, minNum: 6)
        static let ChocoCake = Stock(name: "バニラアイス", num: 12, minNum: 4)
        static let rap = Stock(name: "ラップ", num: 10, minNum: 3)
        static let all = [whisky, beef, katsuo, onion, egg, ChocoCake, rap]
    }
}

// MARK: ここからStockのリレーション
extension Stock {
    struct Relation {
        let stock: Stock
        let tags: [Tag]
        let unit: StockUnit
    }

    static let relations: [Relation]  = [
        Relation(stock: .Sample.whisky,
                 tags: [.Sample.drink, .Sample.alcohol],
                 unit: .Sample.bottle),
        Relation(stock: .Sample.beef,
                 tags: [.Sample.food, .Sample.meat],
                 unit: .Sample.piece),
        Relation(stock: .Sample.katsuo,
                 tags: [.Sample.food, .Sample.fish],
                 unit: .Sample.bottle),
        Relation(stock: .Sample.onion,
                 tags: [.Sample.food, .Sample.vegetable],
                 unit: .Sample.piece),
        Relation(stock: .Sample.egg,
                 tags: [.Sample.food],
                 unit: .Sample.piece),
        Relation(stock: .Sample.ChocoCake,
                 tags: [.Sample.food, .Sample.dessert],
                 unit: .Sample.piece),
        Relation(stock: .Sample.rap,
                 tags: [.Sample.consumable, .Sample.other],
                 unit: .Sample.bottle),
    ]
}

// MARK: ここからTagのサンプルデータ
extension Tag {
    enum Sample {
        static let food = Tag(name: "食べ物", order: 1)
        static let vegetable = Tag(name: "野菜", order: 2)
        static let meat = Tag(name: "肉", order: 3)
        static let fish = Tag(name: "魚介類", order: 4)
        static let drink = Tag(name: "飲み物", order: 5)
        static let dessert = Tag(name: "デザート", order: 6)
        static let alcohol = Tag(name: "アルコール", order: 7)
        static let softDrink = Tag(name: "ソフトドリンク", order: 8)
        static let seasoning = Tag(name: "調味料", order: 9)
        static let consumable = Tag(name: "消耗品", order: 10)
        static let other = Tag(name: "その他", order: 11)
        static let all = [food, vegetable, meat, fish, drink, dessert, alcohol, softDrink, seasoning, consumable, other]
    }
}

// MARK: ここからStockUnitのサンプルデータ
extension StockUnit {
    enum Sample {
        static let piece = StockUnit(name: "個", order: 1)
        static let bottle = StockUnit(name: "本", order: 2)
        static let sheet = StockUnit(name: "枚", order: 3)
        static let all = [piece, bottle, sheet]
    }
}
