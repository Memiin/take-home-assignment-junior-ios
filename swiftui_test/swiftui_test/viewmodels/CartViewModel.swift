//
//  CartViewModel.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import Foundation
import SwiftUI

@MainActor
final class CartViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
    @Published var cart = CartModel()
    
    func getProducts() async {
        do {
            self.products = await try ProductModel.getProducts()
        }
        catch{
            print(error)
        }
    }
    
    init(){
        
    }
    
    func updateProductList(_ productModel: ProductModel) {
        
        if let productIndex = self.cart.products.firstIndex(where: {$0.product.id == productModel.id}) {
            self.cart.products.remove(at: productIndex)
        }
        else {
            self.cart.products.append(CartItemModel(product: productModel, quantity: 1))
        }
        
    }
    
    func isProductInCart(_ id: String) -> Bool {
        if let productIndex = self.cart.products.firstIndex(where: {$0.product.id == id}) {
            return true
        }
        else {
            return false
        }
    }
    
}
