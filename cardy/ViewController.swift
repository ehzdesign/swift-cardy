//
//  ViewController.swift
//  cardy
//
//  Created by Erick Hernandez on 2016-04-07.
//  Copyright © 2016 Erick Hernandez. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
//    var latitude:CLLocationDegrees = 0.0
//    var longitude:CLLocationDegrees = 0.0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Core Location Manager asks for GPS location
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestLocation()
        
//        let latitude = locationManager.location?.coordinate.latitude
//        let longitude = locationManager.location?.coordinate.longitude
        
        locationManager.startMonitoringSignificantLocationChanges()
        
     
        // Do any additional setup after loading the view, typically from a nib.
        let camera = GMSCameraPosition.cameraWithLatitude(-70.00,
                                                          longitude: 33.45, zoom: 6)
        
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
     
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-70.00, 33.45)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
    
        
      
    }
   
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





