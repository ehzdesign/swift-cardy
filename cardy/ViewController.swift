//
//  ViewController.swift
//  cardy
//
//  Created by Erick Hernandez on 2016-04-07.
//  Copyright © 2016 Erick Hernandez. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, UIScrollViewDelegate, CardDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    
    let cardImages = ["","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //*********** map ***********//
        
        print("test")
        
        // Do any additional setup after loading the view, typically from a nib.
        let camera = GMSCameraPosition.cameraWithLatitude(-33.86,
                                                          longitude: 151.20, zoom: 6)
        
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        //*********** map ***********//
        
        
        
        //*********** scroll size ***********//
        //scrollView.contentSize = CGRect(width: 200, height: 200 * card.count)
        //scrollView.contentSize = CGRect(x: 0, y: 0, width: 100, height: 100)
        scrollView.delegate = self
        
    }
    func testAnimation(sender:Card) {
        print("test")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





