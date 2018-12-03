//
//  ShareRecordView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/12/3.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

@objc protocol ShareRecordViewDelegate {
    func shareAchievementFunc()
}

class ShareRecordView: UIView {

    @IBOutlet weak var headBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    weak var delegate:ShareRecordViewDelegate?
    @IBAction func shareAchievementAction(_ sender: UIButton) {
        delegate?.shareAchievementFunc()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
