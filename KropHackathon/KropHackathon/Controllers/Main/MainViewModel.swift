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
    func openDetails(_ index: Int)
    func search(text: String?)
}

final class MainViewModel: MainViewModelType {
    
    var serviceModels: [ServiceTypeModel] = []
    var searchModels: [HospitalModel] = []
    
    private let coordinator: MainCoordinatorType
    private let networkService: NetworkServiceType
    private let disposeBag = DisposeBag()

    var didLoadData: (() -> Void)?
    var didLoadFailed: ((String) -> Void)?
    
    init(_ coordinator: MainCoordinatorType, serviceHolder: ServiceHolder) {
        
        self.coordinator = coordinator
        serviceModels = Mock.serviceModels
        
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
                searchModels.forEach { (element) in
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
            let style = setCellStyle(category: category.element)
            let serviceType = ServiceTypeModel(name: category.element.name, image: style.0, backColor: style.1, services: category.element.list)
            serviceModels.append(serviceType)
        }
    }
    
    private func setCellStyle(category: Category) -> (String, UIColor) {
        if category.name.contains("льтразвук") {
            return ("img_uzi", Style.Color.uziPink)
        }
        if category.name.contains("ентген") {
            return ("img_rentgen", Style.Color.rengenBlue)
        }
        if category.name.contains("ункц") {
            return ("img_funct", Style.Color.funcOrange)
        }
        if category.name.contains("ндо") {
            return ("img_endo", Style.Color.endGreen)
        }
        return ("img_all", Style.Color.pinkDef)
    }
    
    func search(text: String?) {
        self.didLoadData?()
    }
    
    func openDetails(_ index: Int) {
        networkService.getHospital(id: searchModels[index].id)
        coordinator.openDetails()
    }
    
    func openList(row: Int) {
        networkService.getServiceTypes()
        coordinator.openList(model: serviceModels[row])
    }
}
