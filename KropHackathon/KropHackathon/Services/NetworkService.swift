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
    var stypesObserver: ReplaySubject<Result<Categories>> { get }
    var hospitalsObserver: ReplaySubject<Result<[Hospital]>> { get }
    var searchObserver: ReplaySubject<Result<Bool>> { get }
    var hospitalObserver: ReplaySubject<Result<Hospital>> { get }
    
    func getServiceTypes()
    func getServices()
    func getSearch()
    func getHospitals(type: String)
    func getHospital(id: Int)
}

class NetworkService: NetworkServiceType {
    
    private let networkManager = NetworkManager.shared
    
    init() {
        getServiceTypes()
    }
    
    var servicesObserver = ReplaySubject<Result<Bool>>.create(bufferSize: 1)
    var stypesObserver = ReplaySubject<Result<Categories>>.create(bufferSize: 1)
    var hospitalObserver = ReplaySubject<Result<Hospital>>.create(bufferSize: 1)
    var hospitalsObserver = ReplaySubject<Result<[Hospital]>>.create(bufferSize: 1)
    var searchObserver = ReplaySubject<Result<Bool>>.create(bufferSize: 1)
    
    func getServiceTypes() {
        let completion: ((Result<CategoriesResponse>) -> Void) = { result in
            
            switch result {
            case .success(let categoriesResonse):
                if categoriesResonse.status == 200 {
                    self.stypesObserver.onNext(.success(categoriesResonse.data))
                } else {
                    self.stypesObserver.onNext(.failure(categoriesResonse.message))
                }
            case .failure(let error):
                self.hospitalObserver.onNext(.failure(error))
            }
        }
        
        networkManager.getAllData(completion: { data in
            ParsingHelper.parsingByType(data, completion)
        })

    }
    
    func getServices() {

    }
    
    func getSearch() {
        
    }
    
    func getHospitals(type: String) {
        
        let compliction: ((Result<HospitalsRequest>) -> Void) = { result in
            
            switch result {
            case .success(let hospitals):
                if hospitals.status == 200 {
                    if let hospitals = hospitals.data?.hospitals {
                        self.hospitalsObserver.onNext(.success(hospitals))
                    } else {
                        self.hospitalObserver.onNext(.failure(hospitals.message))
                    }
                } else {
                    self.hospitalObserver.onNext(.failure(hospitals.message))
                }
            case .failure(let error):
                self.hospitalObserver.onNext(.failure(error))
            }
        }
        
        networkManager.getHospitals(type: type, complition: {
            [weak self] data in
            ParsingHelper.parsingByType(data, compliction)
        })
        
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
