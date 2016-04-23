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
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
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
        amountLabel.text = cardDataAmount
        //set label for card number
        cardNumberLabel.text = cardDataCardNumber
        
        //set background color to card
        cardView.backgroundColor = cardBGColor
        
    }
    
    @IBAction func backToAllCardsAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
