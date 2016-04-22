//
//  addCardVC.swift
//  cardy
//
//  Created by Erick Hernandez on 2016-04-21.
//  Copyright © 2016 Erick Hernandez. All rights reserved.
//


import UIKit
import Firebase


class addCardVC: UIViewController {
    
    //label for company name on card
    @IBOutlet weak var companyLabel: UILabel!
    
    var newCard = []
   
    
    //link to firebase database
    var ref = Firebase(url: "https://vivid-torch-2205.firebaseio.com/")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //watch company name input and adjust text on company label
        ref.observeEventType(.Value, withBlock: {
            snapshot in self.companyLabel.text = snapshot.value as? String
        })


        
    }

    @IBAction func companyNameLabel(sender: UITextField) {
        ref.setValue(sender.text)
    }
}
