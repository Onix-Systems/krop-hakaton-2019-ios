//
//  HospitalModel.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

class HospitalModel {
    let title: String
    let address: String
    let schedule: String
    
    init(title: String, address: String, schedule: String) {
        self.title = title
        self.address = address
        self.schedule = schedule
    }
    
}
