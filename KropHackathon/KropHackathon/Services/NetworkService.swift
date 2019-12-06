//
//  NetworkService.swift
//  KropHackathon
//
//  Created by Альона Дробко on 06.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//
//
import RxSwift
import Foundation

protocol NetworkServiceType: Service {
    
    var servicesObserver: ReplaySubject<Result<Bool>> { get }
    var stypesObserver: ReplaySubject<Result<Bool>> { get }
    var hospitalsObserver: ReplaySubject<Result<Bool>> { get }
    var searchObserver: ReplaySubject<Result<Bool>> { get }
    var hospitalObserver: ReplaySubject<Result<Bool>> { get }
    
    func getServiceTypes()
    func getServices()
    func getSearch()
    func getHospitals()
    func getHospital()
}

class NetworkService: NetworkServiceType {
    
    init() {
        getServiceTypes()
    }
    
    var servicesObserver = ReplaySubject<Result<Bool>>.create(bufferSize: 1)
    var stypesObserver = ReplaySubject<Result<Bool>>.create(bufferSize: 1)
    var hospitalObserver = ReplaySubject<Result<Bool>>.create(bufferSize: 1)
    var hospitalsObserver = ReplaySubject<Result<Bool>>.create(bufferSize: 1)
    var searchObserver = ReplaySubject<Result<Bool>>.create(bufferSize: 1)
    
    func getServiceTypes() {
        
    }
    
    func getServices() {
        
    }
    
    func getSearch() {
        
    }
    
    func getHospitals() {
        
    }
    
    func getHospital() {
        
    }
}
