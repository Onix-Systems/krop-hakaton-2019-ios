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
    var hospitalObserver: ReplaySubject<Result<Hospital>> { get }
    
    func getServiceTypes()
    func getServices()
    func getSearch()
    func getHospitals()
    func getHospital(id: Int)
}

class NetworkService: NetworkServiceType {
    
    private let networkManager = NetworkManager.shared
    
    init() {
        getServiceTypes()
    }
    
    var servicesObserver = ReplaySubject<Result<Bool>>.create(bufferSize: 1)
    var stypesObserver = ReplaySubject<Result<Bool>>.create(bufferSize: 1)
    var hospitalObserver = ReplaySubject<Result<Hospital>>.create(bufferSize: 1)
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
    
    func getHospital(id: Int) {
        
        let compliction: ((Result<HospitalRequest>) -> Void) = { result in
            
            switch result {
            case .success(let hospital):
                if hospital.status == 200 {
                    if let firstHospital = hospital.data?["hospitals"]?.first {
                        self.hospitalObserver.onNext(.success(firstHospital))
                    } else {
                        self.hospitalObserver.onNext(.failure(hospital.message))
                    }
                } else {
                    self.hospitalObserver.onNext(.failure(hospital.message))
                }
            case .failure(let error):
                self.hospitalObserver.onNext(.failure(error))
            }
        }
        
        networkManager.getHospital(id: id, complition: {
            [weak self] data in
            ParsingHelper.parsingByType(data, compliction)
        })
    }
}
