//
//  UnitSelectedModel.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/10/23.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class UnitSelectedModel: NSObject {
    
    init(_ titleString:String,_ number:String,_ isLight:Bool,_ isStar:Bool) {
        super.init()
        self.titleString = titleString
        self.number = number
        self.isLight = isLight
        self.isStar = isStar
    }
    var titleString:String?
    var number:String?
    var isLight:Bool = true
    var isStar:Bool = false
}
