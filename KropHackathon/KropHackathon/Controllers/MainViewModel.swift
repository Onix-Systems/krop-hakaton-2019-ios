//
//  MainViewModel.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

protocol MainViewModelType {
    var didLoadData: (() -> Void)? { get set }
    var didLoadFailed: ((String) -> Void)? { get set }
    var serviceModels: [ServiceTypeModel] {get}
}

final class MainViewModel: MainViewModelType {
    
    private let coordinator: MainCoordinatorType
//    private var mapService: MapServiceType
//    private var medicalService: MedicalServiceType

    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    var serviceModels = [ServiceTypeModel.init(name: "Ультразвукові", image: ""), ServiceTypeModel.init(name: "Ренгенологічні", image: ""), ServiceTypeModel.init(name: "Функціональні", image: "")]
    
    init(_ coordinator: MainCoordinatorType, serviceHolder: ServiceHolder) {
        self.coordinator = coordinator
//        mapService = serviceHolder.get(by: MapServiceType.self)
//        medicalService = serviceHolder.get(by: MedicalServiceType.self)
        
    }
        
}
