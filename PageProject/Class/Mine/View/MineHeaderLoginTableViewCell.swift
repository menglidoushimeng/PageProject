//
//  MineHeaderLoginTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/26.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class MineHeaderLoginTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var headImgView: UIImageView!
    @IBOutlet weak var nickNameLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewSetting()
        // Initialization code
    }
    func viewSetting() {
        headImgView.layer.cornerRadius = UIScreen.main.bounds.size.width / 8;
        headImgView.layer.borderWidth = 1;
        headImgView.layer.borderColor = UIColor.white.cgColor
        shadowView.layer.cornerRadius = UIScreen.main.bounds.size.width / 8;
        shadowView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        shadowView.layer.shadowOffset = CGSize.init(width: 0, height: 10)
        shadowView.layer.shadowOpacity = 0.2;
        shadowView.layer.shadowRadius = 5

        shadowView.layer.shadowColor = UIColor.init(red: 0, green: 101/255.00, blue: 231/255.00, alpha: 0.6).cgColor
        
//        shadowView.layer.shadowOffset = CGSize.init(width: 0, height: 15)
//        shadowView.layer.shadowOpacity = 0.4;

    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
