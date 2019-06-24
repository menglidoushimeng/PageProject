//
//  UnitSetView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/3/5.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class UnitSetView: UIView {

    @IBAction func cancelAction(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    @IBAction func sureAction(_ sender: UIButton) {
        self.removeFromSuperview()
    }

    
    @IBOutlet weak var chinaBtn: UIButton!
    @IBOutlet weak var englishBtn: UIButton!
    @IBOutlet weak var chinaEnglishBtn: UIButton!
    
    
    
    @IBOutlet weak var oneTimeBtn: UIButton!
    @IBOutlet weak var threeTimeBtn: UIButton!
    @IBOutlet weak var fiveTimeBtn: UIButton!
    
    
    @IBOutlet weak var fifteenBtn: UIButton!
    @IBOutlet weak var thirtyBtn: UIButton!
    @IBOutlet weak var sixtyBtn: UIButton!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBAction func minuteAction(_ sender: UIButton) {
        self.senderSelected(sender,  [fifteenBtn,thirtyBtn,sixtyBtn])
    }
    @IBAction func timeAction(_ sender: UIButton) {
        self.senderSelected(sender,  [oneTimeBtn,threeTimeBtn,fiveTimeBtn])
    }
    @IBAction func languageAction(_ sender: UIButton) {
        self.senderSelected(sender,  [chinaBtn,englishBtn,chinaEnglishBtn])
    }
    func senderSelected(_ selectedSender:UIButton,_ senders:Array<UIButton>) {
        if selectedSender.isSelected {
            return
        }
        for sender in senders {
            if sender.isEqual(selectedSender) {
                 sender.backgroundColor = ColorExtension().wordBlue
                 sender.isSelected = true
            } else {
                 sender.backgroundColor = UIColor.white
                 sender.isSelected = false
            }
        }
     
      
    }
}
