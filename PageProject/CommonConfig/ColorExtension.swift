//
//  ColorExtension.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/21.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

extension UIColor {
    class func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

class ColorExtension: NSObject {
//    String
    
//    深灰#333333
    var largeGray = UIColor.UIColorFromRGB(rgbValue: 0x333333)
//    中灰#595959
    var middenGray = UIColor.UIColorFromRGB(rgbValue: 0x595959)
//    浅灰#A6A6A6
    var smallGray = UIColor.UIColorFromRGB(rgbValue: 0xa6a6a6)
//    白灰#D9D9D9
    var whiteGray = UIColor.UIColorFromRGB(rgbValue: 0xd9d9d9)
    
    
    
//    Color
//    单词蓝 基准色 #0EA3F9
    var wordBlue = UIColor.UIColorFromRGB(rgbValue: 0x0EA3F9)
//    句子绿 #7AC70C
    var sentenceGreen = UIColor.UIColorFromRGB(rgbValue: 0x7AC70C)
//    课文红 #D43433
    var textRed = UIColor.UIColorFromRGB(rgbValue: 0xD43433)
//    短语紫 #9B5FCA
    var stViolet = UIColor.UIColorFromRGB(rgbValue: 0x9B5FCA)
//    音频蓝 #4287FF
    var audioBlue = UIColor.UIColorFromRGB(rgbValue: 0x4287FF)
//    正确绿 #1AAD19
    var rightGreen = UIColor.UIColorFromRGB(rgbValue: 0x1AAD19)
//    错误橙 #FF4D00
    var errorOrange = UIColor.UIColorFromRGB(rgbValue: 0xFF4D00)
//    掌握金 #F9AA28
    var masteryGold = UIColor.UIColorFromRGB(rgbValue: 0xF9AA28)
//    奥星金 #FFD835
    var starGold = UIColor.UIColorFromRGB(rgbValue: 0xFFD835)
//    循环蓝 #ABDDFF
    var loopBlue = UIColor.UIColorFromRGB(rgbValue: 0xABDDFF)
//    亚军蓝 #97B7D7
    var secondBlue = UIColor.UIColorFromRGB(rgbValue: 0x97B7D7)
    
    
    
//    Line
//    线条灰 #EAEAEA
    var lineGray = UIColor.UIColorFromRGB(rgbValue: 0xEAEAEA)
//    底板灰 #F2F2F2
    var bottomGray = UIColor.UIColorFromRGB(rgbValue: 0xF2F2F2)
//    按下灰 #E5E5E5
    var touchGray = UIColor.UIColorFromRGB(rgbValue: 0xE5E5E5)
//    提示绿 #66FF33
    var alertGreen = UIColor.UIColorFromRGB(rgbValue: 0x66FF33)
    
    
//    Question
//    题目选项颜色的顺序:
//    1. 雪青 #9900ff
    var questionSnowBlue = UIColor.UIColorFromRGB(rgbValue: 0x9900ff)
//    2. 天蓝 #00aaff
    var questionSkyBlue = UIColor.UIColorFromRGB(rgbValue: 0x00aaff)
//    3. 土金 #cc9900
    var questionGold = UIColor.UIColorFromRGB(rgbValue: 0xcc9900)
//    4. 染蓝 #0066cc
    var questionBlue = UIColor.UIColorFromRGB(rgbValue: 0x0066cc)
//    5. 藻绿 #00b050
    var questionGreen = UIColor.UIColorFromRGB(rgbValue: 0x00b050)
//    6. 洋红 #ff00ff
    var questionRed = UIColor.UIColorFromRGB(rgbValue: 0xff00ff)
//    7. 枯绿 #99cc00
    var questionWitheredGreen = UIColor.UIColorFromRGB(rgbValue: 0x99cc00)
//    8. 宝蓝 #3366ff
    var questionGemostenBlue = UIColor.UIColorFromRGB(rgbValue: 0x3366ff)
//    9. 浅橘 #ff9933 10p
    var questionOrange = UIColor.UIColorFromRGB(rgbValue: 0xff9933)
    
}
