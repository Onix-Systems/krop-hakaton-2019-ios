//
//  HospitalDetailesModel.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift

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
    private let networkService: NetworkServiceType
    private let disposeBag = DisposeBag()
    
    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    init(_ coordinator: HospitalDetailsCoordinatorType, serviceHolder: ServiceHolder) {
        self.coordinator = coordinator
        
        title = Mock.title
        point = Mock.point
        hospitalInfoDetailModels = Mock.hospitalInfoDetailModels
        
        networkService = serviceHolder.get(by: NetworkServiceType.self)
        networkService.hospitalObserver.subscribe(onNext: { [weak self] result in
            switch result {
            case .success(let model):
//               title = model.title
//               point = model.title
//               hospitalInfoDetailModels = model.hospitalInfoDetailModels
                self?.didLoadData?()
            case .failure(error: let error):
                self?.didLoadFailed?(error)
            }
        }).disposed(by: disposeBag)
    }
    
    func goBack() {
        coordinator.goBack()
    }
}
