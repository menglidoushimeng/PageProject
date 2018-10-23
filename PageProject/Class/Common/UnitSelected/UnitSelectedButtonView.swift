//
//  UnitSelectedButtonView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/10/23.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class UnitSelectedButtonView: UIView {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var starImage: UIImageView!
    
    @IBOutlet weak var numberLb: UILabel!
    
    @IBOutlet weak var titleLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction(_:)))
        self.addGestureRecognizer(tap)
    }
    var model:UnitSelectedModel? {
        didSet {
            if model?.isLight == false {
//                starImage.image = UIImage.init(named: "dict_piparagraphsmalldoing")
                starImage.alpha = 0.5
                image.image = UIImage.init(named: "dict_piparagraphsmalldoing")
            }
            if model?.isStar == false {
                starImage.isHidden = true
            }
            titleLb.text = model?.titleString
            numberLb.text = model?.number
        }
    }
    
    var actionBlock = {() -> () in
        
    }
    @objc func tapAction(_ sender: UITapGestureRecognizer) {
        self.actionBlock()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
