//
//  ProductModel.swift
//  TS_app
//
//  Created by Eugene Zvyagin on 17.12.2023.
//

import SwiftUI

// Product Model
struct Product: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

// Sample Products
var productList = [
    Product(name: "Model 1", category: "Refractor", image: "image 1", color: .purple, price: 800),
    Product(name: "Model 2", category: "Refractor", image: "image 2", color: .gray, price: 500),
    Product(name: "Model 3", category: "Refractor", image: "image 3", color: .cyan, price: 1200),
    Product(name: "Model 4", category: "Reflector", image: "image 4", color: .orange, price: 450),
    Product(name: "Model 5", category: "Reflector", image: "image 5", color: .pink, price: 860),
    Product(name: "Model 6", category: "Catadioptric", image: "image 6", color: .yellow, price: 1300),
    Product(name: "Model 7", category: "Catadioptric", image: "image 7", color: .blue, price: 1000),
    Product(name: "Model 8", category: "Catadioptric", image: "image 8", color: .green, price: 700),
]
