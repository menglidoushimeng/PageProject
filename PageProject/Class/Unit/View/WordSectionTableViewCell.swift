//
//  WordSectionTableViewCell.swift
//  PageProject
//
//  Created by tiao on 2018/9/15.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

@objc protocol WordViewCellDelegate {
    // leftBtn 判断为左边按钮还是右边按钮
    func cellDidSelected(indexPath:IndexPath, leftBtn:Bool)
}


enum WordSctionType:Int {
    // 当前页面布局情况
    case leftOneQuestionWithTitle // 具备title 并有1个点击按钮 视图靠左
    case leftTwoQuestionWithTitle // 具备title 并有2个点击按钮 视图靠左
    case leftOneQuestion // 有1个点击按钮 视图靠左
    case leftTwoQuestion // 有2个点击按钮 视图靠左
    case rightOneQuestion // 有1个点击按钮 视图靠右
    case rightTwoQuestion // 有2个点击按钮 视图靠右
}



class WordSectionTableViewCell: UITableViewCell {
    
    
    weak var delegate:WordViewCellDelegate?
    var indexPath:IndexPath = IndexPath.init(row: 0, section: 0)
    
    var sectionNameLab = UILabel()
    var wordView = ImageTitleView()
    var sentenceView = ImageTitleView()
    var cellStype:WordSctionType = .leftTwoQuestionWithTitle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  initView(){
        let viewWidth = UIScreen.main.bounds.width
        let labelHeight = (viewWidth-100)/2 * 1.2 - 46
         self.addSubview(sectionNameLab)
         self.addSubview(wordView)
        
        sectionNameLab.text = "section"
        sectionNameLab.font = UIFont.boldSystemFont(ofSize: 14)
        sectionNameLab.textColor = ColorExtension().smallGray
        sectionNameLab.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(labelHeight)
        }
       
       
        wordView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(70)
            make.top.equalTo(self.snp.top).offset(10)
            make.width.equalTo((viewWidth-90)/2.5)
            make.height.equalTo(wordView.snp.width).multipliedBy(1.1)
            make.bottom.equalToSuperview().offset(-10)
        }
        wordView.showImage = UIImage.init(named: "dict_piexpressionsknowwell")!
        wordView.titleText = "单词"
        wordView.descText = "380/400"
        wordView.proportion = 380.000/400
        wordView.btnAction = { tag in
            self.delegate?.cellDidSelected(indexPath: self.indexPath, leftBtn: true)
        }
     
        self.addSubview(sentenceView)
        sentenceView.snp.makeConstraints { (make) in
            make.left.equalTo(wordView.snp.right).offset(10)
            make.width.equalTo(wordView.snp.width)
            make.height.equalTo(wordView.snp.height)
            make.centerY.equalTo(wordView.snp.centerY)
        }
        sentenceView.showImage = UIImage.init(named: "dict_pisentenceslegendary")!
        sentenceView.titleText = "短语"
        sentenceView.descText = "150/152"
        sentenceView.proportion = 150.000/152
        sentenceView.btnAction = { tag in
            self.delegate?.cellDidSelected(indexPath: self.indexPath, leftBtn: false)
        }
      
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        switch self.cellStype {
        case .leftOneQuestionWithTitle:
            do {
                sectionNameLab.isHidden = false
                wordView.isHidden = false
                sentenceView.isHidden = true
            }
            break
        case .leftTwoQuestionWithTitle:
            do {
                sectionNameLab.isHidden = false
                wordView.isHidden = false
                sentenceView.isHidden = false
        }
            break
        case .leftOneQuestion:
            do {
                sectionNameLab.isHidden = true
                wordView.isHidden = false
                sentenceView.isHidden = true
        }
            break
        case .leftTwoQuestion:
            do {
                sectionNameLab.isHidden = true
                wordView.isHidden = false
                sentenceView.isHidden = false
        }
            break
        case .rightOneQuestion:
            do {
                sectionNameLab.isHidden = true
                wordView.isHidden = false
                sentenceView.isHidden = true
        }
            break
        case .rightTwoQuestion:
            do {
                sectionNameLab.isHidden = true
                wordView.isHidden = false
                sentenceView.isHidden = false
        }
            break
        
        }
        
        switch self.cellStype {
        case .leftOneQuestion, .leftTwoQuestion, .leftOneQuestionWithTitle, .leftTwoQuestionWithTitle:
            do {
                let viewWidth = UIScreen.main.bounds.width
                wordView.snp.remakeConstraints { (make) in
                    make.left.equalTo(self.snp.left).offset(70)
                    make.top.equalTo(self.snp.top).offset(10)
                    make.width.equalTo((viewWidth-90)/2.5)
                    make.height.equalTo(wordView.snp.width).multipliedBy(1.2)
                    make.bottom.equalToSuperview().offset(-10)
                }
                sentenceView.snp.remakeConstraints { (make) in
                        make.left.equalTo(wordView.snp.right).offset(10)
                        make.width.equalTo(wordView.snp.width)
                        make.height.equalTo(wordView.snp.height)
                        make.centerY.equalTo(wordView.snp.centerY)
                    }
               
                
            }
            break;
        case .rightOneQuestion, .rightTwoQuestion:do {
                let viewWidth = UIScreen.main.bounds.width
            sentenceView.snp.remakeConstraints { (make) in
                make.right.equalToSuperview().offset(-10)
                make.top.equalTo(self.snp.top).offset(10)
                make.width.equalTo((viewWidth-90)/2.5)
                make.height.equalTo(sentenceView.snp.width).multipliedBy(1.2)
                make.bottom.equalToSuperview().offset(-10)
                
            }
            wordView.snp.remakeConstraints { (make) in
                make.right.equalTo(sentenceView.snp.left).offset(-10)
                make.width.equalTo(sentenceView.snp.width)
                make.height.equalTo(sentenceView.snp.height)
                make.centerY.equalTo(sentenceView.snp.centerY)
            }
            
            
        }
        
    }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
