//
//  RootAlertController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/30.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class RootAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let messageFont
            = UIFont.systemFont(ofSize: 14)
        let messageAttribute
            = NSMutableAttributedString.init(string:self.message!)
    messageAttribute.addAttributes([NSAttributedStringKey.font:messageFont,NSAttributedStringKey.foregroundColor:ColorExtension().largeGray],range:NSMakeRange(0,(self.message?.count)!))
        self.setValue(messageAttribute,forKey: "attributedMessage")
   
    }
    func addAction(_ action: UIAlertAction,_ textColor:UIColor) {
        super.addAction(action)
         action.setValue(textColor, forKey:"titleTextColor")
    }
    override func addAction(_ action: UIAlertAction) {
        super.addAction(action)
        if action.style == .cancel {
            action.setValue(ColorExtension().smallGray, forKey:"titleTextColor")
        } else {
            action.setValue(ColorExtension().wordBlue, forKey:"titleTextColor")
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
