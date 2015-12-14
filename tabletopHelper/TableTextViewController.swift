//
//  TableTextViewController.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/20/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//

import UIKit
import CoreData

class TableTextViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var dataSourceArray = [NSManagedObject]()
    @IBOutlet weak var addList: UIButton!
    @IBOutlet weak var navigationView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.backgroundColor = UIColor.clearColor()
        tableView.allowsSelection = false;
        //addCell("Name Me")
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name: UIKeyboardDidShowNotification, object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillBeHidden:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "CounterAttributes")
        
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
            addCell("Name Me")
        }
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
        let cellData = dataSourceArray[indexPath.row]
        if(UIScreen.mainScreen().bounds.size.height <= 568){
            let widthConstraint = NSLayoutConstraint(item: cell.namebutton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 80)
            cell.namebutton.addConstraint(widthConstraint)
            cell.namebutton.titleLabel?.font = UIFont(name: "Avenir-Black", size: 14)
            let widthTextConstraint = NSLayoutConstraint(item: cell.nameText, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 80)
            cell.nameText.addConstraint(widthTextConstraint)
        }
        cell.namebutton.setTitle(cellData.valueForKey("counterName") as? String, forState: UIControlState.Normal)
        cell.numButton.setTitle(cellData.valueForKey("counterNum") as? String, forState: UIControlState.Normal)
        cell.nameok.tag = indexPath.row
        cell.nameok.addTarget(self, action: "nameok:", forControlEvents: .TouchUpInside)
        cell.numok.tag = indexPath.row
        cell.numok.addTarget(self, action: "numok:", forControlEvents: .TouchUpInside)
        cell.plusbutton.tag = indexPath.row
        cell.plusbutton.addTarget(self, action: "plusbutton:", forControlEvents: .TouchUpInside)
        cell.minusbutton.tag = indexPath.row
        cell.minusbutton.addTarget(self, action: "minusbutton:", forControlEvents: .TouchUpInside)
        
        return cell
    }
    
    //add a cell to the table view
    @IBAction func tableEntriesUp(sender: AnyObject) {
        //restricting the amount of cells that can be entered until I can solve the scrolling tableview issue
        if(dataSourceArray.count < 5 && UIScreen.mainScreen().bounds.size.height <= 568 || dataSourceArray.count < 7 && UIScreen.mainScreen().bounds.size.height > 568){
            addCell("Name Me")
            tableView.beginUpdates()
            tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: dataSourceArray.count-1, inSection: 0)], withRowAnimation: .Automatic)
            tableView.endUpdates()
        }
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
    
    func addCell(name:String){
        //add element to dataArray(used for cell count)

            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let entity = NSEntityDescription.entityForName("CounterAttributes", inManagedObjectContext: managedContext)
            let counterAtts = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
            counterAtts.setValue(name, forKey: "counterName")
            counterAtts.setValue("20", forKey: "counterNum")
            do{
                try managedContext.save()
                dataSourceArray.append(counterAtts)
            }catch let error as NSError{
                print("Could not save \(error), \(error.userInfo)")
            }

    }
    
    func nameok(sender: AnyObject) {
        let indexPath = NSIndexPath(forRow: sender.tag, inSection: 0)
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! MyTableViewCell
        updateName(cell.namebutton.currentTitle!, row: sender.tag)
        //FIXTHIS: http://stackoverflow.com/questions/32931731/ios-swift-update-uitableview-custom-cell-label-outside-of-tableview-cellforrow
    }
    
    func numok(sender: AnyObject){
        let indexPath = NSIndexPath(forRow: sender.tag, inSection: 0)
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! MyTableViewCell
        updateNum(cell.numButton.currentTitle!, row: sender.tag)
    }
    
    func plusbutton(sender: AnyObject){
        let indexPath = NSIndexPath(forRow: sender.tag, inSection: 0)
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! MyTableViewCell
        updateNum(cell.numButton.currentTitle!, row: sender.tag)
    }
    
    func minusbutton(sender: AnyObject){
        let indexPath = NSIndexPath(forRow: sender.tag, inSection: 0)
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! MyTableViewCell
        updateNum(cell.numButton.currentTitle!, row: sender.tag)
    }
    
    func updateName(name: String, row: Int){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        do {
            dataSourceArray[row].setValue(name, forKey: "counterName")
            try managedContext.save()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func updateNum(numString: String, row: Int){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        do {
            dataSourceArray[row].setValue(numString, forKey: "counterNum")
            try managedContext.save()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
//    func keyboardWasShown(notification: NSNotification){
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue(){
//            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
//            let offset = contentInsets.bottom - 60.0
//            let cgoffset = CGPoint(x: 0, y: offset)
//            tableView.contentOffset = cgoffset
//        }
//    }
//    
//    func keyboardWillBeHidden(notification: NSNotification){
//            let cgoffset = CGPoint(x: 0, y: 0)
//            tableView.contentOffset = cgoffset
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
