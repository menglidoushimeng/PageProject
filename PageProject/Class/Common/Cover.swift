//
//  Cover.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/25.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

typealias coverBlock = () -> ();

class Cover: UIView {
    
    var coverTouch:coverBlock = {() -> () in }
    var coverTouchSelf:Bool = true
    
    
    init(frame: CGRect, block:@escaping coverBlock,color:UIColor,removeSelf:Bool) {
        super.init(frame: frame)
        coverTouch = block
        self.backgroundColor = color;
        coverTouchSelf = removeSelf
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(coverTouchAction(tap:)))
        self.addGestureRecognizer(tap)
    }
    @objc func coverTouchAction(tap:UITapGestureRecognizer) {
        if coverTouchSelf {
            self.removeFromSuperview()
        }
        coverTouch();
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
