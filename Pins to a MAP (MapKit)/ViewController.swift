//
//  ViewController.swift
//  Pins to a MAP (MapKit)
//
//  Created by Fahim Rahman on 8/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locations = [
        
        Location(title: "Dr. James Golf Course", latitude: 40.003252, longitude: -86.0655897),
        Location(title: "Avon Town Hall", latitude: 39.7636057, longitude: -86.4080829),
        Location(title: "Brookside Park", latitude: 39.7897185, longitude: -86.1070623)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        annotationsOnMap()
        
    }
    
    func annotationsOnMap() {
        
        for location in locations {

            let annotations = MKPointAnnotation()

            annotations.title = location.title
            annotations.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            
            mapView.addAnnotation(annotations)
            
            let locationCoordinate2d = annotations.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            let region = MKCoordinateRegion(center: locationCoordinate2d, span: span)
            
            mapView.setRegion(region, animated: true)
        }
    }
}
