//
//  BookTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/14.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    //单元名
    @IBOutlet weak var unitNameLab: UILabel!
    //进度
    @IBOutlet weak var courseLab: UILabel!
    //词总数
    @IBOutlet weak var wordCountLab: UILabel!
    //短语总数
    @IBOutlet weak var phraseCountLab: UILabel!
    //句子总数
    @IBOutlet weak var sentenceCountLab: UILabel!
    //段落总数
    @IBOutlet weak var paragraphCountLab: UILabel!
    //下载按钮
    @IBOutlet weak var downBtn: UIButton!
    //右箭头ImageV
    @IBOutlet weak var rightArrowImageV: UIImageView!
    //练习ImageV
    @IBOutlet weak var practiseImageV: UIImageView!
    
    var  index : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        if index/2 != 0 {
            downBtn.isHidden = true
        }else{
            rightArrowImageV.isHidden = false
            practiseImageV.isHidden = false
        }
        
    }
    
    
    
    
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
