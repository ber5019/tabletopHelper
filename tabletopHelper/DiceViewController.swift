//
//  DiceViewController.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/7/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//
//  TODO: FIGURE OUT HOW TO DISPLAY DICE ROLLS AND COIN FLIPS WITHOUT USING A POP-UP ALERT

import UIKit

class DiceViewController: UIViewController {

    
    //Maybe globals************************
    private var random1: Int?
    let alertController: UIAlertController = UIAlertController(title: "Coin Results", message: "The coin flipped a", preferredStyle: .Alert)
    //Create and add first option action
    let okAction: UIAlertAction = UIAlertAction(title: "Okay", style: .Default) { action -> Void in}
    //globals done*****************************
    
    //on load functions*********************
    override func viewDidLoad() {
        super.viewDidLoad()
        random1 = Int(arc4random())
        alertController.addAction(okAction)
        //print("Random Number: \(rand()%10)")
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //onload done****************************
    
    

    
    
//    //generate alert***********************************************************
//    //Create the AlertController
//    let actionSheetController: UIAlertController = UIAlertController(title: "Coin Results", message: "The coin flipped a", preferredStyle: .Alert)
//    
//    
//    //Create and add first option action
//    let takePictureAction: UIAlertAction = UIAlertAction(title: "Okay", style: .Default) { action -> Void in
//        //Code for launching the camera goes here
//    }
//    actionSheetController.addAction(takePictureAction)
//    
//    //Present the AlertController
//    self.presentViewController(actionSheetController, animated: true, completion: nil)
//    //alert generated ***************************************************************
    
    
    //button actions*********************************
    @IBAction func coinDown(sender: AnyObject) {
        random1 = Int(arc4random())
        print(random1)

        //generate alert***********************************************************
        //Create the AlertController
        
        if((random1!%2) == 1){
            alertController.message = "The coin flipped a heads"
            
        }else{
            alertController.message = "The coin flipped a tails"
        }
        
        //Present the AlertController
        self.presentViewController(alertController, animated: true, completion: nil)
        //alert generated ***************************************************************
    }
    @IBAction func d4Down(sender: AnyObject) {
        random1 = Int(arc4random())
        print(random1)
        print(random1!%4+1)// this is the dice roll
    }
    @IBAction func d6Down(sender: AnyObject) {
        random1 = Int(arc4random())
        print(random1)
        print(random1!%6+1) // this is the dice roll
    }
    @IBAction func d8Down(sender: AnyObject) {
        random1 = Int(arc4random())
        print(random1)
        print(random1!%8+1) // this is the dice roll
    }
    @IBAction func d10Down(sender: AnyObject) {
        random1 = Int(arc4random())
        print(random1)
        print(random1!%10+1) // this is the dice roll
    }
    @IBAction func d12Down(sender: AnyObject) {
        random1 = Int(arc4random())
        print(random1)
        print(random1!%12+1) //this is the dice roll

    }
    @IBAction func d20Down(sender: AnyObject) {
        random1 = Int(arc4random())
        print(random1)
        print(random1!%20+1)//this is the dice roll
    }
    @IBAction func dAnyDown(sender: AnyObject) {
        random1 = Int(arc4random())
        print(random1)
        var dieSize:Int!
        var randNum:Int!
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "???", message: "How many sides is the die you want to roll?", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        let okAction: UIAlertAction = UIAlertAction(title: "Okay", style: .Default) { action -> Void in
            //Do some other stuff
            let textf = actionSheetController.textFields![0] as UITextField
            print(textf.text)
            dieSize = Int(textf.text!)
            randNum = self.random1!%dieSize + 1 // this is the dice roll
            print(randNum)
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
        
        
        alertController.message = "Your die rolled \(randNum)"
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    //button actions done**********************************
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
