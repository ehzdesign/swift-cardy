//
//  tabBarController.swift
//  cardy
//
//  Created by Erick Hernandez on 2016-04-21.
//  Copyright © 2016 Erick Hernandez. All rights reserved.
//

import UIKit

class tabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = UIColor(hue: 0.6111, saturation: 0.42, brightness: 0.25, alpha: 1.0) /* #262f42 */
        
        
        
        self.tabBar.tintColor = UIColor.whiteColor()
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSFontAttributeName:UIFont(name: "Futura", size: 10)!]
        appearance.setTitleTextAttributes(attributes, forState: .Normal)
        
    }
    
}
