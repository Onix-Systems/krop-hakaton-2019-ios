//
//  MapPin.swift
//  KropHackathon
//
//  Created by Альона Дробко on 08.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import MapKit

class Pin: NSObject, MKAnnotation {
  let title: String? = ""
  let locationName: String? = ""
  let discipline: String? = ""
  let coordinate: CLLocationCoordinate2D
  
  init(coordinate: CLLocationCoordinate2D) {
    self.coordinate = coordinate
    super.init()
  }
    
}
