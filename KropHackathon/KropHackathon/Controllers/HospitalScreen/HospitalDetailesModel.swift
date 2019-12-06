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
    var hospitalInfoDetailModels: [HospitalDetailsCellViewModel] = [
        HospitalDetailsCellViewModel(infoType: .address, infoTypeStr: "Вулиця та номер будинку:", info: "Вул. Фортеця, 21"),
        HospitalDetailsCellViewModel(infoType: .schedule, infoTypeStr: "Графік работи:", info: "Пн-Пт 09:00 - 16:00"),
        HospitalDetailsCellViewModel(infoType: .closedTime, infoTypeStr: "Обмеження прийому:", info: "12:00 - 13:00"),
        HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Назва обладнання:", info: "Апарат ультразвукової діагностики"),
        HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Назва структурного підрозділу:", info: "Рентгенологічне відділення стаціонару №1"),
        HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Номер поверху:", info: "1"),
        HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Номер кабінету:", info: "9"),
        HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Країна виробник:", info: "Японія"),
        HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Рік випуску обладнання:", info: "2005"),
        HospitalDetailsCellViewModel(infoType: .none, infoTypeStr: "Експлуатаційний стан обладнання:", info: "Потребує капітального ремонту")]
    var title: String
    
    private let coordinator: HospitalDetailsCoordinatorType

    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    var point = CLLocationCoordinate2D.init(latitude: 48.510942, longitude: 32.270891)
    
    init(_ coordinator: HospitalDetailsCoordinatorType, serviceHolder: ServiceHolder) {
        self.coordinator = coordinator
        title = "Комунальний заклад \"Центральна міська лікарня м. Кіровограда\""
    }
    
    func goBack() {
        coordinator.goBack()
    }

}
