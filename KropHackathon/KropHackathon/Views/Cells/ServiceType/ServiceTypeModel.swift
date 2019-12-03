//
//  ServiceTypeModel.swift
//  KropHackathon
//
//  Created by Альона Дробко on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

class ServiceTypeModel {
    
    var name: String
    var image: String
    var arrayOfServices: [String]
    
    init(name: String, image: String, arrayOfServices: [String]) {
        self.name = name
        self.image = image
        self.arrayOfServices = arrayOfServices
    }
    
}
