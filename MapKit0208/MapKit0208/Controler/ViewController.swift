//
//  ViewController.swift
//  MapKit0106
//
//  Created by Luc Derosne on 09/07/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//
// Mapkit Part 2 Point 8
// renvoyer l’adresse et les coordonnées de n’importe quel point sur la carte

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var adressLabel: UILabel!
    
    // San José Capitale du Costa Rica pour centrer la carte
    // 9.928229, -84.090399
    var latitudeInit: Double = 9.928229
    var longitudeInit: Double = -84.090399
    var coordinateInit :  CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitudeInit, longitude: longitudeInit)
    }
    let locationManager = CLLocationManager()
    var userPosition: CLLocation?
    let regionInMeters: Double = 10000
    var geocoder: CLLocation?
    var previousLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.register(PoiAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(PoiClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        setup()
        setupLocationManager()
    }
    
    // action sur le segment
    @IBAction func ChangeMapTypeButton(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 : mapView.mapType = MKMapType.standard
        case 1 : mapView.mapType = .satellite
        case 2 : mapView.mapType = .hybrid
        default: break
        }
    }
    
    @IBAction func getPosition(_ sender: Any) {
        if userPosition != nil {
            setupMap(coordonnees: userPosition!.coordinate, myLat: 1, myLong: 1)
        } else {
            print("nil dans getPosition")
        }
    }

}

extension ViewController: MKMapViewDelegate {
    
    func setup() {
        setupMap(coordonnees: coordinateInit, myLat: 3, myLong: 3)
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.isRotateEnabled = true
        mapView.addAnnotations([Location.corcovadoBeach, Location.islaTortuga, Location.playaVentanas, Location.playaAvellana, Location.playaCarrillo, Location.playaCarrillo, Location.playaCocles, Location.playaCocles, Location.playaConchal, Location.playaCopal, Location.playaCoyote, Location.playaDominical, Location.playaGuiones, Location.playaHermosa, Location.playaManuelAntonio, Location.playaPuertoViejo, Location.playaPuntaUva, Location.playaSamara, Location.playaSantaTeresa, Location.playaTamarindo, Location.playaUvita, Location.playaVargas, Location.puntaUva])
        mapView.addAnnotations([Location.parcPoas, Location.parcIrazu, Location.parcCarillo, Location.parcTurrialba, Location.parcTortuguero, Location.ParcCahuita, Location.parcTenorio, Location.parcArenal, Location.parcRinconDeLaVieja, Location.parcBaulas, Location.parcPaloVerde, Location.parcCarara, Location.parcQuetzales, Location.parcMarinoBellena, Location.parcSantaRosa, Location.parcBarraHonda, Location.parcManuelAntonio, Location.parcTapenti, Location.parcCorcovado, Location.parcChirripo, Location.parcGandoca])
        
        let capitalArea = MKCircle(center: coordinateInit, radius: 5000) // rayon de 5 km
        mapView.addOverlay(capitalArea)
    }
    
    // appellé par le bouton "localise moi"
    func setupMap(coordonnees: CLLocationCoordinate2D, myLat: Double, myLong: Double) {
        let span = MKCoordinateSpan(latitudeDelta: myLat , longitudeDelta: myLong)
        let region = MKCoordinateRegion(center: coordonnees, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    // placer le titre et l'info du Poi dans l'alerte
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let poi = view.annotation as? Poi else { return }
        let placeName = poi.title
        let placeInfo = poi.info

        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    // définir un overlay
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let capitalAreaRenderer = MKCircleRenderer(circle: overlay as! MKCircle)
        capitalAreaRenderer.strokeColor = UIColor.lightGray
        return capitalAreaRenderer
        
    }
    
    func centerViewOnLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        self.previousLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            if let _ = error {
                print("geocoder not dispo")
                return
            }
            guard let placemark = placemarks?.first else {
                return
            }
            let lon = String(format: "%.04f", (placemark.location?.coordinate.longitude ?? 0.0))
            let lat = String(format: "%.04f", (placemark.location?.coordinate.latitude ?? 0.0))
            let country = placemark.country ?? ""
            let locality = placemark.locality ?? ""

            self.adressLabel.text = "\(lat) \(lon)"
            let streetNumber = placemark.subThoroughfare ?? ""
            let streetName = placemark.thoroughfare ?? ""

            DispatchQueue.main.async {
                self.adressLabel.text = " \(streetNumber) \(streetName) \n \(locality) \(country) \n lat \(lat) long \(lon)"
            } // dispatch
        }// geocoder
    } // func mapview
}

extension ViewController: CLLocationManagerDelegate {
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        mapView.camera.heading = newHeading.magneticHeading
        mapView.setCamera(mapView.camera, animated: true)
    }
    
    // si mise à jour des locations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            if let maPosition = locations.last {
                userPosition = maPosition
            }
        }
    }
    

} // end
