//
//  DownListTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/28.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

@objc protocol DeleteDelegate {
    @objc optional func delete(indexPath:IndexPath)
}

class DownListTableViewCell: UITableViewCell {

    @IBOutlet weak var deleteBtn: UIButton!
    var indexPath:IndexPath?
    
    weak var delegate:DeleteDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        delegate?.delete?(indexPath: indexPath!)
    }
}
