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
    
    func openDetails()
    func goBack()
}

final class ListCoordinator: ListCoordinatorType {
    
    private weak var controller: ListViewController? = Storyboard.list.instantiateViewController()
    private let navigationController: UINavigationController?
    private var serviceHolder: ServiceHolder!
    
    init(navigationController: UINavigationController?, serviceHolder: ServiceHolder) {
        self.navigationController = navigationController
        self.navigationController?.navigationBar.isTranslucent = true
        self.serviceHolder = serviceHolder
        controller?.viewModel = ListViewModel(self, serviceHolder: self.serviceHolder)
    }
    
    func start() {
        if let controller = controller {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
        
    func openDetails() {
//        let coordinator = DetailsCoordinator(navigationController: navigationController, serviceHolder: serviceHolder)
//        coordinator.start()
        print("Coordinator: openDetails()")
    }

    func goBack() {
        _ = navigationController?.popViewController(animated: true)
    }

    deinit {
        print("ListCoordinator - deinit")
    }

}
