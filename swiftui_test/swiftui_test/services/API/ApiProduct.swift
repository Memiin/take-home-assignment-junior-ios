//
//  ApiProduct.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import Foundation

final class ApiProduct{
    let endpointBase = "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba"
    
    
    func getProducts() async throws -> [ProductModel]   {
        
 
        var products: [ProductModel] = []
         do{
        let data = try await ApiService.shared.get(urlString: endpointBase)

             let json = try JSONSerialization.jsonObject(with: data, options: [.json5Allowed]) as? [String : AnyObject]
             
             // Not the best way to decode the json
             //If the response where [ProductList] would be way easier to decode
             json?.forEach{
                 products.append( ProductModel($0.value as! [String : AnyObject]))
             }
             
             print(products)

         }
 
        catch {
             print(error)
        }
        return products
    }

}
