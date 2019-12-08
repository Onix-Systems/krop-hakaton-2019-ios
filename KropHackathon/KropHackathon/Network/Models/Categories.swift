//
//  Categories.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 07.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

protocol Response {
    var status: Int { get set }
    var code: String { get set }
    var message: String { get set }
}

struct CategoriesResponse: Codable, Equatable, Response {
    var status: Int
    var code: String
    var message: String

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
