//
//  ServiceDetailsModel.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

class ServiceDetailsModel {
    var serviceTypeName: String
    var serviceDetailsName: String
    
    init(serviceTypeName: String, serviceDetailsName: String) {
        self.serviceTypeName = serviceTypeName
        self.serviceDetailsName = serviceDetailsName
    }
    
}
