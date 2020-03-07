//
//  ViewController.swift
//  Pins to a MAP (MapKit)
//
//  Created by Fahim Rahman on 8/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locations = [
        
        Location(title: "New York, NY", latitude: 40.713054, longitude: -74.007228),
        Location(title: "Los Angeles, CA", latitude: 34.052238, longitude: -118.243344),
        Location(title: "Chicago, IL", latitude: 41.883229, longitude: -87.632398)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for location in locations {
            
            let annotation = MKPointAnnotation()
            
            annotation.title = location.title
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            
            let region = MKCoordinateRegion(center: annotation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
            
            mapView.addAnnotation(annotation)
            mapView.setRegion(region, animated: true)
        }
    }
}
