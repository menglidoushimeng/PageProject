//
//  SelectedSectencesFooter.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/12/17.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

class SelectedSectencesFooter: UIView {
    @IBOutlet weak var tryAgainSender: UIButton!
    
    var tryAgainBlock = {() -> ()  in }
    @IBAction func tryAgainAction(_ sender: UIButton) {
        tryAgainBlock()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
