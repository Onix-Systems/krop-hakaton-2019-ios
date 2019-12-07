//
//  Hospital.swift
//  KropHackathon
//
//  Created by Альона Дробко on 07.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

final class Hospital: Codable {
    
    var id: Int
    var name: String?
    var adress: String?
    var lan: String?
    var lat: String?
    var workTime: String?
    var unworkTime: String?
    var roomNumber: Int?
    var floorNumber: Int?
    var equipName: String?
    var structureName: String?
    var equipCountry: String?
    var eqipYear: String?
    var equipCondition: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "custodian_name"
        case adress = "address_street_address"
        case lan = "longitude"
        case lat = "latitude"
        case workTime = "work_shedule"
        case unworkTime = "availability_restriction"
        case roomNumber = "room_number"
        case floorNumber = "floor_number"
        case equipName = "equipment_title"
        case structureName = "structure_name"
        case equipCountry = "producer_country"
        case eqipYear = "equipment_year"
        case equipCondition = "equip_condition"
    }
}


class HospitalRequest: Codable {
    var status: Int
    var message: String
    var data: [String: [Hospital]]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
}

class HospitalsRequest: Codable {
    var status: Int
    var message: String
    var data: HospitalsData?
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
}

class HospitalsData: Codable {
    var qty: Int
    var hospitals: [Hospital]
    
    enum CodingKeys: String, CodingKey {
        case qty
        case hospitals
    }
}
