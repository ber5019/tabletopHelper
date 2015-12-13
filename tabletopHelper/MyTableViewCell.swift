//
//  MyTableViewCell.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/20/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//

import UIKit
import CoreData

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var plusbutton: UIButton!
    @IBOutlet weak var numButton: UIButton!
    @IBOutlet weak var minusbutton: UIButton!
    @IBOutlet weak var namebutton: UIButton!
    @IBOutlet weak var numText: UITextField!
    @IBOutlet weak var numok: UIButton!
    @IBOutlet weak var nameok: UIButton!
    @IBOutlet weak var nameText: UITextField!
    
    var dataSourceArray = [NSManagedObject]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func plusDown(sender: AnyObject) {
        let tempnum = Int(numButton.currentTitle!)! + 1
        numButton.setTitle("\(tempnum)", forState: UIControlState.Normal)
    }
    @IBAction func minusDown(sender: AnyObject) {
        let tempnum = Int(numButton.currentTitle!)! - 1
        numButton.setTitle("\(tempnum)", forState: UIControlState.Normal)
    }
    @IBAction func numButtonDown(sender: AnyObject) {
        plusbutton.enabled = false
        minusbutton.enabled = false
        numText.hidden = false
        numText.enabled = true
        numText.text = numButton.currentTitle
        numok.enabled = true
        numok.hidden = false
    }
    @IBAction func numokDown(sender: AnyObject) {
        plusbutton.enabled = true
        minusbutton.enabled = true
        numButton.setTitle(numText.text, forState: UIControlState.Normal)
        numText.hidden = true
        numText.enabled = false
        numok.enabled = false
        numok.hidden = true
        numText.resignFirstResponder()
    }
    @IBAction func nameDown(sender: AnyObject) {
        nameText.hidden = false
        nameText.enabled = true
        nameText.text = namebutton.currentTitle
        nameok.enabled = true
        nameok.hidden = false
    }
    @IBAction func nameokdown(sender: AnyObject) {
        namebutton.setTitle(nameText.text, forState: UIControlState.Normal)
        //saveName(namebutton.currentTitle!)
        nameText.hidden = true
        nameText.enabled = false
        nameok.enabled = false
        nameok.hidden = true
        nameText.resignFirstResponder()
    }
    
//    func saveName(name: String){
//        //1
//        let appDelegate =
//        UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        //2
//        let entity =  NSEntityDescription.entityForName("CounterAttributes",
//            inManagedObjectContext:managedContext)
//        
//        let counterAtts = NSManagedObject(entity: entity!,
//            insertIntoManagedObjectContext: managedContext)
//        
//        //3
//        counterAtts.setValue(name, forKey: "counterName")
//        
//        //4
//        do {
//            try managedContext.save()
//            //5
//            dataSourceArray.append(counterAtts)
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
//    }
}
