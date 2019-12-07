//
//  MapView.swift
//  Metro
//
//  Created by Sergey Pritula on 4/24/19.
//  Copyright © 2019 Onix. All rights reserved.
//

import UIKit
import GoogleMaps

final class MapView: UIView {
    private let defaultLocation = CLLocation(latitude: 50.4547, longitude: 30.5238)
    
    @IBOutlet private weak var ivMap: GMSMapView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.nibSetup()
    }
    
    func customSetup(with coordinate: CLLocationCoordinate2D?) {
        ivMap.isMyLocationEnabled = true
        ivMap.settings.myLocationButton = false
        
        ivMap.animate(toZoom: 12)
        
        if let coordinate = coordinate {
            ivMap.animate(toLocation: coordinate)
        } else {
            ivMap.animate(toLocation: defaultLocation.coordinate)
        }
    }
    
    func moveToLocation(location: CLLocationCoordinate2D) {
        ivMap.animate(toZoom: 16)
        ivMap.animate(toLocation: location)
    }
    
    func addMarker(coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker()
        marker.position = coordinate
        marker.icon = UIImage(named: "icPin")
        marker.map = ivMap
    }
    
}
