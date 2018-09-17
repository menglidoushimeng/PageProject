//
//  BookTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/14.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

enum BookCellType {
    case unLoad // 未下载
    case load // 已下载
}

// cell的类型
class BookTableViewCell: UITableViewCell {
    var index:IndexPath?
    var cellType:BookCellType = .unLoad {
        didSet {
            if cellType == .unLoad {
                downBtn.isHidden = false
                rightArrowImageV.isHidden = true
                practiseImageV.isHidden = true
                unitNameLb.textColor = UIColor.init(red: 99/255.0, green:99/255.0, blue:  99/255.0, alpha: 1)
            } else {
                downBtn.isHidden = true
                rightArrowImageV.isHidden = false
                practiseImageV.isHidden = false
                 unitNameLb.textColor = UIColor.black
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    
    @IBOutlet weak var unitNameLb: UILabel!
    @IBOutlet weak var courseLb: UILabel!
    @IBOutlet weak var wordcountLb: UILabel!
    @IBOutlet weak var phrasetcountLb: UILabel!
    @IBOutlet weak var sentencecountLb: UILabel!
    @IBOutlet weak var paragraphcountLb: UILabel!
 
    @IBOutlet weak var downBtn: UIButton!
    @IBOutlet weak var rightArrowImageV: UIImageView!
    @IBOutlet weak var practiseImageV: UIImageView!
    
    var cellDownLoadBlock = {(index:IndexPath) in}
    
    @IBAction func downLoadAction(_ sender: UIButton) {
        cellDownLoadBlock(index!) // 点击下载按钮
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
