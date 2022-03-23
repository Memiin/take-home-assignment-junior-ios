//
//  CartView.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import SwiftUI

struct CartView: View {
    @StateObject var cartViewModel = CartViewModel()
    @State private var searchView = false
    var body: some View {
        ZStack{
            NavigationLink(destination: ProductSelectView(cartViewModel: self.cartViewModel),
                           isActive: $searchView) {
                
            }
            
            
            ScrollView {
            
        
        }
        }.navigationTitle("cartTitle")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                         
                    Button(action: {
                        self.searchView.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.blue)
                    }
                       
                
                }
                   }
        .task {
                await cartViewModel.getProducts()
            }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
