//
//  CommbinButton.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/11/20.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

class CommbinButton: UIButton {

    var model:CommbinationModel?
    
    var errorAttribut:NSAttributedString?
    func errorState()  {
        self.isSelected = false
        if errorAttribut == nil {
              errorAttribut =  self.titleLabel?.errorLine(font: UIFont.systemFont(ofSize: 18), textColor: ColorExtension().errorOrange, lineSpace: 0, text:  self.model?.title ?? "", lineColor: ColorExtension().errorOrange)
        }
    
        self.setAttributedTitle(errorAttribut, for: .normal)
    }
    func normalState() {
        self.isSelected = false
        self.isUserInteractionEnabled = true
        self.setAttributedTitle(nil, for: .normal)
    }
   
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
