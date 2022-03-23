//
//  CartModel.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import Foundation


struct CartModel: Identifiable {
    let id = UUID()
    var products: [CartItemModel] = []
    
}

struct CartItemModel: Identifiable {
    let id = UUID()
    let product: ProductModel
    var quantity: Int
}
