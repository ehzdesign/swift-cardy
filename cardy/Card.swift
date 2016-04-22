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
}


class Card: UIView {
    
    var delegate:CardDelegate?
    
    
    var backgroundImage:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    var albumImageName = ""
    
    var cardNameLabel = UILabel(frame: CGRectMake(0, 0, 300, 40))
    
    var cardPrice = UILabel(frame: CGRectMake(0, 0, 100, 30))
    
    var cardNumberLabel = UILabel(frame:CGRectMake(0,0,300,40))
    
    var count:Double = 0
    
//    , cardNumberValue:String
    func setup(backgroundImageName:String, textLabelValue:String, amountLabelValue:String, cardNumberLabelValue:String){
        
        //*** main styles ***//
        backgroundImage.frame.size = self.frame.size
        backgroundImage.frame.size.height = self.frame.size.height// * 1.5
        backgroundImage.contentMode = .ScaleAspectFill
        backgroundImage.image = UIImage(named: backgroundImageName)
        backgroundImage.frame.origin = CGPoint(x: 0, y:0)
        backgroundImage.alpha = 1
        
        backgroundImage.frame.origin.x = (self.bounds.size.width - backgroundImage.frame.size.width) / 2.0
        
        //*** corners ***//
        backgroundImage.layer.cornerRadius = 10
        backgroundImage.layer.masksToBounds = true
        
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
        
//               self.layer.shouldRasterize = true
        
        
        
        cardNameLabel.frame.origin = CGPoint(x: 15, y: 20)
        cardNameLabel.textAlignment = NSTextAlignment.Left
        
        //set value of cardnameLabe and make lowercase
        cardNameLabel.text = textLabelValue.lowercaseString
//        cardNameLabel.backgroundColor = UIColor.blueColor()
        cardNameLabel.font = UIFont(name: "Futura", size: 30)
    
        cardPrice.frame.origin = CGPoint(x: 200, y: self.frame.height - self.frame.height/2 - 15)
        cardPrice.textAlignment = NSTextAlignment.Right
        cardPrice.text = "$" + amountLabelValue
//        cardPrice.backgroundColor = UIColor.orangeColor()
        cardPrice.font = UIFont(name: "Futura", size: 25)
        
        
         cardNumberLabel.frame.origin = CGPoint(x: 10 , y: self.frame.height - 50)
//        cardNumberLabel.backgroundColor = UIColor.orangeColor()
        cardNumberLabel.text = cardNumberLabelValue
        
       
        
        albumImageName = backgroundImageName
        
        UIView.animateWithDuration(1.3, delay: self.count * 0.4, options: .CurveEaseInOut, animations: {
            self.backgroundImage.frame.origin = CGPoint(x: 0, y: 0)
            print("animation woorked!")
            },
            completion: {(value: Bool) in
                
                self.delegate?.animationDidComplete(self)
        })
        
        self.addSubview(backgroundImage)
        self.clipsToBounds = true
        self.backgroundImage.addSubview(cardNameLabel)
        self.backgroundImage.addSubview(cardPrice)
        self.backgroundImage.addSubview(cardNumberLabel)
        
}
    
}