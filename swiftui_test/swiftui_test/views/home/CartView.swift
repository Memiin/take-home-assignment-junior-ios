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
                           isActive: $searchView) {}
            
            VStack {
                List() {
                    ForEach(self.$cartViewModel.cart){ $cartItem in
                        CartItemView(cartItem: $cartItem)//
                            .listRowBackground(Color(.systemGray5))
                            .id(UUID())
                    }
                }
                Spacer()
                HStack{
                    Text("total")
                    Spacer()
                    Text("$\(self.cartViewModel.total)")
                }
                .padding()
                .font(.title2)
            }
            .onChange(of: self.cartViewModel.cart) { newValue in
                self.cartViewModel.removeProduct()
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
    }
}
