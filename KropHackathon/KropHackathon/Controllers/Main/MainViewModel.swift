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
        searchModels = Mock.searchModel
        
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
               // self?.searchModels = searchModels
                self?.didLoadData?()
            case .failure(error: let error):
                self?.didLoadFailed?(error)
            }
        }).disposed(by: disposeBag)
    }
    
    private func createServiceTypesArray(categories: Categories) {
        serviceModels = []
        categories.categories.enumerated().forEach { category in
            let colors = Style.Color.serviceTypeColors
            let imgName = setCategoryImage(category: category.element)
            let serviceType = ServiceTypeModel(name: category.element.name, image: imgName, backColor: colors[category.offset % colors.count], services: category.element.list)
            serviceModels.append(serviceType)
        }
    }
    
    private func setCategoryImage(category: Category) -> String {
        if category.name.contains("Ультразвук") {
            return "img_uzi"
        }
        if category.name.contains("Рентген") {
            return "img_rentgen"
        }
        if category.name.contains("Функ") {
            return "img_funct"
        }
        if category.name.contains("Ендо") {
            return "img_endo"
        }
        return "img_all"
        
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
