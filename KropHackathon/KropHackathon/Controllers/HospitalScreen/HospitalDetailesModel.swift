//
//  HospitalDetailesModel.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

protocol HospitalDetailesModelType {
    var didLoadData: (() -> Void)? { get set }
    var didLoadFailed: ((String) -> Void)? { get set }
    
    var serviceDetailsModels: [ServiceDetailsModel] { get }

    func goBack()
}

final class HospitalDetailesModel: HospitalDetailesModelType {
    
    private let coordinator: HospitalDetailsCoordinatorType
//    private var mapService: MapServiceType
//    private var medicalService: MedicalServiceType

    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    var serviceDetailsModels = [ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "черевної порожнини"), ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "нирок"), ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "щитовидної залози"), ServiceDetailsModel(serviceTypeName: "", serviceDetailsName: "Ехокардіографія"), ServiceDetailsModel(serviceTypeName: "", serviceDetailsName: "Нейросонографiя"), ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "сечо-статевої системи")]
    
    init(_ coordinator: HospitalDetailsCoordinatorType, serviceHolder: ServiceHolder) {
        self.coordinator = coordinator
//        mapService = serviceHolder.get(by: MapServiceType.self)
//        medicalService = serviceHolder.get(by: MedicalServiceType.self)
        
    }
        
    func openMap() {
        coordinator.openMap()
    }
    
    func goBack() {
        coordinator.goBack()

    }

}
