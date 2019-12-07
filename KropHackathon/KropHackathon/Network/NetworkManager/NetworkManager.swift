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
    
    fileprivate let path = "https://onix-systems-krop-hakaton-2019.staging.onix.ua/api/"
    
    func getHospital(id: Int, complition: @escaping (Result<Data>) -> Void) {
        let endpoint = (path + "hospital/666")
        loadByEndpoint(by: endpoint, complition: complition)
    }
    
    fileprivate func loadByEndpoint(by endpoint: String, complition: @escaping (Result<Data>) -> Void) {
        
        guard let point = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: point) else { assertionFailure("URL is nil"); return }
        
       
        loadData(by: url) { (data, responce, error) in
            if let error = error { complition(.failure(error.localizedDescription)) }
            if let data = data { complition(.success(data)) }
        }
    }
    
    fileprivate func loadData(by url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
