//
//  DistanceViewController.swift
//  LocationSample
//
//  Created by Shoeb Amin on 9/6/16.
//  Copyright © 2016 SiliconOrchard. All rights reserved.
//

import UIKit
import SwiftLocation
import CoreLocation

class DistanceViewController: UIViewController {

    @IBOutlet var distanceLabel: UILabel!
    var firstLocation:CLLocation?
    var totalDistance:Double = 0.00
    var distanceToAlert:Double = 0.00
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Location.getLocation(withAccuracy: .Block, frequency: .Continuous, onSuccess: { foundLocation in
            if self.firstLocation == nil {
                self.firstLocation = foundLocation
                return
            }
            self.totalDistance += foundLocation.distanceFromLocation(self.firstLocation!)
            self.distanceToAlert += foundLocation.distanceFromLocation(self.firstLocation!)
            dispatch_async(dispatch_get_main_queue(), {
                self.distanceLabel.text = "distance : \(self.totalDistance)"
            })
            if self.distanceToAlert > 50 {
                self.distanceToAlert = 0.00
                Utils.sharedInstance.showAlert("Attention", message: "Disctance Travelled: \(self.totalDistance)")
            }
            print( "distance : \(self.totalDistance)")
            self.firstLocation = foundLocation
            }) { (lastValidLocation, LocationError) in
                
        }
        // Do any additional setup after loading the view.
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
