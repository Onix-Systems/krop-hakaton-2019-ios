//
//  Categories.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 07.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

struct CategoriesResponse: Codable, Equatable {
    let status: Int
    let code: String
    let message: String

    let data: Categories
}

struct Categories: Codable, Equatable {
    let qty: Int
    let categories: [Category]
    
}

struct Category: Codable, Equatable {
    let name: String // name of categoty, i.e. "Ультразвукові дослідження"
    let list: [String] // names of subCategories, i.e. "Ультразвукові дослідження нирок"
    
}
