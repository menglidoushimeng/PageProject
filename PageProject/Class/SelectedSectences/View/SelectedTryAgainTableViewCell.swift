//
//  SelectedTryAgainTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/12/14.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

class SelectedTryAgainTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var tryAgainSender: UIButton!

    var tryAgainBlock = {() -> ()  in }
    @IBAction func tryAgainAction(_ sender: UIButton) {
        tryAgainBlock()
    }
    
}
