//
//  UnitSelectedView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/10/23.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

@objc protocol UnitSelectedViewDelegate {
    func didSelectedUnit(_ index:NSInteger,_ model:UnitSelectedModel)
}

class UnitSelectedView: UIView {

    init(frame: CGRect,selectedModels:Array<UnitSelectedModel>) {
        super.init(frame: frame)
        self.customActionView(selectedModels)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate:UnitSelectedViewDelegate?
    
    func customActionView(_ selectedModels:Array<UnitSelectedModel>) {
        
        if selectedModels.count > 5 {
            return
        }
        let screenWidth = UIScreen.main.bounds.size.width
        let floatCount = CGFloat(selectedModels.count)
        var buttonWidth:CGFloat = 0
        if floatCount > 0 {
            buttonWidth = screenWidth / floatCount
        }
        self.backgroundColor = ColorExtension().bottomGray
        for (index,model) in selectedModels.enumerated() {
            let buttonView = Bundle.main.loadNibNamed("UnitSelectedButtonView", owner: self, options: nil)?.first as! UnitSelectedButtonView
            buttonView.model = model
            buttonView.backgroundColor = ColorExtension().bottomGray
            self.addSubview(buttonView)
            let floatIndex = CGFloat(index)
            buttonView.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(screenWidth  / floatCount * floatIndex)
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(buttonWidth)
            }
            buttonView.actionBlock = {() -> () in
                
                self.delegate?.didSelectedUnit(index, model)
            }
            
        }
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
