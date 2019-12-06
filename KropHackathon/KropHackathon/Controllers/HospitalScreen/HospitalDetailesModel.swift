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
    var hospitalInfoDetailModels: [HospitalDetailsCellViewModel] { get }
    var title: String { get set }
    
    func goBack()
}

final class HospitalDetailesModel: HospitalDetailesModelType {
    
    var hospitalInfoDetailModels: [HospitalDetailsCellViewModel] = []
    var title: String
    var point: CLLocationCoordinate2D
    
    private let coordinator: HospitalDetailsCoordinatorType

    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    init(_ coordinator: HospitalDetailsCoordinatorType, serviceHolder: ServiceHolder) {
        self.coordinator = coordinator
        
        title = Mock.title
        point = Mock.point
        hospitalInfoDetailModels = Mock.hospitalInfoDetailModels
    }
    
    func goBack() {
        coordinator.goBack()
    }
}
