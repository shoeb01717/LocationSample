//
//  Utils.swift
//  LocationSample
//
//  Created by Shoeb Amin on 9/6/16.
//  Copyright © 2016 SiliconOrchard. All rights reserved.
//

import UIKit

class Utils: NSObject {
    static let sharedInstance = Utils()
    
    
    func showAlert(title:String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        }
        alertController.addAction(OKAction)
        
        if var topController = UIApplication.sharedApplication().keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.presentViewController(alertController, animated: true) {
            }
        }
        
        
    }

}
