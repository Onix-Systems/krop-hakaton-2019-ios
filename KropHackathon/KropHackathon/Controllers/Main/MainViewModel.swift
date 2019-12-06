//
//  MainViewModel.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

protocol MainViewModelType {
    var didLoadData: (() -> Void)? { get set }
    var didLoadFailed: ((String) -> Void)? { get set }
    
    var serviceModels: [ServiceTypeModel] { get }
    var searchModel: [HospitalModel] { get }

    func openList(row: Int)
    func openDetails()
    func search(text: String?)
}

final class MainViewModel: MainViewModelType {

    var serviceModels: [ServiceTypeModel] = []
    var searchModel: [HospitalModel] = []
    
    private let coordinator: MainCoordinatorType

    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    init(_ coordinator: MainCoordinatorType, serviceHolder: ServiceHolder) {
        
        self.coordinator = coordinator
        
        serviceModels = Mock.serviceModels
        searchModel = Mock.searchModel
        
//        mapService = serviceHolder.get(by: MapServiceType.self)
    }
    
    func search(text: String?) {
        self.didLoadData?()
    }
    
    func openDetails() {
        coordinator.openDetails()
    }
    
    func openList(row: Int) {
        coordinator.openList(model: serviceModels[row])
    }
}
