//
//  ListCoordinator.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

protocol ListCoordinatorType {
    func start()
    
    func openHospitals(model: ServiceTypeModel)
    func openDetails()
    func goBack()
}

final class ListCoordinator: ListCoordinatorType {
    
    private weak var controller: ListViewController? = Storyboard.list.instantiateViewController()
    private let navigationController: UINavigationController?
    private var serviceHolder: ServiceHolder!
    
    init(navigationController: UINavigationController?, serviceHolder: ServiceHolder, _ screenType: ListScreenType = .serviceDetails, serviceTypeModel: ServiceTypeModel) {
        
        self.navigationController = navigationController
        self.serviceHolder = serviceHolder
        
        controller?.viewModel = ListViewModel(self, serviceHolder: self.serviceHolder, screenType: screenType, serviceTypeModel: serviceTypeModel)
    }
    
    func start() {
        if let controller = controller {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openHospitals(model: ServiceTypeModel) {
        let coordinator = ListCoordinator(navigationController: navigationController, serviceHolder: serviceHolder, .hospitals, serviceTypeModel: model)
        
        coordinator.start()
    }
    
    func openDetails() {
        let coordinator = HospitalDetailsCoordinator(navigationController: navigationController, serviceHolder: serviceHolder)
        coordinator.start()
    }
    
    func goBack() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("ListCoordinator - deinit")
    }
    
}
