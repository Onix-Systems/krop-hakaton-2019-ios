//
//  HospitalInfoDetailModel.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 05.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

final class HospitalInfoDetailModel {
    let infoType: DetailsInfoType
    let infoTypeStr: String
    let info: String
    
    init(infoType: DetailsInfoType, infoTypeStr: String, info: String) {
        self.infoType = infoType
        self.infoTypeStr = infoTypeStr
        self.info = info
    }
}
