//
//  ShareRecordDetail.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/12/3.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

class ShareRecordDetail: UIView {

    @IBOutlet weak var headerImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        headerImg.layer.borderWidth = 2
//        headerImg.layer.borderColor = UIColor.white.cgColor
//        headerImg.layer.cornerRadius = 26
    }
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        self.removeFromSuperview()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
