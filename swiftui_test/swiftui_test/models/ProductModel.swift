//
//  ProductModel.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import Foundation

struct ProductModel: Identifiable  {
    let barcode: String
    let description: String
    let id: String
    let image_url: String
    let name: String
    let retail_price: Int
    let cost_price: Int?
    
    init(_ dictionary: [String: AnyObject]) {
        self.barcode = dictionary["barcode"] as! String
        self.description = dictionary["description"] as! String
        self.id = dictionary["id"] as! String
        self.image_url = dictionary["image_url"] as! String
        self.name = dictionary["name"] as! String
        self.retail_price = dictionary["retail_price"] as! Int
        self.cost_price = (dictionary["cost_price"] as? Int) ?? 0
    }
    
    static func getProducts() async throws -> [ProductModel] {
        
//        do {
//            let productJSON =
           return  try await ApiService.shared.products.getProducts()
//            print(productJSON)
//
//        }
//        catch{
//            print(error)
//        }
//
//
//
//        return []
//    }
    }
    
}
