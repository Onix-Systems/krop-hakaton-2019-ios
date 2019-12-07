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
    
    var stypesObserver: ReplaySubject<Result<Bool>> { get }
    var hospitalsObserver: ReplaySubject<Result<[Hospital]>> { get }
    var searchObserver: ReplaySubject<Result<[Hospital]>> { get }
    var hospitalObserver: ReplaySubject<Result<Hospital>> { get }
    
    func getServiceTypes()
    func getSearch(text: String)
    func getHospitals(type: String)
    func getHospital(id: Int)
}

class NetworkService: NetworkServiceType {
    
    private let networkManager = NetworkManager.shared
    
    init() {
        getServiceTypes()
    }
    
    var stypesObserver = ReplaySubject<Result<Bool>>.create(bufferSize: 1)
    var hospitalObserver = ReplaySubject<Result<Hospital>>.create(bufferSize: 1)
    var hospitalsObserver = ReplaySubject<Result<[Hospital]>>.create(bufferSize: 1)
    var searchObserver = ReplaySubject<Result<[Hospital]>>.create(bufferSize: 1)
    
    func getServiceTypes() {
        
    }
    
    func getSearch(text: String) {
        let compliction: ((Result<SearchRequest>) -> Void) = { result in
            
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
        
        networkManager.getSearch(text: text, complition: {
            [weak self] data in
            ParsingHelper.parsingByType(data, compliction)
        })
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
