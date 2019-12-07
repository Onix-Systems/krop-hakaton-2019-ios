//
//  ListViewModel.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import RxSwift

enum ListScreenType {
    case serviceDetails
    case hospitals
}

protocol ListViewModelType {
    var didLoadData: (() -> Void)? { get set }
    var didLoadFailed: ((String) -> Void)? { get set }
    
    var screenType: ListScreenType { get set }
    var screenTitle: String { get set }
    
    var serviceDetailsModels: [ServiceDetailsModel] { get }
    var hospitalModels: [HospitalModel] { get }
    
    func openHospitals(row: Int)
    func openDetails(row: Int)
    func goBack()
}

final class ListViewModel: ListViewModelType {
    
    private let coordinator: ListCoordinatorType
    private let networkService: NetworkServiceType
    private let disposeBag = DisposeBag()
    
    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    var screenType: ListScreenType
    var screenTitle: String
    
    var serviceDetailsModels: [ServiceDetailsModel] = []
    var hospitalModels: [HospitalModel] = []
    
    init(_ coordinator: ListCoordinatorType, serviceHolder: ServiceHolder, screenType: ListScreenType = .serviceDetails, screenTitle: String) {
        self.coordinator = coordinator
        
        self.screenType = screenType
        self.screenTitle = screenTitle
        
        switch screenType {
        case .hospitals:
            self.hospitalModels = Mock.hospitalModels
        case .serviceDetails:
            self.serviceDetailsModels = Mock.serviceDetailsModels
        }
        
        networkService = serviceHolder.get(by: NetworkServiceType.self)
        
        networkService.servicesObserver.subscribe(onNext: { [weak self] result in
            switch result {
            case .success(let model):
                //self?.serviceDetailsModels = model
                self?.didLoadData?()
            case .failure(error: let error):
                self?.didLoadFailed?(error)
            }
        }).disposed(by: disposeBag)
        
        networkService.hospitalsObserver.subscribe(onNext: { [weak self] result in
            switch result {
            case .success(let model):
                //self?.hospitalModels = model
                self?.didLoadData?()
            case .failure(error: let error):
                self?.didLoadFailed?(error)
            }
        }).disposed(by: disposeBag)
    }
    
    func openHospitals(row: Int) {
        networkService.getHospitals()
        coordinator.openHospitals(model: serviceDetailsModels[row])
    }
    
    func openDetails(row: Int) {
        networkService.getHospital(id: 666)
        coordinator.openDetails()
    }
    
    func goBack() {
        coordinator.goBack()
    }
    
}
