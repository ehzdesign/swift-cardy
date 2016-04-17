
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
        
        
        
        let addCard = UIButton(type: UIButtonType.System) as UIButton
        addCard.frame = CGRectMake(-0, 600, 100, 50)
        addCard.backgroundColor = UIColor.greenColor()
        addCard.setTitle("Add Card", forState: UIControlState.Normal)
        addCard.addTarget(self, action: "addCardAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        let search = UIButton(type: UIButtonType.System) as UIButton
        search.frame = CGRectMake(115, 600, 100, 50)
        search.backgroundColor = UIColor.greenColor()
        search.setTitle("Search", forState: UIControlState.Normal)
        search.addTarget(self, action: "searchAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        let viewCards = UIButton(type: UIButtonType.System) as UIButton
        viewCards.frame = CGRectMake(230, 600, 100, 50)
        viewCards.backgroundColor = UIColor.greenColor()
        viewCards.setTitle("View Card", forState: UIControlState.Normal)
        viewCards.addTarget(self, action: "viewCardAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
 
        self.view.addSubview(addCard)
        self.view.addSubview(search)
        self.view.addSubview(viewCards)
        
        
        
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
                count += 1;
                
                print("card size:\(newAlbum.frame.width)")
                
                newAlbum.delegate = self;
                
            }
            
        //*********** scroll view size ***********//
    
//            scrollView.contentSize = CGSize(width: scrollViewWidth, height: 235 * albumImages.count)
        
        scrollView.contentSize = CGSize(width: Int(scrollView.frame.width), height: 235 * albumImages.count)
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





