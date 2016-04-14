//
//  Card.swift
//  cardy
//
//  Created by Abbigail Abas on 2016-04-14.
//  Copyright © 2016 Erick Hernandez. All rights reserved.
//

import UIKit

protocol CardDelegate:class {
    func testAnimation(sender:Card)
}


class Card: UIView {
    
    var delegate:CardDelegate?

    let backgroundImage:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    let count:Double = 0
    func setup(backgroundImageName:String) {
        backgroundImage.frame.size = self.frame.size
        backgroundImage.frame.size.height = self.frame.height; //*1.5
        backgroundImage.contentMode = .ScaleAspectFill
        backgroundImage.image = UIImage(named: backgroundImageName)
        //backgroundImage.frame.origin = CGPoint(x: -80, y: -220)
        backgroundImage.alpha = 0
        
        
        self.addSubview(backgroundImage)
        self.clipsToBounds = true
    }

}
