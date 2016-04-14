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
//
//    let cardImages = ["clouds.jpeg","clouds.jpeg","clouds.jpeg"]
    
    let albumImages = ["clouds","clouds","clouds","clouds","clouds","clouds"]
    
    var albums:[Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //*********** map ***********//
        
        print("test")
        
//        // Do any additional setup after loading the view, typically from a nib.
//        let camera = GMSCameraPosition.cameraWithLatitude(-33.86,
//                                                          longitude: 151.20, zoom: 6)
//        
//        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
//        mapView.myLocationEnabled = true
//        self.view = mapView
//        
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
        
        //*********** map end ***********//
    
        
       
        
        
            
            var count:Double = 0
            for albumImage in albumImages {
                let newAlbum = Card(frame:CGRect(x: 0, y: CGFloat(235*count), width: scrollView.frame.width - 20, height: 220))
                newAlbum.count = count
                newAlbum.setup(albumImage)
                scrollView.addSubview(newAlbum)
                albums.append(newAlbum)
                count+=1;
                
                print("card size:\(newAlbum.frame.width)")
                
                newAlbum.delegate = self;
                
            }
            
            //*********** scroll view size ***********//
    
//            scrollView.contentSize = CGSize(width: scrollViewWidth, height: 235 * albumImages.count)
//        scrollView.contentSize = CGSize(width: Int(scrollView.frame.width), height: 235 * albumImages.count)
       
//        scrollView.contentSize = CGSize(width: Int(scrollView.frame.width), height: 235 * albumImages.count)
        scrollView.delegate = self
        print(scrollView.frame.width)
        print(scrollView.contentSize)
        
        //*********** scroll view size end ***********//
            
            
        }// viewdidload end
        
        func animationDidComplete(sender: Card) {
            print("my delegate worked!")
            print(sender)//tells you which one
            print(sender.albumImageName) //print name of album
            
            UIView.animateWithDuration(0.5, animations: {
                //sender.backgroundImage.alpha = 0.8
            })
            
        }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





