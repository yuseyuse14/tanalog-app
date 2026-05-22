//
//  TagForm.swift
//  StockManager
//

import SwiftUI

struct TagForm {
    var name: String = ""
    var saveName: String { name.trimming(for: .edge) }

    // UI状態
    var showError: Bool = false

    // 関連データ
    private var preTag: Tag? = nil
    private var tagNames: Set<String> = []

    // Tagで初期化
    mutating func apply(from tag: Tag, allTags: [Tag]) {
        name = tag.name
        preTag = tag
        setTagNames(from: allTags)
    }

    // 全タグのタグ名Setを作成
    mutating func setTagNames(from allTags: [Tag]) {
        tagNames = Set(allTags.map { $0.name.trimming(for: .all) })
    }

    func canSave(in allTags: [Tag]) -> Bool {
        validation.allFilled && validation.nameUnique
    }
}

// MARK: ここから入力検証ロジック
extension TagForm {
    struct Validation {
        let form: TagForm
        let preTag: Tag?

        // 入力確認
        var nameFilled: Bool { !form.saveName.isEmpty }
        var allFilled: Bool { nameFilled }

        // ユニーク確認
        var nameUnique: Bool {
            guard nameFilled else { return true }

            if let preTag, preTag.name.trimming(for: .all) == form.name.trimming(for: .all) {
                return true
            }
            return !form.tagNames.contains(form.name.trimming(for: .all))
        }
    }

    var validation: Validation {
        Validation(form: self, preTag: preTag)
    }
}

// MARK: ここからエラー
extension TagForm {
    struct FormError {
        let form: TagForm

        var name: FormErrorType {
            if form.showError && !form.validation.nameFilled { return .emptyString }
            else if form.showError && !form.validation.nameUnique { return .notUnique(form.name.trimming(for: .all)) }
            else { return .none }
        }
    }

    var error: FormError {
        FormError(form: self)
    }
}

// MARK: ここからプレースホルダー
extension TagForm {
    struct Placeholder {
        let preTag: Tag?

        var name: String { preTag?.name ?? "例：日本酒" }
    }

    var placeholder: Placeholder {
        Placeholder(preTag: preTag)
    }
}
