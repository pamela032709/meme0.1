//
//  meme2.swift
//  meme0.1
//
//  Created by Pamela Rios on 7/14/16.
//  Copyright © 2016 POCH. All rights reserved.
//

import Foundation

import UIKit

struct Meme{
    var topTextField:String?
    var bottomField:String?
    var image:UIImage?
    var memedImage:UIImage?
    
    init(bottomField:String){self.bottomField=bottomField}
    init(topString:String){self.topTextField=topString}
    init(image:UIImage){self.ImagePickerView=image}
    init(memedImage:UIImage){self.memedImage=generateMemedImage}
    
    

}
