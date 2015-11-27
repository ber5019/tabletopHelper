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
        tableView.allowsSelection = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //define number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //define amount of rows here
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    
    //define cell properties here
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
    
    //add a cell to the table view
    @IBAction func tableEntriesUp(sender: AnyObject) {
        //first add item to array
        entryCounter++
        newString = "item" + "\(entryCounter)"
        dataSourceArray.append(newString)
        //insert row
        tableView.beginUpdates()
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: dataSourceArray.count-1, inSection: 0)], withRowAnimation: .Automatic)
        tableView.endUpdates()
    }
    
    //swipe to show delete
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    //delete row implementation
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            dataSourceArray.removeAtIndex(indexPath.row)
            entryCounter--
            //delete row
            tableView.beginUpdates()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            tableView.endUpdates()
        }
    }
    //end of swipe to delete
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
