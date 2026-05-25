//
//  SampleData.swift
//  StockManager
//

import Foundation

// MARK: - ここからStockのサンプルデータ
extension Stock {
    enum Sample {
        static let whisky = Stock(name: "ウイスキー", num: 3, minNum: 1)
        static let beef = Stock(name: "ローストビーフ", num: 8, minNum: 4)
        static let katsuo = Stock(name: "鰹", num: 14, minNum: 6)
        static let onion = Stock(name: "玉ねぎ", num: 4, minNum: 2)
        static let egg = Stock(name: "卵", num: 12, minNum: 6)
        static let ChocoCake = Stock(name: "ガトーショコラ", num: 12, minNum: 4)
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
        static let food = Tag(name: "食べ物")
        static let vegetable = Tag(name: "野菜")
        static let meat = Tag(name: "肉")
        static let fish = Tag(name: "魚介類")
        static let drink = Tag(name: "飲み物")
        static let dessert = Tag(name: "デザート")
        static let alcohol = Tag(name: "アルコール飲料")
        static let softDrink = Tag(name: "ソフトドリンク")
        static let seasoning = Tag(name: "調味料")
        static let consumable = Tag(name: "消耗品")
        static let other = Tag(name: "その他")
        static let all = [food, vegetable, meat, fish, drink, dessert, alcohol, softDrink, seasoning, consumable, other]
    }
}

// MARK: ここからStockUnitのサンプルデータ
extension StockUnit {
    enum Sample {
        static let piece = StockUnit(name: "個")
        static let bottle = StockUnit(name: "本")
        static let sheet = StockUnit(name: "枚")
        static let all = [piece, bottle, sheet]
    }
}
