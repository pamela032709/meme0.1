//
//  ViewController.swift
//  meme0.1
//
//  Created by POCH on 6/1/16.
//  Copyright © 2016 POCH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var imagePickerView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imagePickerView.image = image
            dismissViewControllerAnimated(true, completion: nil)
        }
    
    @IBAction func picker(sender: AnyObject) {
        
        var imagePick=UIImagePickerController()
        
        imagePick.delegate = self
        imagePick.sourceType = .PhotoLibrary
        self.presentViewController(imagePick, animated: true, completion: nil)
        
        
        }
   
  
    @IBAction func pickAnImageFromAlbum (sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary

    
    }
    
    
    @IBAction func pickAnImageFromCamera (sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
    imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
    
    }
}

