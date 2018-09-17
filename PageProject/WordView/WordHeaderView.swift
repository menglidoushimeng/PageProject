//
//  WordHeaderView.swift
//  PageProject
//
//  Created by tiao on 2018/9/15.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class WordHeaderView: UIView {
    
    var listenView = ImageTitleView()
    var wordView = ImageTitleView()
    var phraseView = ImageTitleView()
    
    var contentView = UIView()
    var bottomLineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        createView()
    }
    
    func  createView(){
        self.backgroundColor = UIColor.lightGray
        
        let screenW = UIScreen.main.bounds.width
        
        self.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
       
        contentView.addSubview(listenView)
        contentView.backgroundColor = UIColor.white
        listenView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            make.width.equalTo(screenW/3)
        }
        listenView.showImage = UIImage.init(named: "dict_playtext")!
        listenView.titleText = "听课文"
        listenView.descText = " "
        listenView.proportion = 1
        
        self.addSubview(wordView)
        wordView.snp.makeConstraints { (make) in
            make.left.equalTo(listenView.snp.right)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(listenView.snp.width)
            make.height.equalTo(listenView.snp.height)
        }
        wordView.showImage = UIImage.init(named: "dict_playtext")!
        wordView.titleText = "单词"
        wordView.descText = "38/400"
        wordView.proportion = 38.000/400
        
        self.addSubview(phraseView)
        phraseView.snp.makeConstraints { (make) in
            make.left.equalTo(wordView.snp.right)
            make.top.equalToSuperview()
            make.right.equalTo(self)
            make.bottom.equalToSuperview()
            make.width.equalTo(wordView.snp.width)
            make.height.equalTo(listenView.snp.height)
        }
        phraseView.showImage = UIImage.init(named: "dict_playtext")!
        phraseView.titleText = "短语"
        phraseView.descText = "12/200"
        phraseView.proportion = 12/200
       
        self.addSubview(bottomLineView)
        bottomLineView.backgroundColor = UIColor.lightGray
        bottomLineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(5)
        }
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
