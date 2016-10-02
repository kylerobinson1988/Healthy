//
//  Alerts.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/14/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class Alert: NSObject {
    
    class func Warning(delegate: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        delegate.presentViewController(alert, animated: true, completion: nil)
        
    }
    
}
