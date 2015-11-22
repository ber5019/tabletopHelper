//
//  ViewController.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 11/7/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var lableLabel: UILabel!
    @IBOutlet weak var labelChanger: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.backgroundColor = UIColor(red: 243, green: 229, blue: 245, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func labelChangerDown(sender: AnyObject) {
        lableLabel.text = "was changed"
    }
    
//    //camera app stuff
//    @IBAction func pictureButtonDown(sender: AnyObject) {
//        
//        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
//            var picker = UIImagePickerController()
//            picker.delegate = self
//            picker.sourceType = UIImagePickerControllerSourceType.Camera
//            picker.mediaTypes = [kUTTypeImage]
//            picker.allowsEditing = true
//            self.presentViewController(picker, animated: true, completion: nil)
//        }
//        else{
//            NSLog("No Camera.")
//        }
//    }
//    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: NSDictionary!) {
//        NSLog("Received image from camera")
//        let mediaType = info[UIImagePickerControllerMediaType] as! String
//        var originalImage:UIImage?, editedImage:UIImage?, imageToSave:UIImage?
//        let compResult:CFComparisonResult = CFStringCompare(mediaType as NSString!, kUTTypeImage, CFStringCompareFlags.CompareCaseInsensitive)
//        if ( compResult == CFComparisonResult.CompareEqualTo ) {
//            
//            editedImage = info[UIImagePickerControllerEditedImage] as! UIImage?
//            originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage?
//            
//            if ( editedImage != nil ) {
//                imageToSave = editedImage
//            } else {
//                imageToSave = originalImage
//            }
//            imgView.image = imageToSave
//            imgView.reloadInputViews()
//        }
//        picker.dismissViewControllerAnimated(true, completion: nil)
//    }
//
//    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
//        picker.dismissViewControllerAnimated(true, completion: nil)
//    }
}
