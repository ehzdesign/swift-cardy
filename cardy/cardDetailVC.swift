//
//  cardDetailVC.swift
//  cardy
//
//  Created by Erick Hernandez on 2016-04-23.
//  Copyright © 2016 Erick Hernandez. All rights reserved.
//

import UIKit
import Firebase

class cardDetailVC: UIViewController {
    

//    company label view
    @IBOutlet weak var companyNameLabel: UILabel!
    //amount label view
    @IBOutlet weak var amountLabel: UILabel!
    //card number label view
    @IBOutlet weak var cardNumberLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    var cardDataCompanyName:String!
    var cardDataAmount:String!
    var cardDataCardNumber:String!
    var cardBGColor:UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set label for company
        companyNameLabel.text = cardDataCompanyName
        //set label for amount
        amountLabel.text = "$" + cardDataAmount
        //set label for card number
        cardNumberLabel.text = cardDataCardNumber
        
        
        //set size of card view
        cardView.frame = CGRect(x: 0, y: 40, width: self.view.frame.width - 20, height: 200)
        
        //set background color to card
        cardView.backgroundColor = cardBGColor
        
        cardView.layer.cornerRadius = 10
        
        cardView.layer.shadowColor = UIColor.blackColor().CGColor
        cardView.layer.shadowOpacity = 0.4
        cardView.layer.shadowOffset = CGSize(width: -5, height: 10)
        cardView.layer.shadowRadius = 10
        
        cardView.layer.shadowPath = UIBezierPath(rect: cardView.bounds).CGPath
        
    }
    
    @IBAction func backToAllCardsAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
