//
//  UILabel_Extension.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/11/24.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

class UILabel_Extension: NSObject {
    
}
extension UILabel {
    func textAttributString(font:UIFont,textColor:UIColor,lineSpace:CGFloat,text:String) {
        self.attributedText = self.attributString(font: font, textColor: textColor, lineSpace: lineSpace, text: text)
    }
    
    func textErrorLine(font:UIFont,textColor:UIColor,lineSpace:CGFloat,text:String,lineColor:UIColor) {
        self.attributedText = self.errorLine(font: font, textColor: textColor, lineSpace: lineSpace, text: text, lineColor: lineColor)
    }
    func attributString(font:UIFont,textColor:UIColor,lineSpace:CGFloat,text:String)  -> NSAttributedString {
       let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = lineSpace
        let attributes = [NSAttributedStringKey.font:font,
                          NSAttributedStringKey.paragraphStyle: paraph]
      return  NSAttributedString(string: text, attributes: attributes)
    }
    func errorLine(font:UIFont,textColor:UIColor,lineSpace:CGFloat,text:String,lineColor:UIColor) -> NSAttributedString {
        
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = lineSpace
        let attributes = [NSAttributedStringKey.foregroundColor:textColor,NSAttributedStringKey.strikethroughColor:lineColor,NSAttributedStringKey.strikethroughStyle:NSUnderlineStyle.styleSingle.rawValue,NSAttributedStringKey.font:font,
                          NSAttributedStringKey.paragraphStyle: paraph] as [NSAttributedStringKey : Any]
        return NSAttributedString.init(string: text, attributes: attributes)
    }
}
