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
        backgroundImage.layer.shadowColor = UIColor.blackColor().CGColor
        backgroundImage.layer.shadowOffset = CGSizeZero
        backgroundImage.layer.shadowOpacity = 1
        backgroundImage.layer.shadowRadius = 50
        
        
        
        albumImageName = backgroundImageName
        
        UIView.animateWithDuration(1.3, delay: self.count * 0.4, options: .CurveEaseInOut, animations: {
            self.backgroundImage.frame.origin = CGPoint(x: 0, y: 0)
            self.backgroundImage.alpha = 1
            },
            completion: {(value: Bool) in
                
                self.delegate?.animationDidComplete(self)
        })
        
        self.addSubview(backgroundImage)
        self.clipsToBounds = true

}
}