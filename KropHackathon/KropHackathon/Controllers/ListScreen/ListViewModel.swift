//
//  ListViewModel.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

protocol ListViewModelType {
    var didLoadData: (() -> Void)? { get set }
    var didLoadFailed: ((String) -> Void)? { get set }
    
    var serviceModels: [ServiceTypeModel] { get }

    func openDetails()
    func goBack()
}

final class ListViewModel: ListViewModelType {
    
    private let coordinator: ListCoordinatorType
//    private var mapService: MapServiceType
//    private var medicalService: MedicalServiceType

    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    var serviceModels = [ServiceTypeModel.init(name: "Ультразвукові", image: ""), ServiceTypeModel.init(name: "Ренгенологічні", image: ""), ServiceTypeModel.init(name: "Функціональні", image: "")]

    
    init(_ coordinator: ListCoordinatorType, serviceHolder: ServiceHolder) {
        self.coordinator = coordinator
//        mapService = serviceHolder.get(by: MapServiceType.self)
//        medicalService = serviceHolder.get(by: MedicalServiceType.self)
        
    }
        
    func openDetails() {
        coordinator.openDetails()
    }
    
    func goBack() {
        coordinator.goBack()

    }

}
