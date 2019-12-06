//
//  MainViewModel.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

protocol MainViewModelType {
    var didLoadData: (() -> Void)? { get set }
    var didLoadFailed: ((String) -> Void)? { get set }
    var serviceModels: [ServiceTypeModel] { get }
    var searchModel: [HospitalModel] { get }

    func openList(row: Int)
    func openDetails()
}

final class MainViewModel: MainViewModelType {
    
    var searchModel: [HospitalModel] = [HospitalModel(title: "Комунальне некомерційне підприємство \"Клінічна дитяча міська поліклініка” Міської ради міста Кропивницького\"", address: "Вул. Шевченка, 36", schedule: "Пн-Пт 08:00 - 16:00"), HospitalModel(title: "Комунальний заклад \"Кіровоградська міська лікарня швидкої медичної допомоги\"", address: "Вул. Короленко, 56", schedule: "Пн-Нд 00:00 - 24:00"), HospitalModel(title: "Назва в одну строку", address: "Вул. Адресова, 1", schedule: "Пн-Пт 08:00 - 18:00")]
    
    private let coordinator: MainCoordinatorType
//    private var mapService: MapServiceType
//    private var medicalService: MedicalServiceType

    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    var serviceModels = [ServiceTypeModel.init(name: "Ультразвукові", image: "img_uzi", backColor: Style.Color.uziPink, services: ["почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка"]),
                         ServiceTypeModel.init(name: "Ренгенологічні", image: "img_rentgen", backColor: Style.Color.rengenBlue, services: ["почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка"]),
                         ServiceTypeModel.init(name: "Функціональні", image: "img_funct", backColor: Style.Color.funcOrange, services: ["почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка"])]
    
    init(_ coordinator: MainCoordinatorType, serviceHolder: ServiceHolder) {
        self.coordinator = coordinator
//        mapService = serviceHolder.get(by: MapServiceType.self)
//        medicalService = serviceHolder.get(by: MedicalServiceType.self)
        
    }
    
    func openDetails() {
        coordinator.openDetails()
    }
    
    func openList(row: Int) {
        coordinator.openList(model: serviceModels[row])
    }
        
}
