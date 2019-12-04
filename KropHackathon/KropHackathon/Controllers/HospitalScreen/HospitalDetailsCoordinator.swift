//
//  HospitalDetailsCoordinator.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import UIKit

protocol HospitalDetailsCoordinatorType {
    func start()
    
    func openMap()
    func goBack()
}

final class HospitalDetailsCoordinator: HospitalDetailsCoordinatorType {
    
    private weak var controller: HospitalDetailesController? = Storyboard.hospital.instantiateViewController()
    private let navigationController: UINavigationController?
    private var serviceHolder: ServiceHolder!
    
    init(navigationController: UINavigationController?, serviceHolder: ServiceHolder) {
        self.navigationController = navigationController
        self.navigationController?.navigationBar.isTranslucent = true
        self.serviceHolder = serviceHolder
        controller?.viewModel = HospitalDetailesModel(self, serviceHolder: self.serviceHolder)
    }
    
    func start() {
        if let controller = controller {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
        
    func openMap() {
//        let coordinator = DetailsCoordinator(navigationController: navigationController, serviceHolder: serviceHolder)
//        coordinator.start()
        print("Coordinator: openMap()")
    }

    func goBack() {
        _ = navigationController?.popViewController(animated: true)
    }

    deinit {
        print("ListCoordinator - deinit")
    }

}
