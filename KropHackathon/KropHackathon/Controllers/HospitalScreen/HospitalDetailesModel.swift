//
//  HospitalDetailesModel.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import CoreLocation

protocol HospitalDetailesModelType {
    var didLoadData: (() -> Void)? { get set }
    var didLoadFailed: ((String) -> Void)? { get set }
    
    var point: CLLocationCoordinate2D { get }
    var serviceDetailsModels: [ServiceDetailsModel] { get }

    func goBack()
}

final class HospitalDetailesModel: HospitalDetailesModelType {
    var serviceDetailsModels: [ServiceDetailsModel] = []
    
    
    private let coordinator: HospitalDetailsCoordinatorType
//    private var mapService: MapServiceType
//    private var medicalService: MedicalServiceType

    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    var point = CLLocationCoordinate2D.init(latitude: 48.510942, longitude: 32.270891)
    
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
