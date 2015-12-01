//
//  StatTableViewCell.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/29/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//

import UIKit

class StatTableViewCell: UITableViewCell {


    @IBOutlet weak var numButton: UIButton!
//    @IBOutlet weak var minusbutton: UIButton!
    @IBOutlet weak var namebutton: UIButton!
//    @IBOutlet weak var numText: UITextField!
//    @IBOutlet weak var numok: UIButton!
//    @IBOutlet weak var nameok: UIButton!
//    @IBOutlet weak var nameText: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        // Initialization code
//        let tapGesture = UITapGestureRecognizer(target: self, action: "tap:")
//        self.addGestureRecognizer(tapGesture)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

//    @IBAction func numButtonDown(sender: AnyObject) {
//        numText.hidden = false
//        numText.enabled = true
//        numText.text = numButton.currentTitle
//        numok.enabled = true
//        numok.hidden = false
//    }
//    @IBAction func numokDown(sender: AnyObject) {
//        numButton.setTitle(numText.text, forState: UIControlState.Normal)
//        numText.hidden = true
//        numText.enabled = false
//        numok.enabled = false
//        numok.hidden = true
//    }
//    @IBAction func nameDown(sender: AnyObject) {
//        nameText.hidden = false
//        nameText.enabled = true
//        nameText.text = namebutton.currentTitle
//        nameok.enabled = true
//        nameok.hidden = false
//    }
//    @IBAction func nameokdown(sender: AnyObject) {
//        namebutton.setTitle(nameText.text, forState: UIControlState.Normal)
//        nameText.hidden = true
//        nameText.enabled = false
//        nameok.enabled = false
//        nameok.hidden = true
//    }
//    func tap(gesture: UITapGestureRecognizer) {
//        nameText.resignFirstResponder()
//        numText.resignFirstResponder()
//    }
}
