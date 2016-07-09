//
//  ViewController.swift
//  meme0.1
//
//  Created by POCH on 6/1/16.
//  Copyright © 2016 POCH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate{

  
    @IBOutlet weak var ImagePickerView: UIImageView!
  
    
    @IBOutlet weak var topField: UITextField!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    
    @IBOutlet weak var bottomField: UITextField!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("")
        print("/ set the top and botton text alogment ")
        
        let memeTextAttributes = [
            NSStrokeColorAttributeName :UIColor.blueColor(), //TODO: Fill in appropriate UIColor,
            NSForegroundColorAttributeName : UIColor.whiteColor(),//TODO: Fill in UIColor,
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName :-3.0 //TODO: Fill in appropriate Float
        ]

        topField.defaultTextAttributes=memeTextAttributes
        topField.textAlignment = NSTextAlignment.Center
        
        
        bottomField.defaultTextAttributes=memeTextAttributes
        bottomField.textAlignment = NSTextAlignment.Center}

    
@IBAction func pickAnImageFromAlbum(sender: AnyObject) {
        let nextController  = UIImagePickerController()
        self.presentViewController(nextController, animated: true, completion: nil)    }
    
    
    //method will get pics from the camera directly
    
    @IBAction func pickAnImageFromCamera (sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(animated: Bool) {
       print("viewWillAppearnow")
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
            super.viewWillAppear(animated)
            // Subscribe to keyboard notifications to allow the view to raise when necessary
        
        }
    
    
    
    
    //retrieve images
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if (info[UIImagePickerControllerOriginalImage] as? UIImage) != nil {
           // imageViewController.image = image
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
 
  
    
    
    
    
        }
   



