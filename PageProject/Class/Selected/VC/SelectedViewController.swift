//
//  SelectedViewController.swift
//  PageProject
//
//  Created by 汪文浩 on 2018/11/12.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


enum ViewStatesEmum {
    case viewStateUnAnswer /// 没有答题
    case viewStateDidAnswer /// 已经答题
}
enum AnswerEnum:NSInteger {
    case A = 0
    case B = 1
    case C = 2
    case D = 3
}
enum SelectedStates {
    case statesNormal /// 普通项
    case statesRightUnselected /// 正确项未选择
    case statesRight /// 正确项
    case statesError /// 错误项
}

class SelectedViewController: RootUnNaviProgressBarViewController {

    @IBOutlet weak var titleLb: UILabel!
    
    @IBOutlet weak var answerALb: UILabel!
    @IBOutlet weak var answerAImg: UIImageView!
    
    @IBOutlet weak var answerBLb: UILabel!
    @IBOutlet weak var answerBImg: UIImageView!
    
    @IBOutlet weak var answerCLb: UILabel!
    @IBOutlet weak var answerCImg: UIImageView!
    
    @IBOutlet weak var answerDLb: UILabel!
    @IBOutlet weak var answerDImg: UIImageView!
    
    @IBOutlet weak var tryAgainBtn: UIButton!
    
    
    @IBOutlet weak var errorBgImg: UIImageView!
    @IBOutlet weak var errorMsg: UILabel!
    
    
    var rightAnswer:AnswerEnum?
    var selectedAnswer:AnswerEnum?
    var answerStates:ViewStatesEmum = .viewStateUnAnswer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightAnswer = .A
        // Do any additional setup after loading the view.
    }
    @IBAction func tryAgainAction(_ sender: UIButton) {
        tryAgainBtn.isHidden = true;
        errorMsg.isHidden = true
        errorBgImg.isHidden = true
        self.viewStateBackUnAnswer(lb: answerALb, image: answerAImg,textColor:ColorExtension().questionSnowBlue)
        self.viewStateBackUnAnswer(lb: answerBLb, image: answerBImg,textColor:ColorExtension().questionSkyBlue)
        self.viewStateBackUnAnswer(lb: answerCLb, image: answerCImg,textColor:ColorExtension().questionGold)
        self.viewStateBackUnAnswer(lb: answerDLb, image: answerDImg,textColor:ColorExtension().questionBlue)
        answerStates = .viewStateUnAnswer
    }
    func viewStateBackUnAnswer(lb:UILabel,image:UIImageView,textColor:UIColor) {
        lb.attributedText = NSAttributedString.init(string: lb.text!, attributes: [NSAttributedStringKey.foregroundColor:textColor])
        image.isHidden = true
    }
    @IBAction func selectedAnswerAction(_ sender: UIButton) {
        if answerStates == .viewStateUnAnswer {
            answerStates = .viewStateDidAnswer
            selectedAnswer = AnswerEnum(rawValue: sender.tag)
            if selectedAnswer != rightAnswer {
                tryAgainBtn.isHidden = false
                errorMsg.isHidden = false
                errorBgImg.isHidden = false
            }
            
            self.updateViewStates(state: self.stateReturn(answer: .A), lb: answerALb, image: answerAImg)
            self.updateViewStates(state: self.stateReturn(answer: .B), lb: answerBLb, image: answerBImg)
            self.updateViewStates(state: self.stateReturn(answer: .C), lb: answerCLb, image: answerCImg)
            self.updateViewStates(state: self.stateReturn(answer: .D), lb: answerDLb, image: answerDImg)
        }
        
    }
    func stateReturn(answer:AnswerEnum) -> SelectedStates {
        if answer != selectedAnswer && answer != rightAnswer {
            return .statesNormal
        } else if (answer != selectedAnswer && answer == rightAnswer) {
            return .statesRightUnselected
        } else if (answer == selectedAnswer && answer == rightAnswer) {
            return .statesRight
        } else {
            return .statesError
        }
    }
    func updateViewStates(state:SelectedStates,lb:UILabel,image:UIImageView) {
        
        switch state {
        case .statesNormal:
            do {
                lb.attributedText = NSAttributedString.init(string: lb.text!, attributes: [NSAttributedStringKey.foregroundColor:ColorExtension().whiteGray])
                image.isHidden = true
            }
        break;
        case .statesRightUnselected:
            do {
                lb.attributedText = NSAttributedString.init(string: lb.text!, attributes: [NSAttributedStringKey.foregroundColor:ColorExtension().rightGreen])
                image.isHidden = true
            }
            break;
        case .statesRight:
            do {
               CommonViewTool.addPriceView(image, self.view, disposeBag)
                lb.attributedText = NSAttributedString.init(string: lb.text!, attributes: [NSAttributedStringKey.foregroundColor:ColorExtension().rightGreen])
                image.isHidden = false
                image.image = UIImage.init(named: "dict_tickgreen")
        }
        break;
        case .statesError:
            do {
                
                lb.attributedText = NSAttributedString.init(string: lb.text!, attributes: [NSAttributedStringKey.baselineOffset:(0),NSAttributedStringKey.foregroundColor:ColorExtension().errorOrange,NSAttributedStringKey.strikethroughColor:ColorExtension().errorOrange,NSAttributedStringKey.strikethroughStyle:NSUnderlineStyle.styleSingle.rawValue])
                image.isHidden = false
                image.image = UIImage.init(named: "dict_crossred")
        }
        break;
        }
        
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


