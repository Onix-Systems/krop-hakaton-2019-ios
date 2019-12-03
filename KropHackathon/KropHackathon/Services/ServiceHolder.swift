//
//  ServiceHolder.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

protocol Service {}
protocol InitializableService: Service {
    init()
}

final class ServiceHolder {
    private var servicesDictionary: [String: Service] = [:]
    
    public func add<T>(_ protocolType: T.Type, for concreteType: InitializableService.Type, with name: String? = nil) {
        self.add(protocolType, for: concreteType.init(), with: name)
    }
    
    public func add<T>(_ type: T.Type, with name: String? = nil, constructor: () -> Service) {
        self.add(type, for: constructor(), with: name)
    }
    
    public func add<T>(_ protocolType: T.Type, for instance: Service, with name: String? = nil) {
        let name = name ?? String(reflecting: protocolType)
        servicesDictionary[name] = instance
    }
    
    public func get<T>(by type: T.Type = T.self) -> T {
        return get(by: String(reflecting: type))
    }
    
    public func get<T>(by name: String) -> T {
        guard let service = servicesDictionary[name] as? T else {
            fatalError("Firstly you have to add the service.")
        }
        
        return service
    }
}
