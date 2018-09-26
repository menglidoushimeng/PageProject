//
//  ShareCommonView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/25.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

enum ShareActionStyle {
    case qq
    case qzone
    case wechat
    case moments
    case cancel
}


class ShareCommonView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewSetting()
    }
    
    func viewSetting () {
        self.qqBtn.layer.cornerRadius = 5;
        self.qzoneBtn.layer.cornerRadius = 5;
        self.wechatBtn.layer.cornerRadius = 5;
        self.momentsBtn.layer.cornerRadius = 5;
    }
    
    @IBOutlet weak var qqBtn: UIButton!
    @IBOutlet weak var qzoneBtn: UIButton!
    @IBOutlet weak var wechatBtn: UIButton!
    @IBOutlet weak var momentsBtn: UIButton!
    
    var shareActionStyle =  { (style:ShareActionStyle) -> () in
    
    }
    
    @IBAction func qqShareAction(_ sender: UIButton) {
        shareActionStyle(.qq)
    }
    @IBAction func qzoneShareAction(_ sender: UIButton) {
        shareActionStyle(.qzone)
    }
    @IBAction func wechatShareAction(_ sender: UIButton) {
        shareActionStyle(.wechat)
    }
    @IBAction func momentsShareAction(_ sender: UIButton) {
        shareActionStyle(.moments)
    }
    @IBAction func cancelShareAction(_ sender: UIButton) {
        shareActionStyle(.cancel)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
