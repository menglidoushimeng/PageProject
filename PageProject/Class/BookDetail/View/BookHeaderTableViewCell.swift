//
//  BookHeaderTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/14.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
// 

import UIKit
import SnapKit

enum HeaderTapEnum {
    case share // 分享
    case listen // 听课文
    case word // 单词
    case sentence // 短语
    case keySentence //重点句型
    case text // 课文
}

class BookHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var bookImg: UIImageView!
    @IBOutlet weak var bookNameLb: UILabel!
    
    @IBOutlet weak var bootomView: UIView!
    
    var listenView = ImageTitleView()
    var wordView = ImageTitleView()
    var sentenceView = ImageTitleView()
    var keySentenceView = ImageTitleView()
    var textView = ImageTitleView()
    var HeaderViewAction = {(acitonEnum:HeaderTapEnum) in
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewSetting()
        // Initialization code
    }
    
    func viewSetting() {
        weak var weakSelf = self
        
       
        bookImg.layer.shadowColor = UIColor.init(red: 0, green: 101/255.00, blue: 231/255.00, alpha: 0.6).cgColor
        
        bookImg.layer.shadowOffset = CGSize.init(width: 0, height: 15)
        bookImg.layer.shadowOpacity = 0.4;
        bookImg.layer.shadowRadius = 10
        bookImg.layer.borderWidth = 3
        bookImg.layer.borderColor = UIColor.white.cgColor
        
    
        
        bootomView.addSubview(listenView)
        listenView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(bootomView.snp.width).multipliedBy(0.2)
        }
        
        
        listenView.showImage = UIImage.init(named: "dict_playtextbig")!
        listenView.titleText = "听课文"
        listenView.descText = ""
        listenView.proportion = 1
        listenView.btnAction = {(tag) in
            weakSelf?.HeaderViewAction(.listen)
            
        }
        
        
        bootomView.addSubview(wordView)
        wordView.snp.makeConstraints { (make) in
            make.left.equalTo(listenView.snp.right)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(bootomView.snp.width).multipliedBy(0.2)
        }
        wordView.showImage = UIImage.init(named: "dict_piwordlistdone")!
        wordView.titleText = "单词"
        wordView.descText = "38/400"
        wordView.proportion = 38.000/400
        wordView.btnAction = {(tag) in
            weakSelf?.HeaderViewAction(.word)
            
        }
        
        bootomView.addSubview(sentenceView)
        sentenceView.snp.makeConstraints { (make) in
            make.left.equalTo(wordView.snp.right)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(bootomView.snp.width).multipliedBy(0.2)
        }
        sentenceView.showImage = UIImage.init(named: "dict_piexpressionsdone")!
        sentenceView.titleText = "短语"
        sentenceView.descText = "16/152"
        sentenceView.proportion = 16.000/152
        sentenceView.btnAction = {(tag) in
            weakSelf?.HeaderViewAction(.sentence)
            
        }
        
        bootomView.addSubview(keySentenceView)
        keySentenceView.snp.makeConstraints { (make) in
            make.left.equalTo(sentenceView.snp.right)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(bootomView.snp.width).multipliedBy(0.2)
        }
        keySentenceView.showImage = UIImage.init(named: "dict_pisentencesdone")!
        keySentenceView.titleText = "重点句型"
        keySentenceView.descText = "4/95"
        keySentenceView.proportion = 4.000/95
        keySentenceView.btnAction = {(tag) in
            weakSelf?.HeaderViewAction(.keySentence)
            
        }
        
        
        bootomView.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.left.equalTo(keySentenceView.snp.right)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(bootomView.snp.width).multipliedBy(0.2)
        }
        textView.showImage = UIImage.init(named: "dict_piparagraphsdone")!
        textView.titleText = "课文"
        textView.descText = "4/24"
        textView.proportion = 4.000/24
        textView.btnAction = {(tag) in
            weakSelf?.HeaderViewAction(.text)
            
        }
        
    }
    @IBAction func shareBtnAction(_ sender: UIButton) {
        self.HeaderViewAction(.share)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
