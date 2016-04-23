
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
            let newCard = Card(frame:CGRect(x: 0, y: CGFloat(235*self.count), width: self.scrollView.frame.width - 20, height: 220))
            
           
            //add card to scrollview
            self.scrollView.addSubview(newCard)
            print("here it is\(snapshot.key)")
            
//            store data in variables
            let cardKey = snapshot.key
            let companyName = (snapshot.value.objectForKey("companyName")as? String)!
            let amount = (snapshot.value.objectForKey("amount")as? String)!
            let cardNumber = (snapshot.value.objectForKey("cardNumber")as? String)!
            
            
            
            //add image to card
            newCard.setup("clouds", textLabelValue: companyName, amountLabelValue: amount, cardNumberLabelValue:cardNumber,cardKey:cardKey)
            
            
            newCard.setBGColor(self.count)
//            increase counter for every new card found
             self.count += 1;
            
            //i dont know what this does
            newCard.delegate = self;
            
            //set scroll view size based on how many cards
            self.scrollView.contentSize = CGSize(width: Int(self.scrollView.frame.width), height: 235 * self.count)
            self.scrollView.delegate = self

    
            

            
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
    
    
    
    //run this function when card is tapped
    func tappedCard(sender: Card) {
        
//        open view controller cardDetailVC
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewControllerWithIdentifier("cardDetailVC") as! cardDetailVC
        
       
    
    

        
        //url to specific card in firebase
         let ref = Firebase(url:"https://vivid-torch-2205.firebaseio.com/usersCards/\(sender.cardKey)")
        ref.observeSingleEventOfType(.Value, withBlock: { snapshot in
            print(snapshot)
        
      
         //prepare data for transfer to view controller
         vc.cardDataCompanyName = snapshot.value.objectForKey("companyName") as? String!
         vc.cardDataAmount = snapshot.value.objectForKey("amount") as? String!
         vc.cardDataCardNumber = snapshot.value.objectForKey("cardNumber") as? String!
            
         vc.cardBGColor = sender.backgroundColor
        
        self.presentViewController(vc, animated: true, completion: nil)
            
        })
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}





