//
//  Poi.swift
//  MapKit0106
//
//  Created by Luc Derosne on 09/07/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

// point d'intérêt

import MapKit
import UIKit
    
struct Location { // vive la France
    static let trouville = Poi(title: "Trouville", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 49.367384, longitude: 0.074862), info: "Normandie", type: .playa)
    static let parcecrins = Poi(title: "Parc des écrins", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 44.841066, longitude: 6.281187), info: "Hautes Alpes", type: .parque)
}

class Poi: NSObject, MKAnnotation {
    enum PoiType : String {
        case playa = "Plage"
        case parque = "Parc"
    }
    let poiType : PoiType
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var info: String
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, info: String,type: PoiType) {
        poiType = type
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.info = info
    }
    
    
}
