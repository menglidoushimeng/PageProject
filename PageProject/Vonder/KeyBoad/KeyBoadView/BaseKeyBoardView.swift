//
//  BaseKeyBoardView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/3/9.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

@objc protocol KeyBoardDelegate  {
    func keyBoardTap(_ key:String)
    func returnTap()
    func deleteTap()
}

class BaseKeyBoardView: UIView {
    weak var delegate:KeyBoardDelegate?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    static let cellId = "keyBoardCellIdentifier"
    //输入源，如ITextFied
    weak public var inputSource:UIView?
    
    var changedSelect = false // 键盘上123切换是否选中
    
 
    
    /// 删除文字
    ///
    /// - Parameter button: 删除按钮
    @objc func clearBtnClick(){
        delegate?.deleteTap()
        guard let inputSource = self.inputSource else {
            return
        }
        //UITextField和UITextView
        if(inputSource.isKind(of: UITextField.self)){
            let tmp = inputSource as! UITextField
            
            var currentOffset = (tmp.text?.count ?? 0)
            var length = 1
            //有可能不是输入末尾，且选择了几个字符
            if let rag = tmp.selectedTextRange {
                //光标偏移量，即选中开始位置
                currentOffset = tmp.offset(from: tmp.beginningOfDocument, to: rag.start)
                //选中结束位置
                let endOffset =  tmp.offset(from: tmp.beginningOfDocument, to: rag.end)
                //选中字符长度
                length = endOffset - currentOffset
            }
            
            //判断是否实现了代理，是否实现了shouldChangeCharactersIn代理
            if(!(currentOffset == 0 && length == 0 ) && (tmp.text?.count ?? 0) > 0 && tmp.delegate != nil && (tmp.delegate?.responds(to: #selector(UITextFieldDelegate.textField(_:shouldChangeCharactersIn:replacementString:))) ?? false)){
                
                if(length == 0 && currentOffset > 0){
                    currentOffset -= 1
                }
                
                //至少删除一个字符
                if(length == 0){
                    length = 1
                }
                if tmp.text!.count >= 4 {
                    let i = tmp.text!.index(tmp.text!.startIndex, offsetBy: tmp.text!.count - 4)
                    let j = tmp.text!.index(tmp.text!.startIndex, offsetBy: tmp.text!.count)
                    let subStr = tmp.text![i..<j]
                    if subStr == "sth."{
                        length = 4
                        currentOffset = currentOffset - 3 > 0 ? currentOffset - 3 : 0
                    }
                }
                if tmp.text!.count >= 3 {
                    let i = tmp.text!.index(tmp.text!.startIndex, offsetBy: tmp.text!.count - 3)
                    let j = tmp.text!.index(tmp.text!.startIndex, offsetBy: tmp.text!.count)
                    let subStr = tmp.text![i..<j]
                    if subStr == "sb."  || subStr == "..." {
                        length = 3
                        currentOffset =  currentOffset - 2 > 0 ? currentOffset - 2 : 0
                    }
                }
                //删除位置
                let range = NSRange.init(location:currentOffset, length: length)
                
                //代理是否允许输入字符
                let ret = tmp.delegate?.textField?(tmp, shouldChangeCharactersIn: range, replacementString: "") ?? false
                
                //允许输入字符时，直接删除
                if(ret){
                    for _ in 1...length {
                        tmp.deleteBackward()
                    }
                }
            }else{
                //直接删除
                tmp.deleteBackward()
            }
        } else if(inputSource.isKind(of: UITextView.self)){
            let tmp = inputSource as! UITextView
            
            var currentOffset = (tmp.text?.count ?? 0)
            var length = 1
            //有可能不是输入末尾，且选择了几个字符
            if let rag = tmp.selectedTextRange {
                //光标偏移量，即选中开始位置
                currentOffset = tmp.offset(from: tmp.beginningOfDocument, to: rag.start)
                //选中结束位置
                let endOffset =  tmp.offset(from: tmp.beginningOfDocument, to: rag.end)
                //选中字符长度
                length = endOffset - currentOffset
            }
            
            //判断是否实现了代理，是否实现了shouldChangeCharactersIn代理
            if(!(currentOffset == 0 && length == 0 ) && (tmp.text?.count ?? 0) > 0 && tmp.delegate != nil && (tmp.delegate?.responds(to: #selector(UITextViewDelegate.textView(_:shouldChangeTextIn:replacementText:))) ?? false)){
                
                if(length == 0 && currentOffset > 0){
                    currentOffset -= 1
                }
                
                //至少删除一个字符
                if(length == 0){
                    length = 1
                }
                if tmp.text.count >= 4 {
                    let i = tmp.text.index(tmp.text.startIndex, offsetBy: tmp.text.count - 4)
                    let j = tmp.text.index(tmp.text.startIndex, offsetBy: tmp.text.count)
                    let subStr = tmp.text[i..<j]
                    if subStr == "sth."{
                        length = 4
                       currentOffset = currentOffset - 3 > 0 ? currentOffset - 3 : 0
                    }
                }
                if tmp.text.count >= 3 {
                    let i = tmp.text.index(tmp.text.startIndex, offsetBy: tmp.text.count - 3)
                    let j = tmp.text.index(tmp.text.startIndex, offsetBy: tmp.text.count)
                    let subStr = tmp.text[i..<j]
                    if subStr == "sb."  || subStr == "..." {
                        length = 3
                       currentOffset =  currentOffset - 2 > 0 ? currentOffset - 2 : 0
                    }
                }
                
                //删除位置
                let range = NSRange.init(location:currentOffset, length: length)
                
                //代理是否允许输入字符
                let ret = tmp.delegate?.textView?(tmp, shouldChangeTextIn: range, replacementText: "") ?? false
                
                //允许输入字符时，直接删除
                if(ret){
                    for _ in 1...length {
                         tmp.deleteBackward()
                    }
                   
                }
            }else{
                //直接删除
                tmp.deleteBackward()
            }
        }
    }

}
