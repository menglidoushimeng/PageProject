//
//  SelectedSectencesTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/11/24.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

class SelectedSectencesTableViewCell: UITableViewCell {

    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var rightLb: UILabel!
    @IBOutlet weak var nuberButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        nuberButton.layer.cornerRadius = 5
        nuberButton.layer.borderWidth = 1
        nuberButton.layer.borderColor = ColorExtension().lineGray.cgColor
        nuberButton.layer.masksToBounds = true
        
        rightLb.layer.cornerRadius = 14
        rightLb.layer.borderWidth = 1
        rightLb.layer.borderColor = UIColor.white.cgColor
        rightLb.layer.masksToBounds = true
        // Initialization code
    }

    @IBOutlet weak var answerLb: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
