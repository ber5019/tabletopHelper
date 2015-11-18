//
//  PageContentViewController.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/11/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//

import UIKit

class PageContentViewController: UIPageViewController {


    
    @IBOutlet weak var heading: UILabel!
    var pageIndex: Int?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.heading.text = "first guy"
        self.heading.alpha = 0.1
        
    }

}
