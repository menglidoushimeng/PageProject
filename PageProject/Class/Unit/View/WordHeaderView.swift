//
//  WordHeaderView.swift
//  PageProject
//
//  Created by tiao on 2018/9/15.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

@objc protocol HeaderViewDelegate {
    func turnBackAction();
    func shareAction()
}

class WordHeaderView: UIView {
    
    var listenView = ImageTitleView()
    var wordView = ImageTitleView()
    var phraseView = ImageTitleView()
    
    var contentView = UIView()
    var bottomLineView = UIView()
    
    var turnBackBtn = UIButton()
    var shareBtn = UIButton()
    
    weak var delegate:HeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        createView()
    }
    
    func createView(){
        self.backgroundColor = UIColor.white
        let screenW = UIScreen.main.bounds.width
        
        self.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
       
    
        contentView.addSubview(turnBackBtn)
        turnBackBtn.setImage(UIImage.init(named: "dict_grayroundreturn"), for: .normal)
        turnBackBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(ScreenBounsConfig().isIphoneXHeight(height: 20))
            make.height.width.equalTo(36)
        }
        turnBackBtn.addTarget(self, action: #selector(backAction(_:)), for: .touchUpInside)
        
        contentView.addSubview(shareBtn)
        shareBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(turnBackBtn.snp.top)
            make.width.equalTo(57)
            make.height.equalTo(36)
        }
        shareBtn.setImage(UIImage.init(named: "dict_grayroundshare"), for: .normal)
        shareBtn.setTitleColor(UIColor.black, for: .normal)
        shareBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        shareBtn.addTarget(self, action:#selector(shareAction(_:)), for:.touchUpInside)
        
        
 
        contentView.addSubview(listenView)
        contentView.backgroundColor = UIColor.white
        listenView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(ScreenBounsConfig().NAVIGATIONBAR_HEIGHT)
            make.bottom.equalTo(contentView.snp.bottom)
            make.width.equalTo(screenW/3)
        }
        listenView.showImage = UIImage.init(named: "dict_playtext")!
        listenView.titleText = "听课文"
        listenView.descText = " "
        listenView.proportion = 1
        
        contentView.addSubview(wordView)
        wordView.snp.makeConstraints { (make) in
            make.left.equalTo(listenView.snp.right)
            make.top.equalToSuperview().offset(ScreenBounsConfig().NAVIGATIONBAR_HEIGHT)
            make.bottom.equalToSuperview()
            make.width.equalTo(listenView.snp.width)
            make.height.equalTo(listenView.snp.height)
        }
        wordView.showImage = UIImage.init(named: "dict_wordcard")!
        wordView.titleText = "单词"
        wordView.descText = "38/400"
        wordView.proportion = 38.000/400
        
        contentView.addSubview(phraseView)
        phraseView.snp.makeConstraints { (make) in
            make.left.equalTo(wordView.snp.right)
            make.top.equalToSuperview().offset(ScreenBounsConfig().NAVIGATIONBAR_HEIGHT)
            make.right.equalTo(self)
            make.bottom.equalToSuperview()
            make.width.equalTo(wordView.snp.width)
            make.height.equalTo(listenView.snp.height)
        }
        phraseView.showImage = UIImage.init(named: "dict_phrasecard")!
        phraseView.titleText = "短语"
        phraseView.descText = "12/200"
        phraseView.proportion = 12/200
       
        self.addSubview(bottomLineView)
        bottomLineView.backgroundColor = ColorExtension().lineGray
        bottomLineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(2)
        }
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //分享按钮点击事件
    @objc func shareAction(_ button:UIButton) {
        delegate?.shareAction()
    }
    
    //返回按钮点击事件
    @objc func backAction(_ button:UIButton){
        delegate?.turnBackAction()
    }
}
