//
//  ViewController.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/7/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lableLabel: UILabel!
    @IBOutlet weak var labelChanger: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func labelChangerDown(sender: AnyObject) {
        lableLabel.text = "was changed"
    }

}
