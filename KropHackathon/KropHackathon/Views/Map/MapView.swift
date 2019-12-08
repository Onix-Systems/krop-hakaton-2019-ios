//
//  MapView.swift
//
//  Created by Sergey Pritula on 4/24/19.
//  Copyright © 2019 Onix. All rights reserved.
//

import UIKit
import MapKit

final class MapView: UIView {
    
    @IBOutlet private weak var ivMap: MKMapView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.nibSetup()
    }
    
    func customSetup(with coordinate: CLLocationCoordinate2D) {
        
        let regionRadius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegion(center: coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        ivMap.setRegion(coordinateRegion, animated: true)
        ivMap.isZoomEnabled = true
        ivMap.isScrollEnabled = true
    }
    
    func moveToLocation(coordinate: CLLocationCoordinate2D) {
        ivMap.isZoomEnabled = true
        
        let regionRadius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegion(center: coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        ivMap.setRegion(coordinateRegion, animated: true)
    }
    
    func addMarker(coordinate: CLLocationCoordinate2D) {
        let artwork = Pin(coordinate: coordinate)
        ivMap.addAnnotation(artwork)
    }
}
