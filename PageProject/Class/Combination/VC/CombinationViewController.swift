//
//  CombinationViewController.swift
//  PageProject
//
//  Created by 汪文浩 on 2018/11/14.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

enum ButtonState {
    case question
    case answer
    case answerRight
    case answerError
    
}

class CombinationViewController: RootUnNaviProgressBarViewController {

    var tagSource:Array<CommbinationModel> = Array()
    var answerSource:Array<CommbinationModel> = Array()
    var tagSourceButton:Array<CommbinButton> = Array()
     var answerSourceButton:Array<CommbinButton> = Array()
    let titleLine = UIView()
    let answerLine = UIView()
    
    
    let checkImage = UIImageView()
    let tryAgainBtn = UIButton()
    
    let rightLb = UILabel()
    let rightDesc = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let titleLb = UILabel()
    override func viewSetting() {
        super.viewSetting()
        self.view.addSubview(titleLb)
        titleLb.text = "请和你朋友庆祝你的生日"
        titleLb.textAlignment = .center
        titleLb.font = UIFont.systemFont(ofSize: 20)
        titleLb.textColor = ColorExtension().largeGray
       titleLb.snp.makeConstraints { (make) in
            make.top.equalTo(self.turnBackBtn.snp.bottom)
            make.left.right.equalTo(self.safe)
            make.top.equalTo(self.turnBackBtn.snp.bottom)
            make.height.equalTo(240)
        }
       titleLine.backgroundColor = ColorExtension().lineGray
        self.view.addSubview(titleLine)
        titleLine.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.safe)
            make.top.equalTo(self.titleLb.snp.bottom)
            make.height.equalTo(1)
        }
        
        
        
        tryAgainBtn.setImage(UIImage.init(named: "dict_retry"), for: .normal)
        self.view.addSubview(tryAgainBtn)
        tryAgainBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.safe)
            make.right.equalTo(self.safe)
        }
        tryAgainBtn.isHidden = true
        tryAgainBtn.addTarget(self, action: #selector(tryAgainAction(_:)), for: .touchDown)
        
        let celebrate = CommbinationModel.init(number: 0, title: "celebrate", titleColor: ColorExtension().questionBlue)
        let your = CommbinationModel.init(number: 1, title: "your", titleColor: ColorExtension().questionGreen)
        let birthday = CommbinationModel.init(number: 2, title: "birthday", titleColor: ColorExtension().questionSnowBlue)
        let with = CommbinationModel.init(number: 3, title: "with", titleColor: ColorExtension().questionBlue)
        let your2 = CommbinationModel.init(number: 4, title: "your", titleColor: ColorExtension().questionRed)
        let friends = CommbinationModel.init(number: 5, title: "friends", titleColor: ColorExtension().questionGold)
        self.tagSource.append(celebrate)
        self.tagSource.append(your)
        self.tagSource.append(birthday)
        self.tagSource.append(with)
        self.tagSource.append(your2)
        self.tagSource.append(friends)
       
        self.tagSourceButton =  self.customTagArray(sourceArray: self.tagSource,topView: titleLine, startPositionX: 10, startPositionY:10, viewWidth: UIScreen.main.bounds.size.width, font: UIFont.systemFont(ofSize: 18), tagHeight: 40,sel: #selector(titleAction(_:)), state: .question, space: 5)
        let lastBtn = tagSourceButton.last
        answerLine.backgroundColor = ColorExtension().lineGray
        self.view.addSubview(answerLine)
       answerLine.snp.makeConstraints { (make) in
        
            make.left.right.equalTo(self.safe)
            make.top.equalTo(lastBtn!.snp.bottom).offset(10)
            make.height.equalTo(1)
        }
        
        self.view.addSubview(rightLb)
        rightLb.textColor = ColorExtension().rightGreen
        rightLb.font = UIFont.systemFont(ofSize: 18)
        rightLb.snp.makeConstraints { (make) in
            make.left.equalTo(self.safe).offset(15)
            make.centerX.equalTo(self.safe.snp.centerX)
            make.top.equalTo(answerLine.snp.bottom).offset(20)
        }
        rightLb.isHidden = true
        rightLb.numberOfLines = 0
        
        
        self.view.addSubview(rightDesc)
        rightDesc.textColor = ColorExtension().smallGray
        rightDesc.font = UIFont.systemFont(ofSize: 16)
        rightDesc.snp.makeConstraints { (make) in
            make.left.equalTo(rightLb.snp.left)
             make.right.equalTo(rightLb.snp.right)
            make.top.equalTo(rightLb.snp.bottom).offset(10)
        }
         rightDesc.isHidden = true
        rightDesc.numberOfLines = 0
        
        
        self.view.addSubview(checkImage)
        checkImage.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.answerLine.snp.bottom)
            make.right.equalTo(self.safe)
            make.width.height.equalTo(60)
        }
        checkImage.isHidden = true
        
    }
    func customTagArray(sourceArray:Array<CommbinationModel>,topView:UIView,startPositionX:CGFloat,startPositionY:CGFloat,viewWidth:CGFloat,font:UIFont,tagHeight:CGFloat,sel:Selector,state:ButtonState,space:CGFloat) -> Array<CommbinButton> {
        var positionX:CGFloat = startPositionX;
        var positionY:CGFloat = startPositionY;
        
        var buttonArr = Array<CommbinButton>()
        for source in sourceArray {
            let btnWidth = self.textWidth(text: source.title!, font:font, height: tagHeight);
            if positionX + btnWidth > viewWidth - startPositionX {
                positionX = startPositionX;
                positionY += tagHeight;
            }
            let btn = CommbinButton()
            buttonArr.append(btn)
            btn.setTitle(source.title, for: .normal)
            btn.setTitleColor(source.titleColor!, for: .normal)
         
            
            self.view.addSubview(btn)
            btn.model = source
            btn.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(positionX)
                make.top.equalTo(topView.snp.bottom).offset(positionY)
                make.width.equalTo(btnWidth)
                make.height.equalTo(tagHeight)
            }
            btn.titleLabel!.font = font;
           
            positionX += (btnWidth+space);
            btn.addTarget(self, action: sel, for: .touchUpInside)

            
        }
        return buttonArr
    }
    @objc func titleAction(_ sender:CommbinButton) {
        if !tryAgainBtn.isHidden {
            return
        }
            if sender.model != nil {
                if !answerSource.contains(sender.model!){
                    answerSource.append(sender.model!)
                } else {
                    answerSource.remove(sender.model!)
                }
                
                for (index,value) in answerSource.enumerated() {
                    value.selected = index
                }
            }


        for btn in answerSourceButton {
            btn.removeFromSuperview()
        }
        if self.answerSource.count < self.tagSource.count {
            self.answerSourceButton = self.customTagArray(sourceArray: answerSource, topView: answerLine, startPositionX: 10, startPositionY: 10, viewWidth:  UIScreen.main.bounds.size.width, font: UIFont.systemFont(ofSize: 18), tagHeight: 40, sel: #selector(answerAction(_:)), state: .answer, space: 5)
            checkImage.isHidden = true
            tryAgainBtn.isHidden = true
            rightLb.isHidden = true
        } else {
            for btn in answerSourceButton {
                btn.removeFromSuperview()
            }
            answerSource = Array()
            rightLb.isHidden = false
            rightLb.textAttributString(font: UIFont.systemFont(ofSize: 18), textColor: ColorExtension().rightGreen, lineSpace: 15, text: "celebrate your birthday with your friend")
            if self.checkRight() {
                checkImage.image = UIImage.init(named: "dict_tickgreen")
                CommonViewTool.addPriceView(checkImage, self.view, self.disposeBag)
            } else {
                checkImage.image = UIImage.init(named: "dict_crossred")
            }
                checkImage.isHidden = false
                tryAgainBtn.isHidden = false
        }
        
    }
    func checkRight() -> Bool {
         var isRight = true
        for btn in self.tagSourceButton {
            if btn.model?.selected != btn.model?.number {
                btn.errorState()
                isRight = false
            }
        }
        
        return isRight
    }
    @objc func tryAgainAction(_ sender:UIButton) {
       
        for btn in self.tagSourceButton {
            btn.model?.selected = nil
            btn.normalState()
        }
        checkImage.isHidden = true
        tryAgainBtn.isHidden = true
        rightLb.isHidden = true
        rightDesc.isHidden = true
        
        
    }
    @objc func answerAction(_ sender:CommbinButton) {
        
        
    }
    
        /// 根据文字计算宽度
        ///
        /// - Parameters:
        ///   - text: 文本内容
        ///   - font: 字体
        ///   - height: 高度
        /// - Returns: 宽度
        func textWidth(text:String,font:UIFont,height:CGFloat) -> CGFloat {
            if text.isEmpty {
                return 0
            }
            let textView = UITextView()
            textView.text = text
            textView.font = font
            let size = textView.sizeThatFits(CGSize.init(width: CGFloat(MAXFLOAT), height: height))
            return size.width
        }
        
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(_ object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}
