//
//  CategoryModel.swift
//  TS_app
//
//  Created by Eugene Zvyagin on 17.12.2023.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "refractor", title: "Refractor"),
    CategoryModel(icon: "reflector", title: "Reflector"),
    CategoryModel(icon: "catadioptric", title: "Catadioptric")
]
