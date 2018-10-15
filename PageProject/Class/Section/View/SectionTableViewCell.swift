//
//  SectionTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/28.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

enum SentencesStates:NSInteger {
    case understand = 0 // 知晓
    case grasp = 1 // 掌握
}

class SectionTableViewCell: UITableViewCell {

    @IBOutlet weak var stateLb: UILabel!
    @IBOutlet weak var englishLb: UILabel!
    
    @IBOutlet weak var chineseLb: UILabel!
    
    var cellState:SentencesStates = .understand {
        didSet {
            englishLb.numberOfLines = cellState.rawValue
            chineseLb.numberOfLines = cellState.rawValue
            if cellState == .understand {
                stateLb.text = "知晓"
                stateLb.textColor = ColorExtension().rightGreen
            } else {
                stateLb.text = "掌握"
                stateLb.textColor = ColorExtension().masteryGold
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    
}
