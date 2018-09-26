//
//  MineModel.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/26.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class MineModel: NSObject {
    
    var imageName:String = String()
    var title:String = String()
    var desc:String = String()
    var rightDesc:String = String()
    var rightTextColor:UIColor = UIColor()
    var hiddenRedView:Bool = true
    
    class func MineModelArr() -> NSMutableArray {
        let modelArr = NSMutableArray.init()
        let imageArr = ["dict_currentbook","down","dict_shareandriodgray","dict_shareandriodgray"]
        let titleArr = ["课本","课本下载记录","推荐给朋友","群排行榜"];
        let descArr = ["苏教版牛津（三起）五上","","",""];
        let rightArr = ["更换课本","","","建群、加群"];
        let rightColorArr = [ColorExtension().smallGray,ColorExtension().smallGray,ColorExtension().smallGray,ColorExtension().starGold];
        let hiddenArr = [NSNumber.init(booleanLiteral: true),NSNumber.init(booleanLiteral: true),NSNumber.init(booleanLiteral: true),NSNumber.init(booleanLiteral: false)];
        for i in 0...3 {
           let model = MineModel()
            model.imageName = imageArr[i]
            model.title = titleArr[i]
            model.desc = descArr[i]
            model.rightDesc = rightArr[i]
            model.hiddenRedView = hiddenArr[i].boolValue
            model.rightTextColor = rightColorArr[i]
            modelArr.add(model)
        }
        return modelArr
    }
}
