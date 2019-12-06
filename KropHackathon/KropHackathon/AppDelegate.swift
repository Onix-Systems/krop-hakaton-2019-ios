//
//  AppDelegate.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 02.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
 class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        if #available(iOS 13.0, *) {
            window.overrideUserInterfaceStyle = .light
        }
        
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()

        registerServices()
        
        return true
    }
    
    private func registerServices() {
        GMSServices.provideAPIKey("AIzaSyCAP2LU5feqcYlzFpix9QTGtKV0eAuC5hc")
    }

}
