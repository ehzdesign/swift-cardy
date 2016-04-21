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
    
    var cardNameLabel = UILabel(frame: CGRectMake(0, 0, 100, 20))
    
    var cardPrice = UILabel(frame: CGRectMake(0, 0, 50, 20))
    
    var count:Double = 0
    
    func setup(backgroundImageName:String){
        
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
        backgroundImage.layer.borderWidth = 3;
        backgroundImage.layer.borderColor = UIColor .blackColor().CGColor
        
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
        
        
        //*** name of card label ***//
        cardNameLabel.frame.origin = CGPoint(x: 15, y: 20)
        cardNameLabel.textAlignment = NSTextAlignment.Center
        cardNameLabel.text = "Test label"
        cardNameLabel.backgroundColor = UIColor.blueColor()
    
        //*** price of card label ***//
        cardPrice.frame.origin = CGPoint(x: 290, y: 20)
        cardPrice.textAlignment = NSTextAlignment.Center
        cardPrice.text = "$$$"
        cardPrice.backgroundColor = UIColor.orangeColor()
        
        albumImageName = backgroundImageName
        
        UIView.animateWithDuration(1.3, delay: self.count * 0.4, options: .CurveEaseInOut, animations: {
            self.backgroundImage.frame.origin = CGPoint(x: 0, y: 0)
            print("animation woorked!")
            },
            completion: {(value: Bool) in
                
                self.delegate?.animationDidComplete(self)
        })
        
        //*** adding image of card ***//
        self.addSubview(backgroundImage)
        
        //*** for corner radius ***//
        self.clipsToBounds = true
        
        //*** adding labels of card ***//
        self.backgroundImage.addSubview(cardNameLabel)
        self.backgroundImage.addSubview(cardPrice)
        
}
    
}