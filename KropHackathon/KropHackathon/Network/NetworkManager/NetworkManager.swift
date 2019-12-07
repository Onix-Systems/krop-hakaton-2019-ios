//
//  NetworkManager.swift
//  EasyMovie_ad_dev
//
//  Created by Альона Дробко on 1/24/19.
//  Copyright © 2019 Альона Дробко. All rights reserved.
//

import Foundation

///Variable Result(generic): nessary type or String with error-message
enum Result<T> {
    case success(T)
    case failure(String)
}

///Singlton /(shared)
final class NetworkManager {
    
    static let shared = NetworkManager()
    fileprivate let path = "https://onix-systems-krop-hakaton-2019.staging.onix.ua/"
    
    func getAllData(completion: @escaping (Result<Data>) -> Void) {
        let endpoint = (path + "api/get-equipment")
        loadByEndpoint(by: endpoint, completion: completion)
    }
            
    fileprivate func loadByEndpoint(by endpoint: String, completion: @escaping (Result<Data>) -> Void) {
        
        guard let point = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: point) else { assertionFailure("URL is nil"); return }
        
        loadData(by: url) { (data, _, error) in
            if let error = error { completion(.failure(error.localizedDescription)) }
            if let data = data { completion(.success(data)) }
        }
    }
    
    fileprivate func loadData(by url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
