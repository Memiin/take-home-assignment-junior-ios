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
        //ZStack {
            
            ScrollView{
                LazyVGrid(columns: gridColumnTemplate){
                    ForEach(cartViewModel.products){ product in
                        ProductItemView(product: product, inCart: self.cartViewModel.isProductInCart(product.id))
                            .onTapGesture {
                                                cartViewModel.updateProductList(product)
                            
                                            }.id(UUID())
                    }
                }
                
            
//            List (cartViewModel.products) { product in
//
//                Section { ProductItemView(product: product, inCart: self.cartViewModel.isProductInCart(product.id)).padding()
////                        .listRowInsets(EdgeInsets(
////                    top: 0,
////                    leading: 0,
////                    bottom: 0,
////                    trailing: 0)).padding().background(.thickMaterial)
//
//                }
//                .onTapGesture {
//                    cartViewModel.updateProductList(product)
//
//                }
//                .id(UUID())
           // }.listStyle(.insetGrouped)
            //.listStyle(.plain)
        }.navigationTitle("productSelectTitle")
}


}
