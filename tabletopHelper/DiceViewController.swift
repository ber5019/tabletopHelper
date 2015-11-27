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

    
    @IBOutlet weak var diceSubView: UIView!
    @IBOutlet weak var rollText: UILabel!
    @IBOutlet weak var concatRollText: UILabel!
    @IBOutlet weak var totalRollText: UILabel!
    //Maybe globals************************
    private var random1: Int?
    let alertController: UIAlertController = UIAlertController(title: "Coin Results", message: "The coin flipped a", preferredStyle: .Alert)
    //Create and add first option action
    let okAction: UIAlertAction = UIAlertAction(title: "Okay", style: .Default) { action -> Void in}
    //globals done*****************************
    
    //on load functions*********************
    override func viewDidLoad() {
        super.viewDidLoad()
        alertController.addAction(okAction)
        rollText.text = ""
        totalRollText.text = ""
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
        random1 = Int(arc4random_uniform(2))
        //print(random1)

        //generate alert***********************************************************
        //Create the AlertController
        
        if((random1) == 1){
            alertController.message = "The coin flipped a heads"
            
        }else{
            alertController.message = "The coin flipped a tails"
        }
        
        //Present the AlertController
        self.presentViewController(alertController, animated: true, completion: nil)
        //alert generated ***************************************************************
    }
    @IBAction func d4Down(sender: AnyObject) {
        generateRoll(4)
    }
    @IBAction func d6Down(sender: AnyObject) {
        generateRoll(6)
    }
    @IBAction func d8Down(sender: AnyObject) {
        generateRoll(8)
    }
    @IBAction func d10Down(sender: AnyObject) {
        generateRoll(10)
    }
    @IBAction func d12Down(sender: AnyObject) {
        generateRoll(12)

    }
    @IBAction func d20Down(sender: AnyObject) {
        generateRoll(20)
    }
    
    @IBAction func dAnyDown(sender: AnyObject) {                
        //print(random1)
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
            //print(textf.text)
            dieSize = Int(textf.text!)
            self.random1 = Int(arc4random_uniform(UInt32(dieSize)))
            randNum = self.random1! + 1 // this is the dice roll
            //print(randNum)
            //print(random1)
            self.rollText.text = "\(randNum)"
            self.addToConcatText("\(randNum)")
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
    @IBAction func clearDown(sender: AnyObject) {
        totalRollText.text = ""
        rollText.text = ""
        concatRollText.text = ""
        
    }
    //button actions done**********************************
    
    
    func addToConcatText(tString:String){
        if(concatRollText.text == ""){
            concatRollText.text = tString
            totalRollText.text = tString
        }else{
            var concatText: String
            var currentRoll: Int
            concatText = concatRollText.text!
            concatText += " + \(tString)"
            concatRollText.text = concatText
            
            currentRoll = Int(totalRollText.text!)!
            currentRoll += Int(tString)!
            totalRollText.text = "\(currentRoll)"
        }
    }
    
    func generateRoll(dSize:UInt32){
        let random1 = Int(arc4random_uniform(dSize))
        //print(random1)
        let roll = random1+1
        //print(roll)// this is the dice roll
        rollText.text = "\(roll)"
        addToConcatText("\(roll)")
    }

}
