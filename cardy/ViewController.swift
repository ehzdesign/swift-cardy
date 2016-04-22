
//
//  ViewController.swift
//  cardy
//
//  Created by Erick Hernandez on 2016-04-07.
//  Copyright © 2016 Erick Hernandez. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase

class ViewController: UIViewController, UIScrollViewDelegate, CardDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!

    
//    let albumImages = ["clouds","clouds","clouds","clouds","clouds","clouds"]
    

    
    //create a counter for cards in database
    var count:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        //*********** map ***********//
        
//        print("test")
        
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
        
        
        
        
    
        
        let ref = Firebase(url:"https://vivid-torch-2205.firebaseio.com/usersCards")
        
  
        
        //watch the database of cards and return their values
        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            
            //make a new card
            var newCard = Card(frame:CGRect(x: 0, y: CGFloat(235*self.count), width: self.scrollView.frame.width - 20, height: 220))
            
            //add card to scrollview
            self.scrollView.addSubview(newCard)
//            print("new card added")
            
            
            //add image to card
            newCard.setup("clouds")
            
//            increase counter for every new card found
             self.count += 1;
            
            newCard.delegate = self;
            
            //set scroll view size based on how many cards
            self.scrollView.contentSize = CGSize(width: Int(self.scrollView.frame.width), height: 235 * self.count)
            self.scrollView.delegate = self

            
            
            
//            print(snapshot.value.objectForKey("amount"))
//            print(snapshot.value.objectForKey("cardNumber"))
//            print(snapshot.value.objectForKey("companyName"))
            

            
            }, withCancelBlock: { error in
                print(error.description)
        })
        
      
    
        
        

        
        
        
        
        
        
    }// viewdidload end
    
    func animationDidComplete(sender: Card) {
        print("my delegate worked!")
        print(sender)//tells you which one
        print(sender.albumImageName) //print name of album
        
        UIView.animateWithDuration(0.5, animations: {
            //sender.backgroundImage.alpha = 0.8
        })
        
    }
    
    
    
    func addCardAction(sender:UIButton!) {
        print("Adding a new Card")
    }
    
    func searchAction(sender:UIButton!) {
        print("Searching Vicinity")
    }
    
    func viewCardAction(sender:UIButton!) {
        print("Viewing my cards")
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}





