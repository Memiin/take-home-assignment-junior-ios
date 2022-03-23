//
//  CartViewModel.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class CartViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
    @Published var cart: [CartItemModel] = []
    @Published var total: Int = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    func getProducts() async {
        do {
            self.products = try await ProductModel.getProducts()
        }
        catch{
            print(error)
        }
    }
    
    init() {
        
        self.$cart.sink(receiveValue: { items in
            var total = 0
            for item in items {
                total += item.quantity * item.product.retail_price
            }
            self.total = total
        }).store(in: &cancellables)
        
        Task {
            await getProducts()
        }
    }
    
    func updateProductList(_ productModel: ProductModel) {
        
        if let productIndex = self.cart.firstIndex(where: {$0.product.id == productModel.id}) {
            self.cart.remove(at: productIndex)
        }
        else {
            self.cart.append(CartItemModel(product: productModel, quantity: 1))
        }
    }
    
    func isProductInCart(_ id: String) -> Bool {
        if let productIndex = self.cart.firstIndex(where: {$0.product.id == id}) {
            return true
        }
        else {
            return false
        }
    }
    
    func removeProduct() {
        self.cart = self.cart.filter {$0.quantity > 0}
    }
    
}
