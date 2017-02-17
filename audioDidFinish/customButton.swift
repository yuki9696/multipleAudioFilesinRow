//
//  customButton.swift
//  audioDidFinish
//
//  Created by Yuki Yamamoto on 2017/02/12.
//  Copyright © 2017年 Yuki Yamamoto. All rights reserved.
//

import UIKit

class customButton: UIButton {
    
    @IBInspectable var selectedBackgroundColor :UIColor?
    @IBInspectable var nonSelectedBackgroundColor :UIColor?
    
    override var isSelected :Bool {
        didSet {
            self.backgroundColor =  isSelected ? selectedBackgroundColor : nonSelectedBackgroundColor
        }
    }


}
