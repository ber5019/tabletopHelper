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
    @IBOutlet weak var nameRowOne: UILabel!
    @IBOutlet weak var nameRowTwo: UILabel!
    @IBOutlet weak var nameRowThree: UILabel!
    @IBOutlet weak var nameRowFour: UILabel!
    @IBOutlet weak var nameRowFive: UILabel!
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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //adding functions
    @IBAction func rowOnePlus(sender: AnyObject) {
        let tempNum = Int(numberRowOne.text!)! + 1
        numberRowOne.text = "\(tempNum)"
    }
    @IBAction func rowTwoPlus(sender: AnyObject) {
        let tempNum = Int(numberRowTwo.text!)! + 1
        numberRowTwo.text = "\(tempNum)"
    }
    @IBAction func rowThreePlus(sender: AnyObject) {
        let tempNum = Int(numberRowThree.text!)! + 1
        numberRowThree.text = "\(tempNum)"
    }
    @IBAction func rowFourPlus(sender: AnyObject) {
        let tempNum = Int(numberRowFour.text!)! + 1
        numberRowFour.text = "\(tempNum)"
    }
    @IBAction func rowFivePlus(sender: AnyObject) {
        let tempNum = Int(numberRowFive.text!)! + 1
        numberRowFive.text = "\(tempNum)"
    }
    
    
    //subtracting functions
    @IBAction func rowOneMinus(sender: AnyObject) {
        let tempNum = Int(numberRowOne.text!)! - 1
        numberRowOne.text = "\(tempNum)"
    }
    @IBAction func rowTwoMinus(sender: AnyObject) {
        let tempNum = Int(numberRowTwo.text!)! - 1
        numberRowTwo.text = "\(tempNum)"
    }
    @IBAction func rowThreeMinus(sender: AnyObject) {
        let tempNum = Int(numberRowThree.text!)! - 1
        numberRowThree.text = "\(tempNum)"
    }
    @IBAction func rowFourMinus(sender: AnyObject) {
        let tempNum = Int(numberRowFour.text!)! - 1
        numberRowFour.text = "\(tempNum)"
    }
    @IBAction func rowFiveMinus(sender: AnyObject) {
        let tempNum = Int(numberRowFive.text!)! - 1
        numberRowFive.text = "\(tempNum)"
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
            numberRowOne.hidden = false
            nameRowOne.hidden = false
            counter = counter + 1
            break
        case 2:
            //show second row
            plusButtonTwo.enabled = true
            plusButtonTwo.hidden = false
            minusButtonTwo.enabled = true
            minusButtonTwo.hidden = false
            numberRowTwo.hidden = false
            nameRowTwo.hidden = false
            counter = counter + 1
            break
        case 3:
            //show third row
            plusButtonThree.enabled = true
            plusButtonThree.hidden = false
            minusButtonThree.enabled = true
            minusButtonThree.hidden = false
            numberRowThree.hidden = false
            nameRowThree.hidden = false
            counter = counter + 1
            break
        case 4:
            //show fouth row
            plusButtonFour.enabled = true
            plusButtonFour.hidden = false
            minusButtonFour.enabled = true
            minusButtonFour.hidden = false
            numberRowFour.hidden = false
            nameRowFour.hidden = false
            counter = counter + 1
            break
        case 5:
            //show fifth row
            plusButtonFive.enabled = true
            plusButtonFive.hidden = false
            minusButtonFive.enabled = true
            minusButtonFive.hidden = false
            numberRowFive.hidden = false
            nameRowFive.hidden = false
            counter = counter + 1
            break
        default:
            //disable button
            addCounterButton.enabled = false
            break
            
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
