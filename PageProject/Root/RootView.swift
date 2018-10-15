//
//  RootView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/25.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class RootView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewSetting()
    }
    var safe:UILayoutGuide {
        get {
            if #available(iOS 11.0, *) {
                return self.safeAreaLayoutGuide
            } else {
                return self.guide
            }
            
        }
    }
    
    lazy var guide:UILayoutGuide = { () -> UILayoutGuide in
        let guide = UILayoutGuide()
        self.addLayoutGuide(guide)
        guide.snp.makeConstraints({ (make) in
            make.top.bottom.left.right.equalTo(self)
        })
        return guide
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewSetting () {
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
