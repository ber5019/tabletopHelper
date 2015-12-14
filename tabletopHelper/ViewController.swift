//
//  ViewController.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/7/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, NSFetchedResultsControllerDelegate {

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
    //char top view text fields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var levelTextField: UITextField!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var expTextField: UITextField!
    @IBOutlet weak var expLabel: UILabel!
    //end char top view text fields
    @IBOutlet weak var levelloadtext: UILabel!
    @IBOutlet weak var statContainer: UIView!
    @IBOutlet weak var inventoryContainer: UIView!
    @IBOutlet weak var spellContainer: UIView!
    @IBOutlet weak var skillContainer: UIView!
    
    @IBOutlet weak var editbutton: UIButton!
    @IBOutlet weak var saveChangesButton: UIButton!
    //images for subtabs
    @IBOutlet weak var statsTabImage: UIImageView!
    @IBOutlet weak var inventoryTabImage: UIImageView!
    @IBOutlet weak var spellsTabImage: UIImageView!
    @IBOutlet weak var skillsTabImage: UIImageView!
    
    //core data
    var charAtts = [NSManagedObject]()
    
    
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
        changeIconImages("stats")
        fetchCharacter()
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
        let actionSheetController: UIAlertController = UIAlertController(title: "Avatar Location", message: "Where do you want to get your avatar?", preferredStyle: .ActionSheet)
        
        //Create and add the Photo action
        let photoAction: UIAlertAction = UIAlertAction(title: "Photo", style: .Default) { action -> Void in
            //Do some stuff
            if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
                imageFromSource.sourceType = UIImagePickerControllerSourceType.Camera}
                self.presentViewController(imageFromSource, animated: true, completion: nil)
        }
        actionSheetController.addAction(photoAction)
        let miniTapAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {
            (alertAction: UIAlertAction) in actionSheetController.dismissViewControllerAnimated(true, completion: nil)})
        actionSheetController.addAction(miniTapAction)
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
        saveCharacter()
    }
    //camera stuff done!
    
    
    //character editing handling
    @IBAction func editCharacter(sender: AnyObject) {
        classTextField.adjustsFontSizeToFitWidth = true
        classTextField.text = classLabel.text
        classTextField.enabled = true
        classTextField.hidden = false
        classLabel.hidden = true
        levelTextField.text = levelLabel.text
        levelTextField.enabled = true
        levelTextField.hidden = false
        levelLabel.hidden = true
        expTextField.text = expLabel.text
        expTextField.enabled = true
        expTextField.hidden = false
        expLabel.hidden = true
        nameTextField.text = nameLabel.text
        nameTextField.enabled = true
        nameTextField.hidden = false
        nameLabel.hidden = true
        editbutton.enabled = false
        editbutton.hidden = true
        saveChangesButton.enabled = true
        saveChangesButton.hidden = false
    }
    
    @IBAction func doneEditingCharacter(sender: AnyObject) {
        classLabel.text = classTextField.text
        classTextField.hidden = true
        classTextField.enabled = false
        classLabel.hidden = false
        levelLabel.text = levelTextField.text
        levelTextField.hidden = true
        levelTextField.enabled = false
        levelLabel.hidden = false
        expLabel.text = expTextField.text
        expTextField.hidden = true
        expTextField.enabled = false
        expLabel.hidden = false
        nameLabel.text = nameTextField.text
        nameTextField.hidden = true
        nameTextField.enabled = false
        nameLabel.hidden = false
        self.resignFirstResponder()
        saveCharacter()
        editbutton.enabled = true
        editbutton.hidden = false
        saveChangesButton.enabled = false
        saveChangesButton.hidden = true
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
        changeIconImages("stats")
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
        changeIconImages("inventory")
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
        changeIconImages("spells")
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
        changeIconImages("skills")
    }
    
    func changeIconImages(tabName:String){
        statsTabImage.image = UIImage(named: "stats grey")
        inventoryTabImage.image = UIImage(named: "Inventory grey")
        spellsTabImage.image = UIImage(named: "Spellbook grey")
        skillsTabImage.image = UIImage(named: "skills grey")
        switch tabName {
            case "stats":
                statsTabImage.image = UIImage(named: "character stats")
            case "inventory":
                inventoryTabImage.image = UIImage(named: "Inventory")
            case "spells":
                spellsTabImage.image = UIImage(named: "Spellbook")
            case "skills":
                skillsTabImage.image = UIImage(named: "skills")
            default:
                "baz"
        }
    }
    //helper functions
    
    //data saving
    func saveCharacter(){
        
        let charName = nameLabel.text! as String
        let charLevel = levelLabel.text! as String
        let charEXP = expLabel.text! as String
        let charClass = classLabel.text! as String
        //handle image processing
        let img = charAvatar.image
        let imgData = UIImageJPEGRepresentation(img!, 1)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("CharAttributes", inManagedObjectContext:managedContext)
        
        let fetchRequest = NSFetchRequest(entityName: "CharAttributes")
        
        do{
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            if(results.count > 0){
                let character = results[0]
                character.setValue(imgData, forKey: "charAvatar")
                character.setValue(charName, forKey: "charName")
                character.setValue(charLevel, forKey: "charLevel")
                character.setValue(charEXP, forKey: "charEXP")
                character.setValue(charClass, forKey: "charClass")
                try managedContext.save()
            }else{
                let character = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)

                
                character.setValue(imgData, forKey: "charAvatar")
                character.setValue(charName, forKey: "charName")
                character.setValue(charLevel, forKey: "charLevel")
                character.setValue(charEXP, forKey: "charEXP")
                character.setValue(charClass, forKey: "charClass")
                try managedContext.save()
            }
        } catch{
            fatalError("failure to save context: \(error)")
        }
        
    }
    
    func fetchCharacter(){
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "CharAttributes")
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            charAtts = results as! [NSManagedObject]
            if(results.count > 0){
                let character = results[0] as! NSManagedObject
                nameLabel.text = character.valueForKey("charName") as? String
                expLabel.text = character.valueForKey("charEXP") as? String
                levelLabel.text = character.valueForKey("charLevel") as? String
                classLabel.text = character.valueForKey("charClass") as? String
                charAvatar.image = UIImage(data: (character.valueForKey("charAvatar") as! NSData))
            }

        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        //print("character fetched")
    }
   
    
}