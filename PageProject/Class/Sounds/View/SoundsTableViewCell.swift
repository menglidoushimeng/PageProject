//
//  SoundsTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/11/27.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

enum CellTagColor:String {
    case gloden = "dict_trianglegolden"
    case glodenDark = "dict_trianglegoldendark"
    case gray = "dict_trianglegray"
    case grayDark = "dict_trianglegraydark"
    case green = "dict_trianglegreen"
    case greenDark = "dict_trianglegreendark"
    case red = "dict_trianglered"
    case redDark = "dict_trianglereddark"
}

class SoundsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tagImageView: UIImageView!
    
    @IBOutlet weak var priceLb: UILabel!
    
    @IBOutlet weak var englishLb: UILabel!
    
    @IBOutlet weak var chineseLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var cellColor:CellTagColor = .green {
        didSet {
            self.tagImageView.image = UIImage.init(named: cellColor.rawValue)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
