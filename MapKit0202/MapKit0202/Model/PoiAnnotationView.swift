//
//  PoiAnnotationView.swift
//  MapKit0201
//
//  Created by Luc Derosne on 16/07/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

//import MapKit
//
//class PoiAnnotationView: MKMarkerAnnotationView {
//    override var annotation: MKAnnotation? {
//        willSet {
//            if let poi = newValue as? Poi {
//                // clusteringIdentifier = poi.poiType.rawValue
//                clusteringIdentifier = "Poi"
//                switch poi.poiType {
//                case .playa:
//                    markerTintColor = UIColor.blue
//                    glyphText = "🏝"
//                case .parque:
//                    markerTintColor = UIColor.green
//                    glyphText = "🌋"
//                }
//            }
//            //            markerTintColor = UIColor.init(red: 118/255, green: 135/255, blue:204/135, alpha: 1)
//            //            glyphImage = UIImage(named: "ping")
//            //            glyphTintColor = .green
//            //            canShowCallout = true
//            //            calloutOffset = CGPoint(x: -5, y: 5)
//            //            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        }
//    }
//    
//}
