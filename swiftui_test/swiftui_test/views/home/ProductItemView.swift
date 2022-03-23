//
//  ProductItemView.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import SwiftUI
import URLImage

struct ProductItemView: View {
    @State var product: ProductModel
    @State var showDescription = false
    var inCart = false
    
    var body: some View {
        VStack {
            Text(product.name)
                .font(.title)
                .foregroundColor(.accentColor)
                .padding()
            
            HStack {
                URLImage(URL(string: product.image_url)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                    
                }.contentShape(Rectangle())
            }
            
            HStack {
                Text("description")
                    .font(.title2)
                
                Image(systemName: showDescription ? "chevron.up.circle" : "chevron.down.circle")
                    .foregroundColor(.accentColor)
                
            }
            .contentShape(Rectangle())
            .onTapGesture {
                self.showDescription.toggle()
                
            }
            
            Text(product.description)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: showDescription ? .none : 0)
                .clipped()
                .animation(.easeOut)
                .transition(.slide)
            
            VStack{
                HStack {
                    Text("price")
                    
                    Spacer()
                    
                    Text("$\(product.retail_price)")
                }
                .font(.title2)
                
                if(inCart) {
                    HStack {
                        Spacer()
                        
                        Text("inCart")
                            .foregroundColor(.red)
                        
                        Image(systemName: "cart")
                            .foregroundColor(.accentColor)
                    }
                    .font(.title3).padding(.top, 5)
                }
            }.padding()
        }
        .background(Color(.systemGray5))
        .cornerRadius(25)
    }
}

