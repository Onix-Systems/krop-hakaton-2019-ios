//
//  Mocks.swift
//  KropHackathon
//
//  Created by Альона Дробко on 06.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import CoreLocation

class Mock {
    
    static let searchModel: [HospitalModel] = [HospitalModel(title: "Комунальне некомерційне підприємство \"Клінічна дитяча міська поліклініка” Міської ради міста Кропивницького\"", address: "Вул. Шевченка, 36", schedule: "Пн-Пт 08:00 - 16:00"), HospitalModel(title: "Комунальний заклад \"Кіровоградська міська лікарня швидкої медичної допомоги\"", address: "Вул. Короленко, 56", schedule: "Пн-Нд 00:00 - 24:00"), HospitalModel(title: "Назва в одну строку", address: "Вул. Адресова, 1", schedule: "Пн-Пт 08:00 - 18:00")]
    
    static let serviceModels = [ServiceTypeModel.init(name: "Ультразвукові", image: "img_uzi", backColor: Style.Color.uziPink, services: ["почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка"]),
    ServiceTypeModel.init(name: "Ренгенологічні", image: "img_rentgen", backColor: Style.Color.rengenBlue, services: ["почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка"]),
    ServiceTypeModel.init(name: "Функціональні", image: "img_funct", backColor: Style.Color.funcOrange, services: ["почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка", "почек", "черева", "щитовитка"])]
    
    static let serviceDetailsModels = [ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "черевної порожнини"), ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "нирок"), ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "щитовидної залози"), ServiceDetailsModel(serviceTypeName: "", serviceDetailsName: "Ехокардіографія"), ServiceDetailsModel(serviceTypeName: "", serviceDetailsName: "Нейросонографiя"), ServiceDetailsModel(serviceTypeName: "УЗД", serviceDetailsName: "сечо-статевої системи")]
    
        static let  hospitalModels: [HospitalModel] = [HospitalModel(title: "Комунальне некомерційне підприємство \"Клінічна дитяча міська поліклініка” Міської ради міста Кропивницького\"", address: "Вул. Шевченка, 36", schedule: "Пн-Пт 08:00 - 16:00"), HospitalModel(title: "Комунальний заклад \"Кіровоградська міська лікарня швидкої медичної допомоги\"", address: "Вул. Короленко, 56", schedule: "Пн-Нд 00:00 - 24:00"), HospitalModel(title: "Назва в одну строку", address: "Вул. Адресова, 1", schedule: "Пн-Пт 08:00 - 18:00")]
    
    static let hospitalInfoDetailModels: [HospitalDetailsCellViewModel] = [
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
    
        static let point = CLLocationCoordinate2D.init(latitude: 48.510942, longitude: 32.270891)
    
        static let title = "Комунальний заклад \"Центральна міська лікарня м. Кіровограда\""
}
