//
//  ServiceTypeModel.swift
//  KropHackathon
//
//  Created by Альона Дробко on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

final class ServiceTypeModel {
    
    var name: String
    var image: String
    var backColor: UIColor
    var servises: [String]
    
    init(name: String, image: String, backColor: UIColor, services: [String]) {
        self.name = name
        self.image = image
        self.backColor = backColor
        self.servises = services
    }
    
}
