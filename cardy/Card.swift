//
//  Card.swift
//  cardy
//
//  Created by Abbigail Abas on 2016-04-14.
//  Copyright © 2016 Erick Hernandez. All rights reserved.
//

import UIKit

protocol CardDelegate:class {
    func animationDidComplete(sender:Card)
    func tappedCard(sender:Card)
}


class Card: UIView {
    
    var delegate:CardDelegate?
    
    
    var backgroundImage:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    var albumImageName = ""
    
    var cardNameLabel = UILabel(frame: CGRectMake(0, 0, 300, 40))
    
    var cardPrice = UILabel(frame: CGRectMake(0, 0, 150, 30))
    
    var cardNumberLabel = UILabel(frame:CGRectMake(0,0,300,40))
    
    var cardKey:String = ""
    
    var count:Double = 0
    
    
    let colorsArray = [
        UIColor(red: 90/255.0, green: 187/255.0, blue: 181/255.0, alpha: 1.0), //teal color
       UIColor(hue: 0.1, saturation: 0.51, brightness: 0.99, alpha: 1.0),/* #fecb7a  yellow color*/
        UIColor(hue: 0, saturation: 0.64, brightness: 0.98, alpha: 1.0), /* #fc595b *red color*/
        UIColor(red: 77/255.0, green: 75/255.0, blue: 82/255.0, alpha: 1.0), //dark color
       UIColor(hue: 0.775, saturation: 0.62, brightness: 0.98, alpha: 1.0),/* #c55efc purple color */
        UIColor(hue: 0.05, saturation: 0.51, brightness: 0.99, alpha: 1.0), /* #fca27b orange */
        UIColor(hue: 0.4083, saturation: 0.51, brightness: 0.94, alpha: 1.0), /* #75efac green color*/
        UIColor(hue: 0.9111, saturation: 0.51, brightness: 1, alpha: 1.0), /* #ff7cc2pinkcolor */
        
    ]
    
//    , cardNumberValue:String
    func setup(backgroundImageName:String, textLabelValue:String, amountLabelValue:String, cardNumberLabelValue:String, cardKey:String){
        
        //*** main styles ***//
        backgroundImage.frame.size = self.frame.size
        backgroundImage.frame.size.height = self.frame.size.height// * 1.5
        backgroundImage.contentMode = .ScaleAspectFill
        backgroundImage.image = UIImage(named: backgroundImageName)
        backgroundImage.frame.origin = CGPoint(x: 0, y:0)
        backgroundImage.alpha = 1
        
        backgroundImage.frame.origin.x = (self.bounds.size.width - backgroundImage.frame.size.width) / 2.0
        
        //*** corners ***//
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        //*** borders ***//
//        backgroundImage.layer.borderWidth = 3;
//        backgroundImage.layer.borderColor = UIColor .blackColor().CGColor
        
        //*** shadows ***//
//        backgroundImage.layer.shadowColor = UIColor.blackColor().CGColor
//        backgroundImage.layer.shadowOffset = CGSizeZero
//        backgroundImage.layer.shadowOpacity = 1
//        backgroundImage.layer.shadowRadius = 50
        
        //*** shadows - ericks code ***//
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 8)
        self.layer.shadowRadius = 10
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).CGPath
        
//      self.layer.shouldRasterize = true
        
        //this is this key for the card
        self.cardKey = cardKey
        
        
        
        cardNameLabel.frame.origin = CGPoint(x: 15, y: 20)
        cardNameLabel.textAlignment = NSTextAlignment.Left
        
        
        //set value of cardnameLabe and make lowercase
        cardNameLabel.text = textLabelValue.lowercaseString
//        cardNameLabel.backgroundColor = UIColor.blueColor()
        cardNameLabel.font = UIFont(name: "Futura", size: 25)
        cardNameLabel.textColor = UIColor.whiteColor()
    
        cardPrice.frame.origin = CGPoint(x: 150, y: self.frame.height - self.frame.height/2 - 15)
        cardPrice.textAlignment = NSTextAlignment.Right
        cardPrice.text = "$" + amountLabelValue
//        cardPrice.backgroundColor = UIColor.orangeColor()
        cardPrice.font = UIFont(name: "Futura", size: 30)
        cardPrice.textColor = UIColor.whiteColor()
        
        
         cardNumberLabel.frame.origin = CGPoint(x: 10 , y: self.frame.height - 50)
//        cardNumberLabel.backgroundColor = UIColor.orangeColor()
        cardNumberLabel.text = cardNumberLabelValue
        cardNumberLabel.font = UIFont(name: "Futura", size: 20)
        cardNumberLabel.textColor = UIColor.whiteColor()
        
       
        
        albumImageName = backgroundImageName
        
        UIView.animateWithDuration(1.3, delay: self.count * 0.4, options: .CurveEaseInOut, animations: {
            self.backgroundImage.frame.origin = CGPoint(x: 0, y: 0)
            print("animation woorked!")
            },
            completion: {(value: Bool) in
                
                self.delegate?.animationDidComplete(self)
        })
        
        
        //add labels to view
//        self.clipsToBounds = true
        self.addSubview(cardNameLabel)
        self.addSubview(cardPrice)
        self.addSubview(cardNumberLabel)
        
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Card.handleTap(_:)))
        
        self.addGestureRecognizer(gestureRecognizer)
        
       
}
    
    func handleTap(gestureRecognizer: UIGestureRecognizer) {
        self.delegate?.tappedCard(self)
    }
    
    func setBGColor(number:Int){
        
//        let randomIndex = Int(arc4random_uniform(UInt32(colorsArray.count)))
        
        self.backgroundColor = colorsArray[number%(colorsArray.count)]
        
        
        
    }
    
}