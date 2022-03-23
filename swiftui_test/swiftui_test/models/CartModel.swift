//
//  CartModel.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import Foundation

struct CartItemModel: Identifiable, Hashable {
    let id = UUID()
    let product: ProductModel
    var quantity: Int
}
