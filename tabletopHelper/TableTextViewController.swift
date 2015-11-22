//
//  TableTextViewController.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/20/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//

import UIKit

class TableTextViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var newString = "item"
    var entryCounter = 1
    @IBOutlet weak var tableView: UITableView!
    var dataSourceArray = ["item 1"]
    @IBOutlet weak var addList: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.backgroundColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell")! as! MyTableViewCell
        if(indexPath.row % 2 == 0){

            cell.backgroundColor = UIColor.init(red: 206/255, green: 147/255, blue: 216/255, alpha: 1.0)
        } else {
        
            cell.backgroundColor = UIColor.init(red: 186/255, green: 104/255, blue: 200/255, alpha: 1.0)
        }
        cell.plusbutton.tag = indexPath.row
        cell.numButton.setTitle("20", forState: UIControlState.Normal)
        return cell
    }
    
    @IBAction func tableEntriesUp(sender: AnyObject) {
        entryCounter++
        newString = "item" + "\(entryCounter)"

        dataSourceArray.append(newString)
        
        tableView.beginUpdates()
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: dataSourceArray.count-1, inSection: 0)], withRowAnimation: .Automatic)
        tableView.endUpdates()
    }
    
//    @IBAction func emptyfunc(){
//        print("this is fucked")
//        //let indexPath = self.tableView.indexPathForSelectedRow!
//        //self.cell.numButton.setTitle("lolnah", forState: UIControlState.Normal)
//        
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
