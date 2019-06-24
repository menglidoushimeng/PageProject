//
//  WriteSentenceViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/2/12.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit
enum keyBoardType {
    case normal
    case small
}
enum textViewType {
    case normal
    case custom
}
private let TEXTVIEW_ONELINE_HEIGHT:CGFloat = 48
private let TEXTVIEW_HEIGHT:CGFloat = 96

class WriteSentenceViewController: RootUnNaviProgressBarViewController  {
    init(keyBoardType:keyBoardType,textViewType:textViewType) {
        super.init(nibName: nil, bundle: nil)
        self.keyBoardType = keyBoardType
        self.textViewType = textViewType
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLb = UILabel()
    private var keyBoardType:keyBoardType = .normal
    private var textViewType:textViewType = .normal
    private var rightAnswer:String?
    private let checkImage = UIImageView()
    private let tryAgainBtn = UIButton()
    private let rightLb = UILabel()
    private let rightDesc = UILabel()
    private let textFont:UIFont =  UIFont.init(name: "CourierNewPSMT", size: 18)!
    private var changeText = ""
    
    lazy var keyboardSmallView : ZMKeyBoardSmallView = {
        let object = ZMKeyBoardSmallView()
        return object
    }()
    lazy var keyboardView : ZMKeyBoardView = {
        let object = ZMKeyBoardView()
        return object
    }()
    
   
    let titleLine = UIView()
    let answerSentencesTextView:CustomUITextView = CustomUITextView()
    let answerTextView:RootTextView = RootTextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        self.viewLayer(lineView: titleLine, lineColor: ColorExtension().lineGray)
       
    }
    @objc func didBecomeActiveKeyBoardRefresh() {
        if self.textViewType == .normal && self.answerSentencesTextView.isEditCheck() {
            answerSentencesTextView.beginEdit()
        } else if self.textViewType == .custom && answerTextView.isUserInteractionEnabled == true{
            answerTextView.becomeFirstResponder()
        }
    }
    override func viewSetting() {
        super.viewSetting()
    
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActiveKeyBoardRefresh), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        
        let keyBoardHeight = self.keyboardView.totalHeight
        self.view.addSubview(titleLine)
        titleLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.safe.snp.left).offset(10)
            make.right.equalTo(self.safe.snp.right).offset(-10)
            make.bottom.equalTo(self.safe.snp.bottom).offset(-keyBoardHeight)
            make.height.equalTo(1)
        }
        
        
        
       
        if textViewType == .normal {
            self.viewSettingTextView(textView: answerTextView,TEXTVIEW_ONELINE_HEIGHT)
            self.keyBoardSettingView(textView: answerTextView)
            answerTextView.isScrollEnabled = false
            answerTextView.tintColor = ColorExtension().audioBlue
            answerTextView.font = textFont
            answerTextView.textColor = ColorExtension().largeGray
            answerTextView.becomeFirstResponder()
            answerTextView.delegate = self
            self.rightAnswer = "you are great"
        } else {
            answerSentencesTextView.placeHolder = "*** eee *** ooo ***"
            self.viewSettingTextView(textView: answerSentencesTextView,TEXTVIEW_HEIGHT)
            self.keyBoardSettingView(textView: answerSentencesTextView)
            answerTextView.font = textFont
            answerSentencesTextView.beginEdit()
            answerSentencesTextView.delegate = self
             self.rightAnswer = "aaa eee iii ooo uuu"
        }
        
        self.view.addSubview(titleLb)
        titleLb.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.turnBackBtn.snp.bottom)
            make.bottom.equalTo(self.titleLine.snp.top).offset(-TEXTVIEW_HEIGHT)
        }
        titleLb.textAlignment = .center
        titleLb.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0))
        titleLb.textColor = ColorExtension().largeGray
        titleLb.text = "和你的朋友庆祝你的生日"
        
        
        self.view.addSubview(rightLb)
        rightLb.textColor = ColorExtension().rightGreen
        rightLb.font = UIFont.systemFont(ofSize: 18)
        rightLb.snp.makeConstraints { (make) in
            make.left.equalTo(self.safe).offset(15)
            make.centerX.equalTo(self.safe.snp.centerX)
            make.top.equalTo(titleLine.snp.bottom).offset(36)
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
        rightDesc.textAlignment = .center
        rightDesc.numberOfLines = 0
        
        self.view.addSubview(checkImage)
        checkImage.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.titleLine.snp.bottom)
            make.right.equalTo(self.safe)
            make.width.height.equalTo(60)
        }
        checkImage.isHidden = true
        
        tryAgainBtn.setImage(UIImage.init(named: "dict_retry"), for: .normal)
        self.view.addSubview(tryAgainBtn)
        tryAgainBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.safe)
            make.right.equalTo(self.safe)
        }
        tryAgainBtn.isHidden = true
        tryAgainBtn.addTarget(self, action: #selector(tryAgainAction(_:)), for: .touchDown)
        
        
        
        
    }
    func viewSettingTextView(textView:UITextView, _ height:CGFloat) {
        self.view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.left.equalTo(self.safe).offset(10)
            make.right.equalTo(self.safe).offset(-10)
            make.bottom.equalTo(titleLine.snp.top).offset(-10)
            make.height.equalTo(height)
        }
      
    }
    
    func keyBoardSettingView(textView:UITextView) {
        if keyBoardType == .normal {
            textView.inputView = keyboardView
            keyboardView.delegate = self
            if textViewType == .normal {
                keyboardView.inputSource = textView
            } else {
                keyboardView.inputSource = nil
            }
        } else {
            textView.inputView = keyboardSmallView
            keyboardSmallView.delegate  = self
            if textViewType == .normal {
                keyboardSmallView.inputSource = textView
            } else {
                keyboardSmallView.inputSource = nil
            }
        }
    }
    func examine() -> Bool {
        if textViewType == .normal {
            if answerTextView.text == rightAnswer {
                return true
            } else {
                return false
            }
        } else {
            if answerSentencesTextView.attributedText.string == rightAnswer {
                return true
            } else {
                return false
            }
        }
    }
    @objc func tryAgainAction(_ sender:UIButton) {
        answerTextView.isUserInteractionEnabled  = true
        if textViewType == .normal {
            answerTextView.text = ""
            answerTextView.becomeFirstResponder()
            self.answerTextView.snp.updateConstraints { (make) in
                make.height.equalTo(TEXTVIEW_ONELINE_HEIGHT)
            }
        } else {
            answerSentencesTextView.tryAgainView()
        }
        checkImage.isHidden = true
        tryAgainBtn.isHidden = true
        rightLb.isHidden = true
        rightDesc.isHidden = true
        
        
    }
    func exampleRightAnswer() {
        if textViewType == .normal {
                rightLb.textAttributString(font: UIFont.init(name: "CourierNewPSMT", size: 18)!, textColor: ColorExtension().rightGreen, lineSpace: 20, text: "celebrate your birthday with your friend")
            rightDesc.isHidden = true
        } else {
            let rightText = NSMutableAttributedString.init(string: "sym", attributes: [NSAttributedStringKey.foregroundColor:ColorExtension().smallGray,NSAttributedStringKey.font:UIFont.init(name: "CourierNewPSMT", size: 20)!])
            let verText = NSAttributedString.init(string: "pa", attributes: [NSAttributedStringKey.foregroundColor:ColorExtension().audioBlue,NSAttributedStringKey.font:UIFont.init(name: "CourierNewPSMT", size: 20)!])
            let inText = NSAttributedString.init(string: "the", attributes: [NSAttributedStringKey.foregroundColor:ColorExtension().smallGray,NSAttributedStringKey.font:UIFont.init(name: "CourierNewPSMT", size: 20)!])
            let dusText = NSAttributedString.init(string: "ti", attributes: [NSAttributedStringKey.foregroundColor:ColorExtension().audioBlue,NSAttributedStringKey.font:UIFont.init(name: "CourierNewPSMT", size: 20)!])
            let triText = NSAttributedString.init(string: "cal", attributes: [NSAttributedStringKey.foregroundColor:ColorExtension().smallGray,NSAttributedStringKey.font:UIFont.init(name: "CourierNewPSMT", size: 20)!])
            let alText = NSAttributedString.init(string: "ly", attributes: [NSAttributedStringKey.foregroundColor:ColorExtension().audioBlue,NSAttributedStringKey.font:UIFont.init(name: "CourierNewPSMT", size: 20)!])
        
            rightText.append(verText)
            rightText.append(inText)
            rightText.append(dusText)
            rightText.append(triText)
            rightText.append(alText)
       
            
            rightLb.attributedText = rightText
            rightLb.textAlignment = .center
            rightDesc.text = "/,sɪmpə’θetɪklɪ/"
        }
        
       
    }
    @objc fileprivate func getStringPlaceSize(_ string : String, _ textFont : UIFont, _ textView:UITextView) -> CGSize {
        ///计算文本高度
        let attribute = [NSAttributedStringKey.font : textFont];
        let options = NSStringDrawingOptions.usesLineFragmentOrigin
        let size = string.boundingRect(with: CGSize(width: textView.contentSize.width-10, height: CGFloat.greatestFiniteMagnitude), options: options, attributes: attribute, context: nil).size
        return size
    }
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
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
extension WriteSentenceViewController:KeyBoardDelegate,UITextViewDelegate {
    func keyBoardTap(_ key: String) {
        answerSentencesTextView.appendString(str: key)
    }
    
    func returnTap() {
        answerTextView.resignFirstResponder()
        answerTextView.isUserInteractionEnabled  = false
        answerSentencesTextView.endEdit()
        self.exampleRightAnswer()
        if self.examine() {
            checkImage.image = UIImage.init(named: "dict_tickgreen")
            tryAgainBtn.isHidden = true
            CommonViewTool.addPriceView(checkImage, self.view, self.disposeBag)
        } else {
            checkImage.image = UIImage.init(named: "dict_crossred")
            tryAgainBtn.isHidden = false
        }
            checkImage.isHidden = false
            self.rightLb.isHidden = false
            self.rightDesc.isHidden  = false
    }
    
    func deleteTap() {
        answerSentencesTextView.deleteStr()
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        changeText = text
        return true
    }
    func textViewDidChange(_ textView: UITextView) {
        if textView == answerTextView {
            let  paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 20
            textView.attributedText = NSAttributedString.init(string: textView.text, attributes: [NSAttributedStringKey.font:textView.font as Any,NSAttributedStringKey.foregroundColor:textView.textColor as Any,NSAttributedStringKey.paragraphStyle:paragraphStyle])
        }
        let size = getStringPlaceSize(textView.text, textView.font!, textView)
        let height = textView.font!.lineHeight * 2 + 20
        if (size.height > height) {
            textView.text = (textView.text as NSString).substring(to: textView.text.count - changeText.count)
            print("Maximum number of lines");
        }
        if size.height >  textView.font!.lineHeight + 20 {
            self.answerTextView.snp.updateConstraints { (make) in
                make.height.equalTo(TEXTVIEW_HEIGHT)
            }
            
        } else {
            self.answerTextView.snp.updateConstraints { (make) in
                make.height.equalTo(TEXTVIEW_ONELINE_HEIGHT)
            }

        }
        
    }
}

