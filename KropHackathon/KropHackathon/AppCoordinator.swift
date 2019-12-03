//
//  AppCoordinator.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

final class AppCoordinator {
    private var navigationController: UINavigationController?
    private let window: UIWindow
    
//    private var mapService: mapServiceType!
//    private var medicalService: MedicalService!

    private var serviceHolder: ServiceHolder!
    
    private var mainCoordinator: MainCoordinatorType?

    init(window: UIWindow) {
        self.window = window
        
        startServices()
    }
    
    private func startServices() {
        serviceHolder = ServiceHolder()
        
//        mapService = MapService()
//        medicalService = MedicalService()
        
//        serviceHolder.add(MapServiceType.self, for: mapService)
//        serviceHolder.add(MedicalServiceType.self, for: medicalService)

    }
    
    func start() {
        navigationController = UINavigationController()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        mainCoordinator = MainCoordinator(navigationController: navigationController, serviceHolder: serviceHolder)
        mainCoordinator?.start()
    }
    
}
