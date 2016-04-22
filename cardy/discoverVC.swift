//
//  discoverVC.swift
//  cardy
//
//  Created by Erick Hernandez on 2016-04-21.
//  Copyright © 2016 Erick Hernandez. All rights reserved.
//


import UIKit
import Firebase

class discoverVC: UIViewController {
    
    @IBOutlet weak var companyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Firebase(url:"https://vivid-torch-2205.firebaseio.com/usersCards")
        // Attach a closure to read the data at our posts reference
        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            print(snapshot.value.objectForKey("amount"))
            print(snapshot.value.objectForKey("cardNumber"))
            print(snapshot.value.objectForKey("companyName"))
            
//            let enumerator = snapshot.children
//            while let rest = enumerator.nextObject() as? FDataSnapshot {
//                println(rest.value)
//            }
//            
            //display data on label in view
            let companyName = snapshot.value.objectForKey("companyName") as? String
            self.companyLabel.text = companyName

            
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        
    }
    
}
