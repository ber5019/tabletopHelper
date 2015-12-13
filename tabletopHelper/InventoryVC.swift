//
//  inventoryVC.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/29/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//

import UIKit
import CoreData

class InventoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    var dataSourceArray = [NSManagedObject]()
    //var dataSourceArray = ["item 1"]
    @IBOutlet weak var addList: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.backgroundColor = UIColor.clearColor()
        tableView.allowsSelection = false;
        self.view.backgroundColor = UIColor.clearColor()
        resignFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "InventoryAttributes")
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            dataSourceArray = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
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
        if(dataSourceArray.count == 0){
            addCell("Item Name")
        }
        return dataSourceArray.count
    }
    
    
    //define cell properties here
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("InventoryCell")! as! InventoryCell
        if(indexPath.row % 2 == 0){
            
            cell.backgroundColor = UIColor.init(red: 206/255, green: 147/255, blue: 216/255, alpha: 1.0)
        } else {
            
            cell.backgroundColor = UIColor.init(red: 186/255, green: 104/255, blue: 200/255, alpha: 1.0)
        }
        let cellData = dataSourceArray[indexPath.row]
        cell.nameButton.setTitle(cellData.valueForKey("itemName") as? String, forState: UIControlState.Normal)
        cell.numButton.setTitle(cellData.valueForKey("itemCount") as? String, forState: UIControlState.Normal)
        cell.nameButton.tag = indexPath.row
        cell.nameButton.addTarget(self, action: "changeName:", forControlEvents: .TouchUpInside)
        cell.numButton.tag = indexPath.row
        cell.numButton.addTarget(self, action: "changeValue:", forControlEvents: .TouchUpInside)
        return cell
    }
    
    //add a cell to the table view
    @IBAction func tableEntriesUp(sender: AnyObject) {
        //first add item to array
        addCell("Item Name")
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
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            managedContext.deleteObject(dataSourceArray[indexPath.row] as NSManagedObject)
            dataSourceArray.removeAtIndex(indexPath.row)
            do{
                try managedContext.save()
            }catch let error as NSError{
                print("Could not save \(error), \(error.userInfo)")
            }
            //delete row
            tableView.beginUpdates()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            tableView.endUpdates()
        }
        self.tableView.reloadData()
    }
    //end of swipe to delete
    
    @IBAction func changeName(sender: UIButton){
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Add Item", message: "What item are you adding to your inventory?", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        let okAction: UIAlertAction = UIAlertAction(title: "Okay", style: .Default) { action -> Void in
            //Do some other stuff
            let textf = actionSheetController.textFields![0] as UITextField
            //print(textf.text)
            sender.setTitle(textf.text, forState: .Normal)
            //update core data name
            self.updateName(textf.text!, row: sender.tag)
        }
        actionSheetController.addAction(okAction)
        //Add a text field
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            //TextField configuration
            textField.textColor = UIColor.blackColor()
            
        }
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    @IBAction func changeValue(sender: UIButton){
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Change Count", message: "How many do you have of this item?", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        let okAction: UIAlertAction = UIAlertAction(title: "Okay", style: .Default) { action -> Void in
            //Do some other stuff
            let textf = actionSheetController.textFields![0] as UITextField
            //print(textf.text)
            sender.setTitle(textf.text, forState: .Normal)
            //update core data name
            self.updateNum(textf.text!, row: sender.tag)
            
        }
        actionSheetController.addAction(okAction)
        //Add a text field
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            //TextField configuration
            textField.keyboardType = .NumberPad
            textField.textColor = UIColor.blackColor()
        }
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
        

    }
    func addCell(name:String){
        //add element to dataArray(used for cell count)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("InventoryAttributes", inManagedObjectContext: managedContext)
        let counterAtts = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        counterAtts.setValue(name, forKey: "itemName")
        counterAtts.setValue("??", forKey: "itemCount")
        do{
            try managedContext.save()
            dataSourceArray.append(counterAtts)
        }catch let error as NSError{
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func updateName(name: String, row: Int){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        do {
            dataSourceArray[row].setValue(name, forKey: "itemName")
            try managedContext.save()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func updateNum(numString: String, row: Int){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        do {
            dataSourceArray[row].setValue(numString, forKey: "itemCount")
            try managedContext.save()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
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