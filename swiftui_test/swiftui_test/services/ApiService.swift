//
//  ApiService.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import Foundation
import Alamofire


class ApiService {
    public var products: ApiProduct
    

    enum RemoteResourceError: Error {
        case notFound
        case notAbleToDeserialize
    }

    enum ApiError: Error {
        case invalidURL
        case invalidResponse(Data?, URLResponse?)
    }
    

    public static var shared: ApiService = ApiService()

    private init() {
        products = ApiProduct()
    }
 
   // func get<T: Decodable>(
    func get(
        urlString: String
     //   completion: @escaping (Result<T, Error>) -> Void
       //completion: @escaping (Result<T, Error>) -> Void
    ) async throws -> Data{
       //let urlString = buildUrlString(endpoint)
        
//        guard let url = URL(string: urlString) else {
//                  //completion(.failure(ApiError.invalidURL))
//            throw ApiError.invalidURL
//               }
        
      //  print(url)
        try await withUnsafeThrowingContinuation { continuation in
            AF.request(urlString, method: .get).validate().responseData { response in
                       if let data = response.data {
                           continuation.resume(returning: data)
                           return
                       }
                       if let err = response.error {
                           continuation.resume(throwing: err)
                           return
                       }
                       fatalError("should not get here")
                   }
        
        }
    }
    
}
