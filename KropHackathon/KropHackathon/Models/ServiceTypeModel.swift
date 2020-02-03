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
    var tagImage: String
    var backColor: UIColor
    var services: [String]
    
    init(name: String, image: String, tagImage: String, backColor: UIColor, services: [String]) {
        self.name = name
        self.image = image
        self.backColor = backColor
        self.services = services
        self.tagImage = tagImage
    }
    
    func copy() -> ServiceTypeModel{
        return ServiceTypeModel.init(name: name, image: image, tagImage: tagImage, backColor: backColor, services: services)
    }
    
}
