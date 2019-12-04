//
//  MainCoordinator.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

protocol MainCoordinatorType {
    func start()
    func openList()
}

final class MainCoordinator: MainCoordinatorType {
    
    private weak var controller: MainViewController? = Storyboard.main.instantiateViewController()
    private let navigationController: UINavigationController?
    private var serviceHolder: ServiceHolder!
    
    init(navigationController: UINavigationController?, serviceHolder: ServiceHolder) {
        self.navigationController = navigationController
        self.navigationController?.navigationBar.isTranslucent = true
        self.serviceHolder = serviceHolder
        controller?.viewModel = MainViewModel(self, serviceHolder: self.serviceHolder)
    }
    
    func start() {
        if let controller = controller {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
        
    func openList() {
        let coordinator = ListCoordinator(navigationController: navigationController, serviceHolder: serviceHolder)
        coordinator.start()
    }
    
    deinit {
        print("MainCoordinator - deinit")
    }

}
