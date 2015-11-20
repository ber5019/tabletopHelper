//
//  CounterViewController.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/18/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {

    var counter = 1
    @IBOutlet weak var numberRowOne: UILabel!
    @IBOutlet weak var numberRowTwo: UILabel!
    @IBOutlet weak var numberRowThree: UILabel!
    @IBOutlet weak var numberRowFour: UILabel!
    @IBOutlet weak var numberRowFive: UILabel!
    @IBOutlet weak var nameRowOne: UIButton!
    @IBOutlet weak var nameRowTwo: UIButton!
    @IBOutlet weak var nameRowThree: UIButton!
    @IBOutlet weak var nameRowFour: UIButton!
    @IBOutlet weak var nameRowFive: UIButton!
    @IBOutlet weak var minusButtonOne: UIButton!
    @IBOutlet weak var minusButtonTwo: UIButton!
    @IBOutlet weak var minusButtonThree: UIButton!
    @IBOutlet weak var minusButtonFour: UIButton!
    @IBOutlet weak var minusButtonFive: UIButton!
    @IBOutlet weak var plusButtonOne: UIButton!
    @IBOutlet weak var plusButtonTwo: UIButton!
    @IBOutlet weak var plusButtonThree: UIButton!
    @IBOutlet weak var plusButtonFour: UIButton!
    @IBOutlet weak var plusButtonFive: UIButton!
    @IBOutlet weak var addCounterButton: UIButton!
    @IBOutlet weak var numberRowOneButton: UIButton!
    @IBOutlet weak var numberRowTwoButton: UIButton!
    @IBOutlet weak var numberRowThreeButton: UIButton!
    @IBOutlet weak var numberRowFourButton: UIButton!
    @IBOutlet weak var numberRowFiveButton: UIButton!
    @IBOutlet weak var okButtonOne: UIButton!
    @IBOutlet weak var numRowOneText: UITextField!
    @IBOutlet weak var okButtonTwo: UIButton!
    @IBOutlet weak var numRowTwoText: UITextField!
    @IBOutlet weak var okButtonThree: UIButton!
    @IBOutlet weak var numRowThreeText: UITextField!
    @IBOutlet weak var okButtonFour: UIButton!
    @IBOutlet weak var numRowFourText: UITextField!
    @IBOutlet weak var okButtonFive: UIButton!
    @IBOutlet weak var numRowFiveText: UITextField!
    @IBOutlet weak var okNameButtonOne: UIButton!
    @IBOutlet weak var okNameButtonTwo: UIButton!
    @IBOutlet weak var okNameButtonThree: UIButton!
    @IBOutlet weak var okNameButtonFour: UIButton!
    @IBOutlet weak var okNameButtonFive: UIButton!
    @IBOutlet weak var nameTextOne: UITextField!
    @IBOutlet weak var nameTextTwo: UITextField!
    @IBOutlet weak var nameTextThree: UITextField!
    @IBOutlet weak var nameTextFour: UITextField!
    @IBOutlet weak var nameTextFive: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //look for single or multiple taps
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //call this function on tap
    func dismissKeyboard(){
        //causes the view or one of it's embedded text fields to resign the first responder status
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //adding functions
    @IBAction func rowOnePlus(sender: AnyObject) {
        let tempNum = Int(numberRowOneButton.currentTitle!)! + 1
        numberRowOneButton.setTitle("\(tempNum)", forState: UIControlState.Normal)
    }
    @IBAction func rowTwoPlus(sender: AnyObject) {
        let tempNum = Int(numberRowTwoButton.currentTitle!)! + 1
        numberRowTwoButton.setTitle("\(tempNum)", forState: UIControlState.Normal)
    }
    @IBAction func rowThreePlus(sender: AnyObject) {
        let tempNum = Int(numberRowThreeButton.currentTitle!)! + 1
        numberRowThreeButton.setTitle("\(tempNum)", forState: UIControlState.Normal)
    }
    @IBAction func rowFourPlus(sender: AnyObject) {
        let tempNum = Int(numberRowFourButton.currentTitle!)! + 1
        numberRowFourButton.setTitle("\(tempNum)", forState: UIControlState.Normal)
    }
    @IBAction func rowFivePlus(sender: AnyObject) {
        let tempNum = Int(numberRowFiveButton.currentTitle!)! + 1
        numberRowFiveButton.setTitle("\(tempNum)", forState: UIControlState.Normal)
    }
    
    
    //subtracting functions
    @IBAction func rowOneMinus(sender: AnyObject) {
        let tempNum = Int(numberRowOneButton.currentTitle!)! - 1
        numberRowOneButton.setTitle("\(tempNum)", forState: UIControlState.Normal)
    }
    @IBAction func rowTwoMinus(sender: AnyObject) {
        let tempNum = Int(numberRowTwoButton.currentTitle!)! - 1
        numberRowTwoButton.setTitle("\(tempNum)", forState: UIControlState.Normal)
    }
    @IBAction func rowThreeMinus(sender: AnyObject) {
        let tempNum = Int(numberRowThreeButton.currentTitle!)! - 1
        numberRowThreeButton.setTitle("\(tempNum)", forState: UIControlState.Normal)
    }
    @IBAction func rowFourMinus(sender: AnyObject) {
        let tempNum = Int(numberRowFourButton.currentTitle!)! - 1
        numberRowFourButton.setTitle("\(tempNum)", forState: UIControlState.Normal)
    }
    @IBAction func rowFiveMinus(sender: AnyObject) {
        let tempNum = Int(numberRowFiveButton.currentTitle!)! - 1
        numberRowFiveButton.setTitle("\(tempNum)", forState: UIControlState.Normal)
    }

    
    //show counter function
    @IBAction func addCounter(sender: AnyObject) {
        switch counter{
        case 1:
            //show first row
            plusButtonOne.enabled = true
            plusButtonOne.hidden = false
            minusButtonOne.enabled = true
            minusButtonOne.hidden = false
            numberRowOneButton.hidden = false
            numberRowOneButton.enabled = true
            nameRowOne.hidden = false
            nameRowOne.enabled = true
            counter = counter + 1
            break
        case 2:
            //show second row
            plusButtonTwo.enabled = true
            plusButtonTwo.hidden = false
            minusButtonTwo.enabled = true
            minusButtonTwo.hidden = false
            numberRowTwoButton.hidden = false
            numberRowTwoButton.enabled = true
            nameRowTwo.hidden = false
            nameRowTwo.enabled = true
            counter = counter + 1
            break
        case 3:
            //show third row
            plusButtonThree.enabled = true
            plusButtonThree.hidden = false
            minusButtonThree.enabled = true
            minusButtonThree.hidden = false
            numberRowThreeButton.hidden = false
            numberRowThreeButton.enabled = true
            nameRowThree.hidden = false
            nameRowThree.enabled = true
            counter = counter + 1
            break
        case 4:
            //show fouth row
            plusButtonFour.enabled = true
            plusButtonFour.hidden = false
            minusButtonFour.enabled = true
            minusButtonFour.hidden = false
            numberRowFourButton.hidden = false
            numberRowFourButton.enabled = true
            nameRowFour.hidden = false
            nameRowFour.enabled = true
            counter = counter + 1
            break
        case 5:
            //show fifth row
            plusButtonFive.enabled = true
            plusButtonFive.hidden = false
            minusButtonFive.enabled = true
            minusButtonFive.hidden = false
            numberRowFiveButton.hidden = false
            numberRowFiveButton.enabled = true
            nameRowFive.hidden = false
            nameRowFive.enabled = true
            counter = counter + 1
            break
        default:
            //disable button
            addCounterButton.enabled = false
            break
            
        }
    }
    @IBAction func numOneDown(sender: AnyObject) {
        okButtonOne.hidden = false
        okButtonOne.enabled = true
        numRowOneText.hidden = false
        numRowOneText.text = numberRowOneButton.currentTitle
    }
    @IBAction func okButtonOneDown(sender: AnyObject) {
        okButtonOne.hidden = true
        okButtonOne.enabled = false
        numberRowOneButton.setTitle(numRowOneText.text, forState: UIControlState.Normal)
        numRowOneText.hidden = true
    }
    @IBAction func numTwoDown(sender: AnyObject) {
        okButtonTwo.hidden = false
        okButtonTwo.enabled = true
        numRowTwoText.hidden = false
        numRowTwoText.text = numberRowTwoButton.currentTitle
    }
    @IBAction func okButtonTwoDown(sender: AnyObject) {
        okButtonTwo.hidden = true
        okButtonTwo.enabled = false
        numberRowTwoButton.setTitle(numRowTwoText.text, forState: UIControlState.Normal)
        numRowTwoText.hidden = true
    }
    @IBAction func numThreeDown(sender: AnyObject) {
        okButtonThree.hidden = false
        okButtonThree.enabled = true
        numRowThreeText.hidden = false
        numRowThreeText.text = numberRowThreeButton.currentTitle
    }
    @IBAction func okButtonThreeDown(sender: AnyObject) {
        okButtonThree.hidden = true
        okButtonThree.enabled = false
        numberRowThreeButton.setTitle(numRowThreeText.text, forState: UIControlState.Normal)
        numRowThreeText.hidden = true
    }
    @IBAction func numFourDown(sender: AnyObject) {
        okButtonFour.hidden = false
        okButtonFour.enabled = true
        numRowFourText.hidden = false
        numRowFourText.text = numberRowFourButton.currentTitle
    }
    @IBAction func okButtonFourDown(sender: AnyObject) {
        okButtonFour.hidden = true
        okButtonFour.enabled = false
        numberRowFourButton.setTitle(numRowFourText.text, forState: UIControlState.Normal)
        numRowFourText.hidden = true
    }
    @IBAction func numFiveDown(sender: AnyObject) {
        okButtonFive.hidden = false
        okButtonFive.enabled = true
        numRowFiveText.hidden = false
        numRowFiveText.text = numberRowFiveButton.currentTitle
    }
    @IBAction func okButtonFiveDown(sender: AnyObject) {
        okButtonFive.hidden = true
        okButtonFive.enabled = false
        numberRowFiveButton.setTitle(numRowFiveText.text, forState: UIControlState.Normal)
        numRowFiveText.hidden = true
    }
    @IBAction func nameOneDown(sender: AnyObject) {
        okNameButtonOne.hidden = false
        okNameButtonOne.enabled = true
        nameTextOne.hidden = false
        nameTextOne.text = nameRowOne.currentTitle
    }
    @IBAction func okNameButtonOneDown(sender: AnyObject) {
        okNameButtonOne.hidden = true
        okNameButtonOne.enabled = false
        nameRowOne.setTitle(nameTextOne.text, forState: UIControlState.Normal)
        nameTextOne.hidden = true
    }
    @IBAction func nameTwoDown(sender: AnyObject) {
        okNameButtonTwo.hidden = false
        okNameButtonTwo.enabled = true
        nameTextTwo.hidden = false
        nameTextTwo.text = nameRowTwo.currentTitle
    }
    @IBAction func okNameButtonTwoDown(sender: AnyObject) {
        okNameButtonTwo.hidden = true
        okNameButtonTwo.enabled = false
        nameRowTwo.setTitle(nameTextTwo.text, forState: UIControlState.Normal)
        nameTextTwo.hidden = true
    }
    @IBAction func nameThreeDown(sender: AnyObject) {
        okNameButtonThree.hidden = false
        okNameButtonThree.enabled = true
        nameTextThree.hidden = false
        nameTextThree.text = nameRowThree.currentTitle
    }
    @IBAction func okNameButtonThreeDown(sender: AnyObject) {
        okNameButtonThree.hidden = true
        okNameButtonThree.enabled = false
        nameRowThree.setTitle(nameTextThree.text, forState: UIControlState.Normal)
        nameTextThree.hidden = true
    }
    @IBAction func nameFourDown(sender: AnyObject) {
        okNameButtonFour.hidden = false
        okNameButtonFour.enabled = true
        nameTextFour.hidden = false
        nameTextFour.text = nameRowFour.currentTitle
    }
    @IBAction func okNameButtonFourDown(sender: AnyObject) {
        okNameButtonFour.hidden = true
        okNameButtonFour.enabled = false
        nameRowFour.setTitle(nameTextFour.text, forState: UIControlState.Normal)
        nameTextFour.hidden = true
    }
    @IBAction func nameFiveDown(sender: AnyObject) {
        okNameButtonFive.hidden = false
        okNameButtonFive.enabled = true
        nameTextFive.hidden = false
        nameTextFive.text = nameRowFive.currentTitle
    }
    @IBAction func okNameButtonFiveDown(sender: AnyObject) {
        okNameButtonFive.hidden = true
        okNameButtonFive.enabled = false
        nameRowFive.setTitle(nameTextFive.text, forState: UIControlState.Normal)
        nameTextFive.hidden = true
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
