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

protocol HospitalDetailsModelType {
    var didLoadData: (() -> Void)? { get set }
    var didLoadFailed: ((String) -> Void)? { get set }
    
    var point: CLLocationCoordinate2D? { get }
    var hospitalInfoDetailModels: [HospitalDetailsCellViewModel] { get }
    var title: String { get set }
    
    func goBack()
}

final class HospitalDetailsModel: HospitalDetailsModelType {
    
    var hospitalInfoDetailModels: [HospitalDetailsCellViewModel] = []
    var title: String = ""
    var point: CLLocationCoordinate2D?
    
    private let coordinator: HospitalDetailsCoordinatorType
    private let networkService: NetworkServiceType
    private let disposeBag = DisposeBag()
    
    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    init(_ coordinator: HospitalDetailsCoordinatorType, serviceHolder: ServiceHolder) {
        self.coordinator = coordinator
        
        networkService = serviceHolder.get(by: NetworkServiceType.self)
        networkService.hospitalObserver.subscribe(onNext: { [weak self] result in
            switch result {
            case .success(let model):
                self?.update(model: model)
                self?.didLoadData?()
            case .failure(error: let error):
                self?.didLoadFailed?(error)
            }
        }).disposed(by: disposeBag)
    }
    
    func goBack() {
        coordinator.goBack()
    }
    
    private func update(model: Hospital) {
        if let name = model.name {
            self.title = name
        }
        if let lat = Double(model.lat!), let lan = Double(model.lan!) {
            self.point = CLLocationCoordinate2D.init(latitude: lat, longitude: lan)
        }

        self.hospitalInfoDetailModels = []
        if let addressa = model.adress {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .address, infoTypeStr: "Вулиця та номер будинку:", info: addressa))
        }
        
        if let workTime = model.workTime {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .schedule, infoTypeStr: "Графік работи:", info: workTime))
        }
        
        if let unworkTime = model.unworkTime {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .closedTime, infoTypeStr: "Обмеження прийому:", info: unworkTime))
        }
        
        if let equipName = model.equipName {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Назва обладнання:", info: equipName))
        }
        
        if let stuctName = model.structureName {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Назва структурного підрозділу:", info: stuctName))
        }
        
        if let floorNumber = model.floorNumber {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Номер поверху:", info: "\(floorNumber)"))
        }
        
        if let roomNumber = model.roomNumber {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Номер кабінету:", info: "\(roomNumber)"))
        }
        
        if let equipCountry = model.equipCountry{
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Країна виробник:", info: equipCountry))
        }
        if let eqipYear = model.eqipYear {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Рік випуску обладнання:", info: eqipYear))
        }
        
        if let equipCondition = model.equipCondition {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Експлуатаційний стан обладнання:", info: equipCondition))
        }
    }
}
