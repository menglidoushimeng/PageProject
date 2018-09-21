//
//  WordSectionTableViewCell.swift
//  PageProject
//
//  Created by tiao on 2018/9/15.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class WordSectionTableViewCell: UITableViewCell {

    var sectionNameLab = UILabel()
    var wordView = ImageTitleView()
    var sentenceView = ImageTitleView()
    var keySentenceView = ImageTitleView()
    var textView = ImageTitleView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  initView(){
        let viewWidth = UIScreen.main.bounds.width
       
        self.addSubview(sectionNameLab)
        sectionNameLab.text = "section"
        sectionNameLab.font = UIFont.boldSystemFont(ofSize: 13)
        sectionNameLab.textColor = UIColor.lightGray
        sectionNameLab.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(5)
            make.top.equalTo(self).offset(10)
        }
       
        self.addSubview(wordView)
        wordView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(55)
            make.top.equalTo(self.snp.top).offset(15)
            make.width.equalTo((viewWidth-100)/2)
            make.height.equalTo(120)
        }
        wordView.showImage = UIImage.init(named: "dict_playtext")!
        wordView.titleText = "单词"
        wordView.descText = "38/400"
        wordView.proportion = 38.000/400
     
        self.addSubview(sentenceView)
        sentenceView.snp.makeConstraints { (make) in
            make.left.equalTo(wordView.snp.right)
            make.width.equalTo(wordView.snp.width)
            make.height.equalTo(wordView.snp.height)
            make.centerY.equalTo(wordView.snp.centerY)
        }
        sentenceView.showImage = UIImage.init(named: "dict_playtext")!
        sentenceView.titleText = "短语"
        sentenceView.descText = "16/152"
        sentenceView.proportion = 16.000/152
        
        
        self.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-5)
            make.top.equalTo(wordView.snp.bottom).offset(10)
            make.width.equalTo(wordView.snp.width)
            make.height.equalTo(wordView.snp.height)
        }
        textView.showImage = UIImage.init(named: "dict_playtext")!
        textView.titleText = "课文"
        textView.descText = "4/24"
        textView.proportion = 4.000/24
        
        
        self.addSubview(keySentenceView)
        keySentenceView.snp.makeConstraints { (make) in
            make.right.equalTo(textView.snp.left)
            make.centerY.equalTo(textView.snp.centerY)
            make.width.equalTo(wordView.snp.width)
            make.height.equalTo(wordView.snp.height)
        }
        keySentenceView.showImage = UIImage.init(named: "dict_playtext")!
        keySentenceView.titleText = "重点句型"
        keySentenceView.descText = "4/95"
        keySentenceView.proportion = 4.000/95
      
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
