//
//  HospitalModel.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

class HospitalModel {
    let id: Int
    let title: String
    let address: String
    let schedule: String
    
    init(title: String, address: String, schedule: String) {
        self.id = 666
        self.title = title
        self.address = address
        self.schedule = schedule
    }
    
    init(model: Hospital) {
        self.id = model.id
        self.title = model.name ?? ""
        self.address = model.adress ?? ""
        self.schedule = model.workTime ?? ""
    }
    
}
