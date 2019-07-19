//
//  PoiAnnotationView.swift
//  MapKit0201
//
//  Created by Luc Derosne on 16/07/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//
// Des annotations avec un visuel proportionnel

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
            }
        }
    }
    
}
