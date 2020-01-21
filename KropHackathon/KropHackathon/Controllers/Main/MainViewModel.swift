//
//  MainViewModel.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import RxSwift

protocol MainViewModelType {
    var didLoadData: (() -> Void)? { get set }
    var didLoadFailed: ((String) -> Void)? { get set }
    
    var serviceModels: [ServiceTypeModel] { get }
    var searchModels: [HospitalModel] { get }
    
    func openList(row: Int)
    func openDetails(_ index: Int, text: String)
    func search(text: String?)
    
    func sendEventApp()
    func sendEventCategory(type: String)
    func sendEventOpenAbout()
    func sendEventOnix()
    func sendEventSearch(text: String)
}

final class MainViewModel: MainViewModelType {
    var serviceModels: [ServiceTypeModel] = []
    var searchModels: [HospitalModel] = []
    
    private let coordinator: MainCoordinatorType
    private let networkService: NetworkServiceType
    private let analiticsService: AnalyticsServiceType
    private let disposeBag = DisposeBag()
    
    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    init(_ coordinator: MainCoordinatorType, serviceHolder: ServiceHolder) {
        self.coordinator = coordinator
        
        analiticsService = serviceHolder.get(by: AnalyticsServiceType.self)
        networkService = serviceHolder.get(by: NetworkServiceType.self)
        
        networkService.stypesObserver.subscribe(onNext: { [weak self] result in
            switch result {
            case .success(let categories):
                self?.createServiceTypesArray(categories: categories)
                self?.didLoadData?()
            case .failure(error: let error):
                self?.didLoadFailed?(error)
            }
        }).disposed(by: disposeBag)
        
        networkService.searchObserver.subscribe(onNext: { [weak self] result in
            switch result {
            case .success(let searchModels):
                self?.searchModels = []
                searchModels.forEach { element in
                    self?.searchModels.append(HospitalModel.init(model: element))
                }
                self?.didLoadData?()
            case .failure(error: let error):
                self?.didLoadFailed?(error)
            }
        }).disposed(by: disposeBag)
    }
    
    private func createServiceTypesArray(categories: Categories) {
        serviceModels = []
        categories.categories.enumerated().forEach { category in
            let style = Style.setCellStyle(category: category.element)
            let serviceType = ServiceTypeModel(name: category.element.name, image: style.0, backColor: style.1, services: category.element.list)
            serviceModels.append(serviceType)
        }
        
        serviceModels = filterServices(serviceModels: serviceModels)
    }
    
    private func filterServices(serviceModels: [ServiceTypeModel]) -> [ServiceTypeModel] {
        var startModels = serviceModels
        var filteredModels: [ServiceTypeModel] = []
        let parametrs = ["Ультразвук", "Рентген", "Ендоскоп", "Функціонал"]
        for filter in parametrs {
            for i in 0...startModels.count - 1 {
                if startModels[i].name.contains(filter) {
                    filteredModels.append(startModels[i])
                    startModels.remove(at: i)
                    break
                }
            }
        }
        return filteredModels + startModels
    }
    
    func search(text: String?) {
        networkService.getSearch(text: text ?? "")
    }
    
    func openDetails(_ index: Int, text: String) {
        sendEventSearch(text: text)
        networkService.getHospital(id: searchModels[index].id)
        coordinator.openDetails()
    }
    
    func openList(row: Int) {
        sendEventCategory(type: serviceModels[row].name)
        coordinator.openList(model: serviceModels[row])
    }
    
    func sendEventSearch(text: String) {
        analiticsService.log(event: .SEARCH, parameters: [AnalyticsParameter.TEXT.rawValue: text])
    }
    
    func sendEventApp() {
        analiticsService.log(event: .APP_OPEN, parameters: nil)
    }
    
    func sendEventCategory(type: String) {
        analiticsService.log(event: .CATEGORY_OPEN, parameters: [AnalyticsParameter.TYPE.rawValue: type])
    }
    
    func sendEventOpenAbout() {
        analiticsService.log(event: .ABOUT_OPEN, parameters: nil)
    }
    
    func sendEventOnix() {
        analiticsService.log(event: .GO_TO_ONIX, parameters: nil)
    }
}
