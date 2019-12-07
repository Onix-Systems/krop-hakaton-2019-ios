//
//  ParsingHelper.swift
//  EasyMovie
//
//  Created by Альона Дробко on 1/25/19.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

///Singlton /(parsingByType)
final class ParsingHelper {
    
    static func parsingByType<T: Codable>(_ result: Result<Data>, _ complition: (Result<T>) -> Void) {
        
        switch result {
        case .success(let data):  
            do {
                let object: T = try
                    JSONDecoder().decode(T.self, from: data)
                complition(.success(object))
            } catch {
                assertionFailure("parse error")
                complition(.failure(error.localizedDescription))
            }
            
        case .failure(let error):
            assertionFailure("data error")
            complition(.failure(error))
        }
    }
}
