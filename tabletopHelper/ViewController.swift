//
//  ViewController.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/7/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var charAvatar: UIImageView!
    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var inventoryButton: UIButton!
    @IBOutlet weak var inventorySeperator: UIView!
    @IBOutlet weak var spellsButton: UIButton!
    @IBOutlet weak var spellsSeperator: UIView!
    @IBOutlet weak var skillButton: UIButton!
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var statsSeperator: UIView!
    @IBOutlet weak var skillSeperator: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        charAvatar.layer.cornerRadius = charAvatar.frame.size.width/2
        charAvatar.clipsToBounds = true
        charAvatar.layer.borderWidth = 3.0
        charAvatar.layer.borderColor = UIColor.init(red: 186/255, green: 104/255, blue: 200/255, alpha: 1.0).CGColor
        avatarButton.layer.cornerRadius = avatarButton.frame.size.width/2
        avatarButton.clipsToBounds = true
        
        statsSeperator.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //camera app stuff

    @IBAction func getImageDown(sender: AnyObject) {
        let imageFromSource = UIImagePickerController()
        imageFromSource.delegate = self
        imageFromSource.allowsEditing = false
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            imageFromSource.sourceType = UIImagePickerControllerSourceType.Camera
        }else{
            imageFromSource.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        self.presentViewController(imageFromSource, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let temp : UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        charAvatar.image = temp
        self.dismissViewControllerAnimated(true, completion: {})
    } //camera stuff done!
    
    @IBAction func statsButtonDown(sender: AnyObject) {
        statsSeperator.hidden = true
        inventorySeperator.hidden = false
        spellsSeperator.hidden = false
        skillSeperator.hidden = false
    }
    @IBAction func inventoryButtonDown(sender: AnyObject) {
        statsSeperator.hidden = false
        inventorySeperator.hidden = true
        spellsSeperator.hidden = false
        skillSeperator.hidden = false
    }
    @IBAction func spellsButtonDown(sender: AnyObject) {        statsSeperator.hidden = false
        inventorySeperator.hidden = false
        spellsSeperator.hidden = true
        skillSeperator.hidden = false
    }
    @IBAction func skillsButtonDown(sender: AnyObject) {
        statsSeperator.hidden = false
        inventorySeperator.hidden = false
        spellsSeperator.hidden = false
        skillSeperator.hidden = true
    }
}