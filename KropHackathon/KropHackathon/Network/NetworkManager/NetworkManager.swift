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
    
    fileprivate let path = "https://api.themoviedb.org"
    fileprivate let appID = "188e653cc6cad40ebe5f11acb98ed11f"
    
    func getPopular(page: Int, complition: @escaping (Result<Data>) -> Void) {
        let endpoint = (path + "/3/movie/popular?api_key=\(appID)&language=en-US&page=\(page)")
        loadByEndpoint(by: endpoint, complition: complition)
    }
    
    func getFilmByGenre(by id: Int, page: Int, complition: @escaping (Result<Data>) -> Void) {
        let endpoint = (path + "/3/discover/movie?api_key=\(appID)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=\(page)&with_genres=\(id)")
        loadByEndpoint(by: endpoint, complition: complition)
    }
        
    fileprivate func loadByEndpoint(by endpoint: String, complition: @escaping (Result<Data>) -> Void) {
        
        guard let point = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: point) else { assertionFailure("URL is nil"); return }
        
        loadData(by: url) { (data, _, error) in
            if let error = error { complition(.failure(error.localizedDescription)) }
            if let data = data { complition(.success(data)) }
        }
    }
    
    fileprivate func loadData(by url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
