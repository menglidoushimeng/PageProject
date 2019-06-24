//
//  SentencePlayListTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/2/20.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class SentencePlayListTableViewCell: UITableViewCell {

    @IBOutlet weak var playBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var englishLb: UILabel!
    @IBOutlet weak var chineseLb: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
