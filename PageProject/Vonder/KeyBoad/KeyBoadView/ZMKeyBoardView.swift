//
//  ZMKeyBoardView.swift
//  SwiftProject
//
//  Created by 牛新怀 on 2018/7/6.
//  Copyright © 2018年 牛新怀. All rights reserved.
//

import UIKit


//屏幕的宽度
private let KSCREEN_WIDTH:CGFloat  = UIScreen.main.bounds.width
//按键的高宽比
private let KEYRATIO:CGFloat = 120.0  / 72.0
//按键的宽
private let BTN_WIDTH:CGFloat = KSCREEN_WIDTH / 10.0 - 6.0

//按键的高
private let BTN_HEIGHT:CGFloat = 60

//item的高
private let ITEM_HEIGHT:CGFloat = BTN_HEIGHT + 8.0

//底部安全区高度
private let SAFE_BOTTOM:CGFloat = (UIScreen.main.bounds.height == 812.0) ? 34.0 : 0.0

//总高
private let TOTAL_HEIGHT:CGFloat = ITEM_HEIGHT * 4  + 12 + SAFE_BOTTOM


private let spaceItemWidth:CGFloat = (BTN_WIDTH + 6) * 5 - 6
private let itemWidth: CGFloat = (KSCREEN_WIDTH - spaceItemWidth - 3 * 6) / 2
private let highlightColor: String = "#9da4af"
private let titleSelectColor: String = "#333333"




class ZMKeyBoardView: BaseKeyBoardView {

    let totalHeight:CGFloat = TOTAL_HEIGHT
    var dataSource = ZMKeyBoardUtil.getDataSourceBy()
    
    
    init() {
        super.init(frame: .zero)
        self.frame = CGRect.init(x: 0, y: 0, width: KSCREEN_WIDTH, height: TOTAL_HEIGHT)
        configUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        backgroundColor = UIColor.hex(hexString: "#c8ccd3")
        collection.frame = CGRect.init(x: 0, y: 0, width: KSCREEN_WIDTH, height: 276)

        addSubview(collection)
        addSubview(capitalButton)
        addSubview(deleteButton)
        addSubview(changedButton)
        addSubview(kongButton)
        addSubview(confirmButton)
    }
    
    lazy var collection : UICollectionView = {
        let object = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: self.layout)
        object.backgroundColor = UIColor.hex(hexString: "#c8ccd3")
        object.delegate = self
        object.dataSource = self
        object.register(ZMCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: ZMKeyBoardView.cellId)
        return object
    }()

    lazy var layout : ZMCollectionLayout = {
        let object = ZMCollectionLayout()
        return object
    }()
    
    lazy var capitalButton : ZMKeyBoardButtonView = {
        let object = ZMKeyBoardButtonView.init(frame: CGRect.init(x: 3, y: BTN_HEIGHT * 2 + 10 * 3, width: 40, height: BTN_HEIGHT))
        object.setImage(imageNamed: "dict_newshift", state: .normal)
        object.setImage(imageNamed: "dict_newshiftdown", state: .selected)
        object.setBackgroundImage(image: UIImage.image(color: UIColor.white)!, state: .selected)
        object.setBackgroundImage(image: UIImage.image(color: UIColor.hex(hexString: highlightColor))!, state: .normal)
        object.button.layer.masksToBounds = true
        object.delegate = self
        object.style = KeyBoardButtonStyle.keyBoardCapitalButtonStyle
        return object
    }()

    lazy var deleteButton : ZMKeyBoardButtonView = {
        let object = ZMKeyBoardButtonView.init(frame: CGRect.init(x: KSCREEN_WIDTH - 3 - 40, y: BTN_HEIGHT * 2 + 10 * 3, width: 40, height: BTN_HEIGHT))
        object.setImage(imageNamed: "dict_newbackspace", state: .normal)
        object.setImage(imageNamed: "dict_newbackspacedown", state: .highlighted)
        object.setBackgroundImage(image: UIImage.image(color: UIColor.hex(hexString: highlightColor))!, state: .normal)
        object.setBackgroundImage(image: UIImage.image(color: UIColor.white)!, state: .highlighted)
        object.button.layer.masksToBounds = true
        object.delegate = self
        object.style = KeyBoardButtonStyle.keyBoardDeleteButtonStyle
        return object
    }()
    
    lazy var changedButton : ZMKeyBoardButtonView = {
        let object = ZMKeyBoardButtonView.init(frame: CGRect.init(x: 3, y: capitalButton.frame.origin.y + capitalButton.frame.size.height + 10, width: itemWidth, height: BTN_HEIGHT))
        object.setTitle(".?123", state: .normal)
        object.setTitleColor(colorName: titleSelectColor, state: .normal)
        object.setBackgroundColor(color: UIColor.hex(hexString: highlightColor))
        object.delegate = self
        object.style = KeyBoardButtonStyle.keyBoardChangedButtonStyle
        return object
    }()

    lazy var kongButton : ZMKeyBoardButtonView = {
        let object = ZMKeyBoardButtonView.init(frame: CGRect.init(x: itemWidth + 9, y: changedButton.frame.origin.y, width: spaceItemWidth, height: BTN_HEIGHT))
        object.setBackgroundImage(image: UIImage.image(color: UIColor.white)!, state: .normal)
        object.setBackgroundImage(image: UIImage.image(color: UIColor.hex(hexString: highlightColor))!, state: .highlighted)
        object.setTitle("空格", state: .normal)
        object.button.layer.masksToBounds = true
        object.setTitleColor(colorName: titleSelectColor, state: .normal)
        object.delegate = self
        object.style = KeyBoardButtonStyle.keyBoardKongButtonStyle
        return object
    }()

    lazy var confirmButton : ZMKeyBoardButtonView = {
        let object = ZMKeyBoardButtonView.init(frame: CGRect.init(x: KSCREEN_WIDTH - itemWidth - 3, y: changedButton.frame.origin.y, width: itemWidth, height: BTN_HEIGHT))
        object.setTitle("确定", state: .normal)
        object.setTitleColor(colorName: "#ffffff", state: .normal)
        object.setTitleColor(colorName: "#000000", state: .highlighted)
        object.setBackgroundImage(image: UIImage.image(color: UIColor.hex(hexString: "#4287FF"))!, state: .normal)
        object.setBackgroundImage(image: UIImage.image(color: UIColor.white)!, state: .highlighted)
        object.button.layer.masksToBounds = true
        object.delegate = self
        object.style = KeyBoardButtonStyle.keyBoardConfirmButtonStyle
        return object
    }()

}

extension ZMKeyBoardView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ZMKeyBoardView.cellId, for: indexPath) as! ZMCollectionViewCell
        cell.cellModel = dataSource[indexPath.section][indexPath.row]
        cell.delegate = self
//        if layout.keyBoardStates == .second && indexPath.section > 0 {
//            cell.keyBoardButton.layer.cornerRadius = 10
//        } else {
//            cell.keyBoardButton.layer.cornerRadius = 5
//        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize.init(width: BTN_WIDTH, height: BTN_HEIGHT)
        } else {
             return CGSize.init(width: layout.btnWidth, height: BTN_HEIGHT)
        }
    }
    
}

// 键盘单元格按钮点击方法
extension ZMKeyBoardView: KeyBoardCellDelegate {
    func KeyBoardCellBtnClick(model: ZMKeyBoadModel) {
        var textFieldText = ""
        
        if changedSelect {
            print("当前选中的字符是\(model.keyBoadString!)")
            textFieldText = model.keyBoadString!
            delegate?.keyBoardTap(textFieldText)
        } else {
            if model.isCapital! {
                print("当前选中的文字是大写\(model.keyBoadString!)")
                textFieldText = model.keyBoadString!
                delegate?.keyBoardTap(textFieldText)
            } else {
                print("当前选中的文字是小写\(model.keyBoadString!.lowercased())")
                textFieldText = model.keyBoadString!.lowercased()
                delegate?.keyBoardTap(textFieldText)
            }
        }
        inputString(textFieldText)
        
    }
    
    
}
 // 键盘底部按钮点击方法
extension ZMKeyBoardView: ZMKeyBoardButtonViewDelegate {
    func didSelectButtonClick(view: ZMKeyBoardButtonView, buttonStyle: KeyBoardButtonStyle, sender: UIButton) {
        switch buttonStyle {
        case .keyBoardCapitalButtonStyle: do {// 大小写切换
            sender.isSelected = !sender.isSelected
            if changedSelect {
                if sender.isSelected {
                    self.dataSource = ZMKeyBoardUtil.getThirdDataSourceBy()
                } else {
                    self.dataSource = ZMKeyBoardUtil.getSecondDataSourceBy()
                }
            } else {
                for i in 0...self.dataSource.count - 1 {
                    let models = self.dataSource[i]
                    if models.count != 0 {
                        for m in 0...models.count - 1 {
                            let source = models[m]
                            source.isCapital = !source.isCapital!
                        }
                        self.dataSource[i] = models
                    }
                }
            }
            collection.reloadData()
         
            break
        }
        case .keyBoardDeleteButtonStyle: do { // 删除按钮
            clearBtnClick()
            break
        }
        case .keyBoardChangedButtonStyle: do { // 123切换键盘按钮
            sender.isSelected = !sender.isSelected
            changedSelect = sender.isSelected
            sender.isSelected ? sender.setTitle("abc", for: .normal) : sender.setTitle(".?123", for: .normal)
            if sender.isSelected {
                self.dataSource = ZMKeyBoardUtil.getSecondDataSourceBy()
            } else {
                self.dataSource = ZMKeyBoardUtil.getDataSourceBy()
            }
            changedCapitalButton()
            collection.reloadData()
        
            break
        }
        case .keyBoardKongButtonStyle: do { // 空格
            inputString(" ")
            break
        }
        case .keyBoardConfirmButtonStyle: do { // 确定按钮
            delegate?.returnTap()
            guard let inputSource = self.inputSource else {
                return
            }
            inputSource.endEditing(true)
            break
        }
        }
    }
    
    func changedCapitalButton() {
        capitalButton.button.isSelected = false
        if changedSelect {
            layout.keyBoardStates = .second
             capitalButton.isHidden = true
//            capitalButton.setImage(imageNamed: "", state: .normal)
//            capitalButton.setImage(imageNamed: "", state: .selected)
//            capitalButton.setBackgroundColor(color: UIColor.hex(hexString: highlightColor))
//            capitalButton.setBackgroundImage(image: UIImage.image(color: UIColor.clear)!, state: .normal)
//            capitalButton.setBackgroundImage(image: UIImage.image(color: UIColor.clear)!, state: .selected)
//            capitalButton.setTitle("#+=", state: .normal)
//            capitalButton.setTitle(".?123", state: .selected)
//            capitalButton.setTitleColor(colorName: titleSelectColor, state: .normal)
           
        } else {
            layout.keyBoardStates = .once
            capitalButton.isHidden = false
//            capitalButton.setTitle("", state: .normal)
//            capitalButton.setTitle("", state: .selected)
//            capitalButton.setImage(imageNamed: "capitalNormal", state: .normal)
//            capitalButton.setImage(imageNamed: "capitalSelect", state: .selected)
//            capitalButton.setBackgroundImage(image: UIImage.image(color: UIColor.white)!, state: .normal)
//            capitalButton.setBackgroundImage(image: UIImage.image(color: UIColor.hex(hexString: highlightColor))!, state: .selected)
            
        }
    }
}

// 文字处理方法
extension ZMKeyBoardView {
    
    /// 输入框输入文字
    ///
    /// - Parameter string: 输入的文字
    private func inputString(_ string:String){
        guard let inputSource = self.inputSource else {
            return
        }
        
        //UITextField
        if(inputSource.isKind(of: UITextField.self)){
            //获取输入空控件
            let tmp = inputSource as! UITextField
            
            //判断是否实现了代理，是否实现了shouldChangeCharactersIn代理
            if(tmp.delegate != nil && (tmp.delegate?.responds(to: #selector(UITextFieldDelegate.textField(_:shouldChangeCharactersIn:replacementString:))) ?? false)){
                
                //当前输入框了的选择范围，默认时输入末尾
                var range = NSRange.init(location: tmp.text?.count ?? 0, length: 0)
                
                //有可能不是输入末尾，且选择了几个字符
                if let rag = tmp.selectedTextRange {
                    //光标偏移量，即选中开始位置
                    let currentOffset = tmp.offset(from: tmp.beginningOfDocument, to: rag.start)
                    //选中结束位置
                    let endOffset =  tmp.offset(from: tmp.beginningOfDocument, to: rag.end)
                    //选中字符长度
                    let length = endOffset - currentOffset
                    //选中范围
                    range = NSRange.init(location: currentOffset, length:length)
                }
                
                //代理是否允许输入字符
                let ret = tmp.delegate?.textField?(tmp, shouldChangeCharactersIn: range, replacementString: string) ?? false
                
                //允许输入字符时，输入字符
                if(ret){
                    tmp.insertText(string)
                }
            }else{
                //直接输入字符
                tmp.insertText(string)
            }
            
        } else if(inputSource.isKind(of: UITextView.self)){
            //获取输入空控件
            let tmp = inputSource as! UITextView
            
            //判断是否实现了代理，是否实现了shouldChangeCharactersIn代理
            if(tmp.delegate != nil && (tmp.delegate?.responds(to: #selector(UITextViewDelegate.textView(_:shouldChangeTextIn:replacementText:))) ?? false)){
                
                //当前输入框了的选择范围，默认时输入末尾
                var range = NSRange.init(location: tmp.text?.count ?? 0, length: 0)
                
                //有可能不是输入末尾，且选择了几个字符
                if let rag = tmp.selectedTextRange {
                    //光标偏移量，即选中开始位置
                    let currentOffset = tmp.offset(from: tmp.beginningOfDocument, to: rag.start)
                    //选中结束位置
                    let endOffset =  tmp.offset(from: tmp.beginningOfDocument, to: rag.end)
                    //选中字符长度
                    let length = endOffset - currentOffset
                    //选中范围
                    range = NSRange.init(location: currentOffset, length:length)
                }
                
                //代理是否允许输入字符
                let ret = tmp.delegate?.textView?(tmp, shouldChangeTextIn: range, replacementText: string) ?? false
//                let ret = tmp.delegate?.textField?(tmp, shouldChangeCharactersIn: range, replacementString: string) ?? false
                
                //允许输入字符时，输入字符
                if(ret){
                    tmp.insertText(string)
                }
            }else{
                //直接输入字符
                tmp.insertText(string)
            }
            
        }
    }
    
   
    
}
