//
//  CommbinationModel.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/11/20.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

class CommbinationModel: NSObject {
    var number:Int?
    var selected:Int?
    var title:String?
    var titleColor:UIColor?
    var error = false
    
    init(number:Int,title:String,titleColor:UIColor) {
        super.init()
        self.number = number
        self.title = title
        self.titleColor = titleColor
    }
}
