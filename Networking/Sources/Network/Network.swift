//
//  Network.swift
//  Networking
//
//  Created by Олег Стригунов on 15.04.2023.
//

import Foundation
import Alamofire

enum APIError: Error {
    case invalidURL
    case connectionError(Error)
    case serverError(Int)
    case unknownError
    case networkError(Error)
}

class Network {
    
    static func getData(completion: @escaping (Result<CardData, APIError>) -> Void) {
        
        let request = AF.request("https://api.magicthegathering.io/v1/cards")
        
        request.responseDecodable(of: CardData.self) { response in
            if let error = response.error {
                completion(.failure(APIError.networkError(error)))
                return
            }
            
            guard let data = response.value else {
                completion(.failure(APIError.invalidURL))
                return
            }
            
            completion(.success(data))
        }
    }
}



