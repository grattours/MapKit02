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

struct Location {
    static let corcovadoBeach = Poi(title: "Corcovado Beach", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 8.514225, longitude: -83.638324), info: "Puntarenas", type: .playa)
    static let islaTortuga = Poi(title: "Isla Tortuga", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.773453, longitude: -84.895450), info: "Puntarenas", type: .playa)
    static let playaVentanas = Poi(title: "Playa Ventanas", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.341151, longitude: -85.854492), info: "Guanacaste", type: .playa)
    static let playaAvellana = Poi(title: "Playa Avellana", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.239274, longitude: -85.843296), info: "Guanacaste", type: .playa)
    static let playaBlanca = Poi(title: "Playa Blanca", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.736276, longitude: -82.825828), info: "Cahuita", type: .playa)
    static let playaCarrillo = Poi(title: "Playa Carrillo", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.867033, longitude: -85.482989), info: "Guanacaste", type: .playa)
    static let playaCocles = Poi(title: "Playa Cocles", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.648401, longitude: -82.732696), info: "Limon", type: .playa)
    static let playaConchal = Poi(title: "Playa Conchal", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.399606, longitude: -85.811505), info: "Guanacaste", type: .playa)
    static let playaCopal = Poi(title: "Playa Copal", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 11.028587, longitude: -85.704245), info: "Guanacaste", type: .playa)
    static let playaCoyote = Poi(title: "Playa Coyote", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.788471, longitude: -85.275673), info: "Guanacaste", type: .playa)
    static let playaDominical = Poi(title: "Playa Dominical", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.253640, longitude: -83.870131), info: "Puntaneras", type: .playa)
    static let playaGuiones = Poi(title: "Playa Guiones", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.934778, longitude: -85.665214), info: "Guanacaste", type: .playa)
    static let playaHermosa = Poi(title: "Playa Hermosa", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.575106, longitude: -85.678832), info: "Guanacaste", type: .playa)
    static let playaManuelAntonio  = Poi(title: "Playa Manuel Antonio ", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.381115, longitude: -84.145658), info: "", type: .playa)
    static let playaNegra = Poi(title: "Playa Negra", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.744218, longitude: -82.853204), info: "Cahuita", type: .playa)
    static let playaPuertoViejo = Poi(title: "Playa Puerto Viejo de Talamanca", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.657951, longitude: -82.753760), info: "", type: .playa)
    static let playaPuntaUva = Poi(title: "Playa Punta Uva", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.637706, longitude: -82.695411), info: "", type: .playa)
    static let playaSamara = Poi(title: "Playa Samara", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.879465, longitude: -85.518415), info: "Guanacaste", type: .playa)
    static let playaSantaTeresa = Poi(title: "Playa Santa Teresa", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.641880, longitude: -85.168857), info: "Puntarenas", type: .playa)
    static let playaTamarindo = Poi(title: "Playa Tamarindo", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.296618, longitude: -85.845957), info: "", type: .playa)
    static let playaUvita = Poi(title: "Playa Uvita", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.151113, longitude: -83.740072), info: "Puntarenas", type: .playa)
    static let playaVargas = Poi(title: "Playa Vargas", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.731408, longitude: -82.814705), info: "Cahuita", type: .playa)
    static let puntaUva = Poi(title: "Punta Uva", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.637718, longitude: -82.695413), info: "Limon", type: .parque)
    static let parcPoas = Poi(title: "Parc National Volcan Poás", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.186050, longitude: -84.236462), info: "AlaJuela", type: .parque)
    static let parcIrazu = Poi(title: "Parc National Volcan Irazú", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.980961, longitude: -83.849057), info: "Cartago", type: .parque)
    static let parcCarillo = Poi(title: "Parc National Braulio Carrillo", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.152950, longitude: -84.094192), info: "Barva", type: .parque)
    static let parcTurrialba = Poi(title: "Parc National Volcan Turrialba", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.017825, longitude: -83.764750), info: "Cartago", type: .parque)
    static let parcTortuguero = Poi(title: "Parc National Tortuguero", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.546429, longitude: -83.596727), info: "Limón", type: .parque)
    static let ParcCahuita = Poi(title: "Parc National Cahuita", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.736603, longitude: -82.838991), info: "Cahuita", type: .parque)
    static let parcTenorio = Poi(title: "Parc National volcan Tenorio", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.658550, longitude: -84.971292), info: "Alajuela", type: .parque)
    static let parcArenal = Poi(title: "Parc National volcan Arenal", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.461256, longitude: -84.728156), info: "La Fortuna", type: .parque)
    static let parcRinconDeLaVieja = Poi(title: "Parc National Rincon de la Vieja",subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.773442, longitude: -85.349159), info: "Guanacaste", type: .parque)
    static let parcBaulas = Poi(title: "Parc National Las Baulas", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.335516, longitude: -85.847254), info: "Guanacaste", type: .parque)
    static let parcPaloVerde = Poi(title: "Parc National Palo Verde", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.383673, longitude: -85.334360), info: "Guanacaste", type: .parque)
    static let parcSantaRosa = Poi(title: "Parc National Santa Rosa", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.837845, longitude: -85.705227), info: "Guanacaste", type: .parque)
    static let parcBarraHonda = Poi(title: "Parc National Barra Honda", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 10.175113, longitude: -85.372084), info: "Guanacaste", type: .parque)
    static let parcManuelAntonio  = Poi(title: "Parc National Manuel Antonio", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.392478, longitude: -84.136186), info: "Puntarenas", type: .parque)
    static let parcCarara = Poi(title: "Parc National Carara", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.780981, longitude: -84.606549), info: "Puntarenas", type: .parque)
    static let parcQuetzales = Poi(title: "Parc National Los Quetzales", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.616113, longitude: -83.818232), info: "San José", type: .parque)
    static let parcTapenti = Poi(title: "Parc National Tapanti", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.759185, longitude: -83.783775), info: "Cartago", type: .parque)
    static let parcCorcovado = Poi(title: "Parc National Corcovado", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 8.541207, longitude: -83.570721), info: "Peninsula de Osa", type: .parque)
    static let parcMarinoBellena = Poi(title: "Parc National Marino Bellena", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.156009, longitude: -83.747847), info: "Uvita", type: .parque)
    static let parcChirripo = Poi(title: "Parc National Chirripo", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.513616, longitude: -83.494277), info: "Pérez", type: .parque)
    static let parcGandoca = Poi(title: "Refuge Gandica Manzanillo", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 9.657093, longitude: -82.681541), info: " Limón", type: .parque)
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
