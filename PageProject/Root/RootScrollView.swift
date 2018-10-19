//
//  RootScrollView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/10/19.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class RootScrollView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func touchesShouldCancel(in view: UIView) -> Bool {
        return true
    }
}
