//
//  PoiAnnotationView.swift
//  MapKit0205
//
//  Created by Luc Derosne on 16/07/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//
// Tracer un itinéraire

import MapKit

class PoiAnnotationView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            if let poi = newValue as? Poi {
                // clusteringIdentifier = poi.poiType.rawValue
                clusteringIdentifier = "Poi"
                switch poi.poiType {
                case .playa:
                    markerTintColor = UIColor.blue
                    glyphText = "⛱"
                case .parque:
                    markerTintColor = UIColor.green
                    glyphText = "🦜"
                }
                canShowCallout = true
                calloutOffset = CGPoint(x: -5, y: 5)
                rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                leftCalloutAccessoryView = setupLeft()
            }
        }
    }
    
    func setupLeft() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: "distance"), for: .normal)
        button.addTarget(self, action: #selector(gps), for: .touchUpInside)
        return button
    }
    
    @objc func gps() {
        guard let anno = annotation as? Poi else { return }
        let placemark = MKPlacemark(coordinate: anno.coordinate)
        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        let map = MKMapItem(placemark: placemark)
        map.openInMaps(launchOptions: options)
    }

}
