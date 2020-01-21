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
    var isHUD: Bool { get }
    
    func sendEventOpen()
    func sendEventMap()
    func goBack()
}

final class HospitalDetailsModel: HospitalDetailsModelType {
    
    var hospitalInfoDetailModels: [HospitalDetailsCellViewModel] = []
    var title: String = ""
    var point: CLLocationCoordinate2D?
    var isHUD: Bool = true
    
    private var separator = 0
    
    private let coordinator: HospitalDetailsCoordinatorType
    private let networkService: NetworkServiceType
    private let analiticsService: AnalyticsServiceType
    private let disposeBag = DisposeBag()
    
    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    init(_ coordinator: HospitalDetailsCoordinatorType, serviceHolder: ServiceHolder) {
        self.coordinator = coordinator
        
        networkService = serviceHolder.get(by: NetworkServiceType.self)
        analiticsService = serviceHolder.get(by: AnalyticsServiceType.self)
        networkService.hospitalObserver.subscribe(onNext: { [weak self] result in
            switch result {
            case .success(let model):
                self?.update(model: model)
                self?.isHUD = false
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
        if let latit = model.lat, !latit.contains("null"), let lat = Double(latit),
            let lanit = model.lan, !lanit.contains("null"), let lan = Double(lanit) {
            self.point = CLLocationCoordinate2D.init(latitude: lat, longitude: lan)
        }
        
        self.hospitalInfoDetailModels = []
        if let addressa = model.adress, !addressa.contains("null") {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .address, infoTypeStr: "Вулиця та номер будинку:", info: addressa))
        }
        
        if let workTime = model.workTime, !workTime.contains("null") {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .schedule, infoTypeStr: "Графік работи:", info: workTime))
        }
        
        if let unworkTime = model.unworkTime, !unworkTime.contains("null") {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .closedTime, infoTypeStr: "Обмеження прийому:", info: unworkTime))
        }
        
        if let equipName = model.equipName, !equipName.contains("null") {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Назва обладнання:", info: equipName))
        }
        
        if let stuctName = model.structureName, !stuctName.contains("null") {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Назва структурного підрозділу:", info: stuctName))
        }
        
        if let floorNumber = model.floorNumber, floorNumber != 0 {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Номер поверху:", info: "\(floorNumber)"))
        }
        
        if let roomNumber = model.roomNumber, roomNumber != 0 {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Номер кабінету:", info: "\(roomNumber)"))
        }
        
        if let equipCountry = model.equipCountry, !equipCountry.contains("null") {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Країна виробник:", info: equipCountry))
        }
        if let eqipYear = model.eqipYear, !eqipYear.contains("null") {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Рік випуску обладнання:", info: eqipYear))
        }
        
        if let equipCondition = model.equipCondition, !equipCondition.contains("null") {
            self.hospitalInfoDetailModels.append( HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Експлуатаційний стан обладнання:", info: equipCondition))
        }
        
        setCellSeparator(self.hospitalInfoDetailModels)
    }
    
    func sendEventOpen() {
        analiticsService.log(event: .HOSPITAL_OPEN, parameters: nil)
    }
    
    func sendEventMap() {
        analiticsService.log(event: .GOOGLEMAP_OPEN, parameters: nil)
    }
    
    func setCellSeparator(_ hospitals: [HospitalDetailsCellViewModel]) -> [HospitalDetailsCellViewModel] {
        
        hospitals.forEach { hospital in
            if hospital.infoType == .none {
                separator += 1
            } else {
                separator = 0
            }
            hospital.separator = (separator >= 2)
        }
        return hospitals
    }
}
