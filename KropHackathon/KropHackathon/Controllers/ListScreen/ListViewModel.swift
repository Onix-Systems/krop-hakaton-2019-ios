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
//    private var mapService: MapServiceType
//    private var medicalService: MedicalServiceType

    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    var screenType: ListScreenType
    var screenTitle: String
    
    var serviceDetailsModels = [ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "черевної порожнини"), ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "нирок"), ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "щитовидної залози"), ServiceDetailsModel(serviceTypeName: "", serviceDetailsName: "Ехокардіографія"), ServiceDetailsModel(serviceTypeName: "", serviceDetailsName: "Нейросонографiя"), ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "сечо-статевої системи")]
    
    var hospitalModels: [HospitalModel] = [HospitalModel(title: "Комунальне некомерційне підприємство \"Клінічна дитяча міська поліклініка” Міської ради міста Кропивницького\"", address: "Вул. Шевченка, 36", schedule: "Пн-Пт 08:00 - 16:00"), HospitalModel(title: "Комунальний заклад \"Кіровоградська міська лікарня швидкої медичної допомоги\"", address: "Вул. Короленко, 56", schedule: "Пн-Нд 00:00 - 24:00"), HospitalModel(title: "Назва в одну строку", address: "Вул. Адресова, 1", schedule: "Пн-Пт 08:00 - 18:00")]
    
    init(_ coordinator: ListCoordinatorType, serviceHolder: ServiceHolder, screenType: ListScreenType = .serviceDetails, screenTitle: String) {
        self.coordinator = coordinator
//        mapService = serviceHolder.get(by: MapServiceType.self)
//        medicalService = serviceHolder.get(by: MedicalServiceType.self)
        
        self.screenType = screenType
        self.screenTitle = screenTitle
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
