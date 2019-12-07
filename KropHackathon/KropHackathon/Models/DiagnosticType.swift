//
//  SubGroup.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 07.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

struct EquipmentsResponse: Codable, Equatable {
    let status: Int
    let code: String
    let message: String

    let data: Equipments
}

struct Equipments: Codable, Equatable {
    let qty: Int
    let categories: [DiagnosticType]

}

struct DiagnosticType: Codable, Equatable {
    
    let id: Int
    let structureName: String
    let diagnosticSubgroup: String
    let diagnosticType: String

    enum CodingKeys: String, CodingKey {
       case id
       case structureName = "structure_name"
       case diagnosticSubgroup = "diagnostic_subgroup" // Ультразвукові
       case diagnosticType = "diagnostic_type" // нирок
    }
    
}

//struct DiagnosticType: Codable, Equatable {
//
//    let id: Int
//    let custodianName: String
//    let custodianIdentifier: String
//    let addressCountryName: String
//    let addressRegion: String
//    let addressLocality: String
//    let addressStreetAddress: String
//    let latitude: String
//    let longitude: String
//    let equipmentTitle: String
//    let equipmentModel: String?
//    let snEquipment: String?
//    let equipmentIdentifier: String
//    let producerCountry: String?
//    let producerName: String?
//    let producerIdentifier: String?
//    let equipmentYear: String?
//    let equipmentLife: String?
//    let registrationDate: String?
//    let equipCondition: String
//    let repairDate: String?
//    let repairType: String?
//    let structureName: String
//    let floorNumber: String?
//    let roomNumber: String
//    let inspectionType: String
//    let diagnosticSubgroup: String
//    let diagnosticType: String
//    let diagnosticQuantity: String?
//    let workShedule: String?
//    let availabilityRestriction: String?
//
//    enum CodingKeys: String, CodingKey {
//       case id
//       case custodianName = "custodian_name"
//       case custodianIdentifier = "custodian_identifier"
//       case addressCountryName = "address_country_name"
//       case addressRegion = "address_region"
//       case addressLocality = "address_locality"
//       case addressStreetAddress = "address_street_address"
//       case latitude
//       case longitude
//       case equipmentTitle = "equipment_title"
//       case equipmentModel = "equipment_model"
//       case snEquipment = "sn_equipment"
//       case equipmentIdentifier = "equipment_identifier"
//       case producerCountry = "producer_country"
//       case producerName = "producer_name"
//       case producerIdentifier = "producer_identifier"
//       case equipmentYear = "equipment_year"
//       case equipmentLife = "equipment_life"
//       case registrationDate = "registration_date"
//       case equipCondition = "equip_condition"
//       case repairDate = "repair_date"
//       case repairType = "repair_type"
//       case structureName = "structure_name"
//       case floorNumber = "floor_number"
//       case roomNumber = "room_number"
//       case inspectionType = "inspection_type"
//       case diagnosticSubgroup = "diagnostic_subgroup" // Ультразвукові
//       case diagnosticType = "diagnostic_type" // нирок
//       case diagnosticQuantity = "diagnostic_quantity"
//       case workShedule = "work_shedule"
//       case availabilityRestriction = "availability_restriction"
//    }
//
//}
