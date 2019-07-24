//
//  PoiAnnotationView.swift
//  MapKit0205
//
//  Created by Luc Derosne on 16/07/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//
// Le flyover

import MapKit

class PoiAnnotationView: MKMarkerAnnotationView {
    
    let distance: CLLocationDistance = 800
    let pitch: CGFloat = 400
    let heading = 45.0
    var camera: MKMapCamera?
    
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
                detailCalloutAccessoryView = setupCenter()
            }
        }
    }
    
    func setupLeft() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
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

    func setupCenter() -> UIButton {
        //(_ poiCoordinate: CLLocationCoordinate2D) -> UIView? {
        // mapView.mapType = .satelliteFlyover
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        button.setImage(UIImage(named: "3D"), for: .normal)
        button.addTarget(self, action: #selector(fly), for: .touchUpInside)
        return button


        // mapView.camera = camera!
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//        button.setImage(UIImage(named: "3D"), for: .normal)
//        button.addTarget(self, action: #selector(gps), for: .touchUpInside)
//        return button
//        guard let anno = annotation as? MonAnnotation else { return nil}
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 125, height: 125))
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.widthAnchor.constraint(equalToConstant: 125).isActive = true
//        view.heightAnchor.constraint(equalToConstant: 125).isActive = true
//
//        let imageView = UIImageView(frame: view.bounds)
//        imageView.image = anno.oeuvre.image
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//        view.addSubview(imageView)
        
//        return view
        
    }
    
    @objc func fly() {
        guard let anno = annotation as? Poi else { return }
        //
        self.camera = MKMapCamera(lookingAtCenter: anno.coordinate, fromDistance: distance, pitch: pitch, heading: heading)
       view.camera = camera!
    }
    
}
