//
//  MineTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/26.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {

    @IBOutlet weak var redImgView: UIImageView!
    @IBOutlet weak var cellImg: UIImageView!
    
    
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var descLb: UILabel!
    @IBOutlet weak var rightLb: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
