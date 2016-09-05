//
//  CurrentLocationViewController.swift
//  LocationSample
//
//  Created by Shoeb Amin on 9/5/16.
//  Copyright © 2016 SiliconOrchard. All rights reserved.
//

import UIKit
import SwiftLocation
import MapKit

class CurrentLocationViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var addressLabel: UILabel!
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Location.getLocation(withAccuracy: .Block,frequency: .Continuous,onSuccess: { foundLocation in
            let region = MKCoordinateRegionMakeWithDistance(
                foundLocation.coordinate, 500, 500)
            
            self.mapView.setRegion(region, animated: true)
            
            
            self.annotation.coordinate = CLLocationCoordinate2D(latitude: foundLocation.coordinate.latitude, longitude: foundLocation.coordinate.longitude)
            
            
            Location.reverse(coordinates: foundLocation.coordinate, onSuccess: { foundPlacemark in
                // foundPlacemark is a CLPlacemark object
                if let formataddress = foundPlacemark.addressDictionary!["FormattedAddressLines"]{
                
                    if formataddress.count > 0 {
                        var addressString:String = ""
                        for item in formataddress as! [String] {
                            addressString = addressString.stringByAppendingString(item as String)
                            addressString = addressString.stringByAppendingString(",")
                        }
                        addressString = String(addressString.characters.dropLast())
                        self.addressLabel.text = addressString
                    }
                }
            }) { error in
            }
        }) { (lastValidLocation, error) in
            
        }
        self.mapView.addAnnotation(self.annotation)
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
