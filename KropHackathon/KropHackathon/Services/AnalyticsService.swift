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
}

enum AnalyticsEvent: String, Codable {
    case PROFILE_SCREEN_OPEN
    case PROFILE_LOGOUT_PRESS
    case POPUP_LOGOUT_YES
    case POPUP_LOGOUT_NO
}
