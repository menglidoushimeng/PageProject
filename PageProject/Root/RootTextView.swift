//
//  RootTextView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/3/22.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class RootTextView: UITextView {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        return false
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
