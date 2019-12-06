//
//  ListViewModel.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

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
    func openDetails()
    func goBack()
}

final class ListViewModel: ListViewModelType {
    
    private let coordinator: ListCoordinatorType

    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    var screenType: ListScreenType
    var screenTitle: String
    
    var serviceDetailsModels: [ServiceDetailsModel] = []
    var hospitalModels: [HospitalModel] = []
    
    init(_ coordinator: ListCoordinatorType, serviceHolder: ServiceHolder, screenType: ListScreenType = .serviceDetails, screenTitle: String) {
        self.coordinator = coordinator
        
//        mapService = serviceHolder.get(by: MapServiceType.self)
//        medicalService = serviceHolder.get(by: MedicalServiceType.self)
        
        self.screenType = screenType
        self.screenTitle = screenTitle
        
        switch screenType {
        case .hospitals:
            self.hospitalModels = Mock.hospitalModels
        case .serviceDetails:
            self.serviceDetailsModels = Mock.serviceDetailsModels
        }
    }
    
    func openHospitals(row: Int) {
        coordinator.openHospitals(model: serviceDetailsModels[row])
    }
        
    func openDetails() {
        coordinator.openDetails()
    }
    
    func goBack() {
        coordinator.goBack()
    }

}
