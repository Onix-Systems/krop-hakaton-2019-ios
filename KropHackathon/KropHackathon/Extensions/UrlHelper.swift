//
//  UrlHelper.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class UrlOpenHelper {
    static func open(url: String?) {
        if let url = url, let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let link = URL(string: encodedUrl) {
            UIApplication.shared.open(link, options: [:])
        }
    }
    
    static func openDirections(to coordinate: CLLocationCoordinate2D) {
        let urlStr = String.init(format: "https://maps.google.com/?saddr=Current Location&daddr=%1.6f,%1.6f&directionsmode=driving", coordinate.latitude, coordinate.longitude)
        UrlOpenHelper.open(url: urlStr)
    }
    
}
