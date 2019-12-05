//
//  MapView.swift
//  Metro
//
//  Created by Sergey Pritula on 4/24/19.
//  Copyright © 2019 Onix. All rights reserved.
//

import UIKit
import GoogleMaps

protocol MapViewDelegate: class {
    func didMarkerTapped(with coordinates: CLLocationCoordinate2D)
    func didMapTapped()
}

class MapView: UIView {
    private let defaultLocation = CLLocation(latitude: 50.4547, longitude: 30.5238)
    
    @IBOutlet weak var ivMap: GMSMapView!
    
    weak var delegate: MapViewDelegate?
    
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
        
        ivMap.delegate = self
        
        ivMap.animate(toZoom: 12)
        
        if let coordinate = coordinate {
            ivMap.animate(toLocation: coordinate)
        } else {
            ivMap.animate(toLocation: defaultLocation.coordinate)
        }
    }
    
    func moveToLocation(location: CLLocation) {
        ivMap.animate(toZoom: 16)
        ivMap.animate(toLocation: location.coordinate)
    }
    
    func moveToDefaultLocation() {
        ivMap.animate(toZoom: 12)
        ivMap.animate(toLocation: defaultLocation.coordinate)
    }
    
    func addMarker(coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker()
        marker.position = coordinate
        marker.icon = UIImage(named: "icPin")
        marker.map = ivMap
    }

    func moveToPoint(showInfo: Bool = true) {
        ivMap.animate(toZoom: 12)
        //ivMap.animate(toLocation: model.coordinate)
    }
    
    func localize() {
        
    }
    
}

extension MapView: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        delegate?.didMarkerTapped(with: marker.position)
        return true
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        delegate?.didMapTapped()
    }
    
}
