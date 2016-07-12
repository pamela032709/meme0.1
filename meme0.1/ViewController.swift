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
    //navigation bar
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var navigationBar: UINavigationBar!
    //share and cancel button
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
    
        //shareButton.enabled = false
    
    
    
  //MOVE THE TEXT OUT OF THE PIC
    func keyboardWillShow( notification: NSNotification){
    self.view.frame.origin.y -= getKeyboardHeight(notification)
    }
    
    
    func getKeyboardHeight(notification:NSNotification)->CGFloat {
    let userinfo=notification.userInfo
    let keyboardSize=userinfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
    return keyboardSize.CGRectValue().height
    
    }
    
    func subscribeToKeyboardNotification () {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotification(){
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    
    }
    

 //will get the pics from the album
@IBAction func pickAnImageFromAlbum(sender: AnyObject) {
        let imagePicker  = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType=UIImagePickerControllerSourceType.PhotoLibrary
    presentViewController(imagePicker, animated: true, completion: nil)
    
    }
    
    //method will get pics from the camera directly
    
    @IBAction func pickAnImageFromCamera (sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType=UIImagePickerControllerSourceType.Camera
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(animated: Bool) {
       print("viewWillAppearnow")
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
            super.viewWillAppear(animated)
       
        
        
            // Subscribe to keyboard notifications to allow the view to raise when necessary
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear (animated)
        self.unsubscribeFromKeyboardNotification()
    }
    //dismiss keyboard
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    //retrieve images
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
        
        ImagePickerView.image = image
        
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    
 

        }
   
    func save1() {
        
        // Create the Meme object
        var myMeme = meme(topField: topField.text!, bottomField: bottomField.text!, image: ImagePickerView.image!, memedImage: generateMemedImage())
        // Add it to the Meme array
        (UIApplication.sharedApplication().delegate as! AppDelegate).memes.append(meme)
    }

    func generateMemedImage () -> UIImage {
        
        // Hide navigation bar & tool bar
        
        toolBar.hidden = true
        navigationBar.hidden = true
        
        // Resign first responders , we don't want to capture the editing blue line if we are still in the text field when generating a Meme
        topField.resignFirstResponder()
        bottomField.resignFirstResponder()
        
        //Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Show navigation bar & tool bar
        toolBar.hidden = false
        navigationBar.hidden = false
        
        return memedImage
        
    }
}


