//
//  CustomUITextView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/3/9.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class CustomUITextView: RootTextView {
    
    private var editIndex:NSInteger = 0
    private var isEditeing:Bool = false
    private var isDelete:Bool = false
    private var maxIndex:NSInteger = 0
    private let paragraphStyle = NSMutableParagraphStyle()
    private var editArr:Array<NSRange> = Array<NSRange>()
    private let TEXTVIEW_ONELINE_HEIGHT:CGFloat = 48
    private let TEXTVIEW_HEIGHT:CGFloat = 96
    var placeHolder:String = "" {
        didSet {
            
            self.placeHolderText(placeHolder)
        }
    }
    private let writedColor:UIColor = ColorExtension().largeGray
    private let selectedColor:UIColor = ColorExtension().audioBlue
    private let placeHolderColor:UIColor = ColorExtension().smallGray
    private let textFont:UIFont =  UIFont.init(name: "CourierNewPSMT", size: 18)!
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame,textContainer:textContainer)
         self.viewSetting()
        self.tintColor = UIColor.clear
        self.isUserInteractionEnabled = false
        paragraphStyle.lineSpacing = 20
        self.autoLayoutHeight()
        
    }
    private func autoLayoutHeight() {
        let size = getStringPlaceSize(self.text, textFont, self)
        let height = self.textFont.lineHeight  + 20
        if size.height >  height {
            self.snp.updateConstraints { (make) in
                make.height.equalTo(TEXTVIEW_HEIGHT)
            }
        } else {
            self.snp.updateConstraints { (make) in
                make.height.equalTo(TEXTVIEW_ONELINE_HEIGHT)
            }
            
        }
    }
    @objc fileprivate func getStringPlaceSize(_ string : String, _ textFont : UIFont, _ textView:UITextView) -> CGSize {
        ///计算文本高度
        let attribute = [NSAttributedStringKey.font : textFont];
        let options = NSStringDrawingOptions.usesLineFragmentOrigin
        let size = string.boundingRect(with: CGSize(width: textView.contentSize.width-10, height: CGFloat.greatestFiniteMagnitude), options: options, attributes: attribute, context: nil).size
        return size
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func viewSetting() {
       
        // 打印所有的字体
        for fanilyName:String in UIFont.familyNames
        {
            let fontNames = UIFont.fontNames(forFamilyName: fanilyName)
            for fontName:String in fontNames
            {
                //[@心语风尚]这里打印的系统的字体，对汉字不是全适用，对英语都适用
                print("\tFont",fontName,"\n")
            }
        }
    }
    func tryAgainView() {
        self.editIndex = 0
        let text = NSMutableAttributedString.init(string: placeHolder)
        self.textSetting(text: text)
        self.beginEdit()
    }
    
    func beginEdit() {
        self.becomeFirstResponder()
        self.isEditeing = true
        self.isUserInteractionEnabled = true
        let text = NSMutableAttributedString.init(attributedString: self.attributedText)
        self.textSetting(text: text)
       
    }
    func appendString(str:String) {
  
        for index in 0...str.count - 1 {
            let i = str.index(str.startIndex, offsetBy: index)
            let j = str.index(str.startIndex, offsetBy: index + 1)
            let subStr = String(str[i..<j]) as String
           appendStr(str: subStr)
        }
    }
    private func appendStr(str:String) {
        if editIndex < maxIndex {
            let attributText = NSMutableAttributedString.init(attributedString: self.attributedText)
            let rang = editArr[editIndex]
            attributText.replaceCharacters(in: rang, with: str)
            self.editIndex += 1
            self.textSetting(text: attributText)
            
        }
    }
    func deleteStr() {
        if editIndex > 0 {
            editIndex -= 1
            let attributText = NSMutableAttributedString.init(attributedString: self.attributedText)
            let rang = editArr[editIndex]
            attributText.replaceCharacters(in: rang, with:"*")
            
            self.textSetting(text: attributText)
        }
    }
    func endEdit() {
        self.isEditeing = false
        self.isUserInteractionEnabled = false
        let text = NSMutableAttributedString.init(attributedString: self.attributedText)
        self.textSetting(text: text)
        self.resignFirstResponder()
    }
    private func placeHolderText(_ placeHolder:String) {
        editArr = Array()
        let placeHolderAttribut = NSMutableAttributedString.init(string: placeHolder)
        placeHolderAttribut.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange.init(location: 0, length: maxIndex))
        placeHolderAttribut.addAttributes([NSAttributedStringKey.foregroundColor:self.placeHolderColor,NSAttributedStringKey.font:self.textFont], range: NSRange.init(location: 0, length: placeHolder.count))
        for i in 0...placeHolder.count - 1 {
            let subStr = placeHolder.substringInRange(Range.init(NSRange.init(location: i, length: 1))!)
            if subStr == "*" {
                let editRange = NSRange.init(location: i, length: 1)
                editArr.append(editRange)
                placeHolderAttribut.addAttributes([NSAttributedStringKey.foregroundColor:self.writedColor,NSAttributedStringKey.font:self.textFont], range: editRange)
            }
        }
        self.maxIndex = editArr.count
        self.editIndex = 0
        self.attributedText = placeHolderAttribut
    }
    private func textSetting(text:NSMutableAttributedString) {
      
        text.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange.init(location: 0, length: text.string.count))
        text.addAttributes([NSAttributedStringKey.foregroundColor:self.placeHolderColor,NSAttributedStringKey.font:self.textFont], range: NSRange.init(location: 0, length: text.string.count))
            if editIndex <= maxIndex && isEditeing {
                for (index,range) in editArr.enumerated() {
                    if index == editIndex {
                        text.addAttributes([NSAttributedStringKey.foregroundColor:self.selectedColor], range: range)
                    } else {
                         text.addAttributes([NSAttributedStringKey.foregroundColor:self.writedColor], range: range)
                    }
                }
               
            } else {
                for range in editArr {
                        text.addAttributes([NSAttributedStringKey.foregroundColor:self.writedColor], range: range)
                }
            }
           
        
         self.attributedText = text
    }
    func isEditCheck() -> Bool {
        return self.isEditeing
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension String {
    //获取子字符串
    func substringInRange(_ r: Range<Int>) -> String? {
        if r.lowerBound < 0 || r.upperBound > self.count {
            return nil
        }
        let startIndex = self.index(self.startIndex, offsetBy:r.lowerBound)
        let endIndex   = self.index(self.startIndex, offsetBy:r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
