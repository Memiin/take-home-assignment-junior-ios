//
//  CartItemView.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import SwiftUI
import URLImage


struct CartItemView: View {
    @Binding var cartItem: CartItemModel
    @State private var showAlert = false
    
    var body: some View {
        HStack {
            
            URLImage(URL(string: cartItem.product.image_url)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.contentShape(Rectangle())
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(cartItem.product.name)
                
                HStack {
                    Button{
                        if(self.cartItem.quantity > 1) {
                            self.cartItem.quantity -= 1
                        }
                        else{
                            self.showAlert.toggle()
                        }
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.red)
                    }
                    .buttonStyle(.borderless)
                    
                    Text("\(cartItem.quantity)")
                    
                    Button{
                        self.cartItem.quantity += 1
                    } label: {
                        Image(systemName: "plus.app.fill")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(.borderless)
                }
                
                Text("\(cartItem.quantity * cartItem.product.retail_price)")
                
            }
            .font(.title3)
            .frame(maxHeight: .infinity)
            
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("confirm"),
                  message: Text("removeMessage"),
                  primaryButton: .default(
                    
                    Text("No"),
                    action: {
                        self.showAlert.toggle()
                    }
                  ),
                  secondaryButton: .destructive(
                    Text("Yes"),
                    action:{
                        self.cartItem.quantity = 0
                    }))
        }
    }
}
