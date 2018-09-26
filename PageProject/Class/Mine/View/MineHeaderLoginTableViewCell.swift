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
//        headImgView.layer.shadowOffset = CGSize.init(width: 5, height: 5)
      //  headImgView.layer.shadowRadius = 15
        shadowView.layer.shadowOffset = CGSize.init(width: 0, height: 10)
        shadowView.layer.shadowOpacity = 1;
        shadowView.layer.shadowRadius = 10

    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
