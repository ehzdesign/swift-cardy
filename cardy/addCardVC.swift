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
    
    //label for amount on card
    @IBOutlet weak var amountLabel: UILabel!
   
    //cardNumber Label
    @IBOutlet weak var cardNumberLabel: UILabel!

   
    //company name field
    @IBOutlet weak var companyNameField: UITextField!

    //amountField
    @IBOutlet weak var amountField: UITextField!
//    card number field
    @IBOutlet weak var cardNumberField: UITextField!
    
    //this might link to firebase database were hoping
    var ref = Firebase(url: "https://vivid-torch-2205.firebaseio.com/")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //change input placeholder text color
        UILabel.appearanceWhenContainedInInstancesOfClasses([UITextField.self]).textColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1.0) /* #e5e5e5 */

        
       self.companyNameField.backgroundColor = UIColor.clearColor()
        self.companyNameField.layer.cornerRadius = 8.0
        self.companyNameField.layer.masksToBounds = true
        
         self.companyNameField.layer.borderWidth = 1
       self.companyNameField.layer.borderColor = UIColor.whiteColor().CGColor
        


        
    }

    //live change amount on card
    @IBAction func amountLabelUpdate(sender: UITextField) {
        
        if (sender.text!.isEmpty){
            amountLabel.text = "$0"
            
        }else{
            amountLabel.text = "$" + (sender.text)!
        }
        
    }
    
    //live change companyName on card
    @IBAction func companyNameLabel(sender: UITextField) {
        
        if (sender.text!.isEmpty){
            companyLabel.text = "company name"
          
        }else{
           companyLabel.text = (sender.text)
        }
        
    }
    
    
    @IBAction func cardNumberUpdate(sender: UITextField) {
        
        if (sender.text!.isEmpty){
            cardNumberLabel.text = "000000000000"
           
        }else{
            cardNumberLabel.text = (sender.text)
        }
        
    }
    
    
    //this function will hopefully add content to new Card Dictionary
    @IBAction func saveCardAction(sender: AnyObject) {
     //get text from compnay name field and save to new Card dictionary
        
        let usersCardRef = ref.childByAppendingPath(String("usersCards"))
    
        
        var newCard = [String: String]()
    
//        let cardName =  companyNameField.text! + "Card"
        newCard["companyName"] = companyNameField.text
        newCard["amount"] = amountField.text
        newCard["cardNumber"] = cardNumberField.text
        
        let cardNameRef = usersCardRef.childByAutoId()
        cardNameRef.setValue(newCard)
        
        
        
     
    }
    
    func addCardsToFirebase(){
        
      
       

    }
}
