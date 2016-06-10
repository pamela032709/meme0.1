//
//  ViewController.swift
//  meme0.1
//
//  Created by POCH on 6/1/16.
//  Copyright © 2016 POCH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate{

    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var topField: UITextField!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    
    @IBOutlet weak var bottomField: UITextField!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    let memeTextAttributes = [
        NSStrokeColorAttributeName :UIColor.blueColor(), //TODO: Fill in appropriate UIColor,
        NSForegroundColorAttributeName : UIColor.whiteColor(),//TODO: Fill in UIColor,
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName :-3.0 //TODO: Fill in appropriate Float
    ]
    
    
       override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("")
        print("/ set the top and botton text alogment ")
        
        topField.defaultTextAttributes=memeTextAttributes
        topField.textAlignment = NSTextAlignment.Center
        
        
        bottomField.defaultTextAttributes=memeTextAttributes
        bottomField.textAlignment = NSTextAlignment.Center
        
        
        // Do any additional setup after loading the view, typically from a nib.
      //textfield comes in here , change the text label to a text field
    }
    
    //override func viewWillAppear(animated:true,completion:nil ) {
        //cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
    //}
    override func viewWillAppear(animated: Bool) {
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)

        
    }
    
    
    
    //retrieve images
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if (info[UIImagePickerControllerOriginalImage] as? UIImage) != nil {
           // imageViewController.image = image
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
 
  
    //will retrieve the images from an album
    
    @IBAction func pickAnImageFromAlbum(sender: AnyObject) {
    let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
      self.dismissViewControllerAnimated(true, completion: nil)
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    
    }
    
    
   //method will get pics from the camera directly 
    
    @IBAction func pickAnImageFromCamera(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    
        }
   



