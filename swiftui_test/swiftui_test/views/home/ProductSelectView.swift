//
//  ProductSelectView.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import SwiftUI

struct ProductSelectView: View {
    @ObservedObject var cartViewModel: CartViewModel
    let gridColumnTemplate: [GridItem] = [GridItem(.flexible(), spacing: 5)]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridColumnTemplate, spacing: 20){
                ForEach(cartViewModel.products){ product in
                    ProductItemView(product: product, inCart: self.cartViewModel.isProductInCart(product.id))
                        .onTapGesture {
                            cartViewModel.updateProductList(product)
                        }
                        .id(UUID())
                        .padding()
                }
            }
        }.navigationTitle("productSelectTitle")
    }
}
