//
//  AllData.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 07.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

struct AllData: Codable, Equatable {
    let status: Int
    let code: String
    let message: String?

    let data: [Categories]
    
}
