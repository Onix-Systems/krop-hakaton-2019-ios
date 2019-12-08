//
//  AnalyticsService.swift
//
//  Created by Sergey Pritula on 9/24/19.
//  Copyright © 2019 Onix. All rights reserved.
//

import Foundation
import FirebaseAnalytics

protocol AnalyticsServiceType: Service {
    func log(event: AnalyticsEvent, parameters: [String: Any]?)
}

class AnalyticsService: AnalyticsServiceType {
    
    func log(event: AnalyticsEvent, parameters: [String: Any]?) {
        Analytics.logEvent(event.rawValue, parameters: parameters)
    }
    
}

enum AnalyticsParameter: String, Codable {
    case TYPE
    case TEXT
}

enum AnalyticsEvent: String, Codable {
    case APP_OPEN
    case CATEGORY_OPEN // TYPE
    case ABOUT_OPEN
    case GO_TO_ONIX
    case HOSPITAL_OPEN
    case GOOGLEMAP_OPEN
    case SEARCH //TEXT
}
