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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var levelTextField: UITextField!
    @IBOutlet weak var expTextField: UITextField!
    @IBOutlet weak var levelloadtext: UILabel!
    @IBOutlet weak var statContainer: UIView!
    @IBOutlet weak var inventoryContainer: UIView!
    @IBOutlet weak var spellContainer: UIView!
    @IBOutlet weak var skillContainer: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(UIScreen.mainScreen().bounds.size.height <= 568){
            levelloadtext.text = "Lvl:"
        }
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
    
    
//upper view functionality
    //camera app stuff
    @IBAction func getImageDown(sender: AnyObject) {
        let imageFromSource = UIImagePickerController()
        imageFromSource.delegate = self
        imageFromSource.allowsEditing = false
        
        //////////ask the user if they want to take a photo or choose from library
        let actionSheetController: UIAlertController = UIAlertController(title: "Avatar Location", message: "Where do you want to get your avatar?", preferredStyle: .Alert)
        
        //Create and add the Photo action
        let photoAction: UIAlertAction = UIAlertAction(title: "Photo", style: .Default) { action -> Void in
            //Do some stuff
            if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
                imageFromSource.sourceType = UIImagePickerControllerSourceType.Camera}
                self.presentViewController(imageFromSource, animated: true, completion: nil)
        }
        actionSheetController.addAction(photoAction)
        //Create and an option action
        let cameraRollAction: UIAlertAction = UIAlertAction(title: "Camera Roll", style: .Default) { action -> Void in
            //Do some other stuff
            imageFromSource.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(imageFromSource, animated: true, completion: nil)

        }
        actionSheetController.addAction(cameraRollAction)
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
        /////////////end of user interaction
        
//        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
//            imageFromSource.sourceType = UIImagePickerControllerSourceType.Camera
//        }else{
//            imageFromSource.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//        }
//        
//       self.presentViewController(imageFromSource, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let temp : UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        charAvatar.image = temp
        self.dismissViewControllerAnimated(true, completion: {})
    }
    //camera stuff done!
    
    @IBAction func nameButtonDown(sender: AnyObject) {
        nameLabel.text = "found it!"
    }
    
    
    
    
    
    
    
//start of lower view
    @IBAction func statsButtonDown(sender: AnyObject) {
        statsSeperator.hidden = true
        inventorySeperator.hidden = false
        spellsSeperator.hidden = false
        skillSeperator.hidden = false
        statContainer.hidden = false
        inventoryContainer.hidden = true
        spellContainer.hidden = true
        skillContainer.hidden = true
    }
    @IBAction func inventoryButtonDown(sender: AnyObject) {
        statsSeperator.hidden = false
        inventorySeperator.hidden = true
        spellsSeperator.hidden = false
        skillSeperator.hidden = false
        statContainer.hidden = true
        inventoryContainer.hidden = false
        spellContainer.hidden = true
        skillContainer.hidden = true
    }
    @IBAction func spellsButtonDown(sender: AnyObject) {
        statsSeperator.hidden = false
        inventorySeperator.hidden = false
        spellsSeperator.hidden = true
        skillSeperator.hidden = false
        statContainer.hidden = true
        inventoryContainer.hidden = true
        spellContainer.hidden = false
        skillContainer.hidden = true
    }
    @IBAction func skillsButtonDown(sender: AnyObject) {
        statsSeperator.hidden = false
        inventorySeperator.hidden = false
        spellsSeperator.hidden = false
        skillSeperator.hidden = true
        statContainer.hidden = true
        inventoryContainer.hidden = true
        spellContainer.hidden = true
        skillContainer.hidden = false
    }
//helper functions
    
   
    
}