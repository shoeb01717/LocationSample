//
//  RecordViewController.swift
//  LocationSample
//
//  Created by Shoeb Amin on 9/6/16.
//  Copyright © 2016 SiliconOrchard. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    var recordArray:[[String:AnyObject]]?
    
    @IBOutlet var recordTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        self.recordArray = defaults.objectForKey("SavedArray") as? [[String:AnyObject]] ?? [[String:AnyObject]]()
    
        self.recordTableView.reloadData()
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


extension RecordViewController : UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let record = self.recordArray {
            return record.count
        }
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RecordTableViewCell", forIndexPath: indexPath) as! RecordTableViewCell
        let dictionaryData = self.recordArray![indexPath.row]
        cell.titleLabel.text = dictionaryData["distance"] as? String
        
        let recordDate = dictionaryData["date"] as! NSDate
        cell.subtitleLabel.text = recordDate.dateStringWithFormat("yyyy-MM-dd hh:mm:ss")
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    
    
}

extension RecordViewController : UITableViewDelegate {
    
}


