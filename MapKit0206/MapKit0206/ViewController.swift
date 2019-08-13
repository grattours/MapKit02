//
//  ViewController.swift
//  MapKit0206
//
//  Created by Luc Derosne on 24/07/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//
// 2.6 flyover

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let distance: CLLocationDistance = 400
    let pitch: CGFloat = 280
    let heading = 45.0
    var camera: MKMapCamera?
    
    let notreDameCoordinate = CLLocationCoordinate2DMake(48.852982, 2.349902)
    let colyseeCoordinate = CLLocationCoordinate2DMake(41.890434, 12.492198)
    let empireCoordinate = CLLocationCoordinate2DMake(40.748717, -73.984948)
    // statue de la Liberté  NY 40.689410, -74.044405
    // tour Eiffel 48.858281, 2.294580
    var coordinate = CLLocationCoordinate2DMake(48.852982, 2.349902)
    
    
    fileprivate func cameraFunc() {
        camera = MKMapCamera(lookingAtCenter: coordinate, fromEyeCoordinate: coordinate, eyeAltitude: 200)
        mapView.camera = camera!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.mapType = .satelliteFlyover
        cameraFunc()
    }


    @IBAction func changePlace(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 :
            coordinate = notreDameCoordinate
        case 1 :
            coordinate = colyseeCoordinate
        case 2 :
            coordinate = empireCoordinate
        default:
            break
        }
        cameraFunc()
    }
    
    @IBAction func animateCamera(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 20.0, animations: {
            self.camera!.heading += 180
            self.camera!.pitch = 25
            self.mapView.camera = self.camera!
        })
    }
}

