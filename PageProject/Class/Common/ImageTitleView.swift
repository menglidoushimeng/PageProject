//
//  ImageTitleView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/13.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
class ImageTitleView: UIView {
    
    
    
   // 标题内容
   var titleText:String {
        set {

            titleLb.text = newValue
            if (titleLb.text?.isEmpty)! {
                titleLb.text = " "
            }
        } get {
            return titleLb.text!
        }
    }
    // 描述内容
    var descText:String {
        set {
            
           descLb.text = newValue
            if (descLb.text?.isEmpty)! {
                descLb.text = " "
            }
        } get {
            return descLb.text!
        }
    }
    // 显示图片
    var showImage:UIImage {
        set {
            imageView.image = newValue
        } get {
            return imageView.image!
        }
    }
    // 蒙层比例
    var proportion:CGFloat { // 0 ~ 1
        set {
            proportionNum = newValue
            if proportionNum > 1 {
               proportionNum = 1
            }
            if proportionNum < 0  {
                proportionNum = 0
            }
            self.layoutIfNeeded()
        } get {
            return  proportionNum
        }
    }
    var btnEnable:Bool { // default is true
        set {
            tapBtn.isUserInteractionEnabled = newValue
        }
        get {
            return tapBtn.isUserInteractionEnabled
        }
    }
    
    var viewTag:NSInteger = 0
    
    private var imageView = UIImageView()
    private var titleLb = UILabel()
    private var descLb = UILabel()
    private var imageLayer = CAShapeLayer()
    private var proportionNum:CGFloat = 0.00
    private var tapBtn = UIButton()
    
    var btnAction = {
        (tag:NSInteger) -> ()
       in
        
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.viewSetting()
    }
    
    private func viewSetting() {
        self.addSubview(tapBtn)
        
        _ = tapBtn.rx.tap.subscribe(onNext:{
             self.btnAction(self.viewTag)
            
        })
        tapBtn.snp.makeConstraints { (make) in
            make.top.left.width.bottom.equalToSuperview()
        }
        tapBtn.backgroundColor = UIColor.clear
        tapBtn.setTitle("", for: .normal)
        self.addSubview(imageView)
        self.addSubview(titleLb)
        imageView.image = UIImage.init(named: "dict_unitdo")
        imageView.contentMode = .scaleAspectFit
        titleLb.text = "Title";
        titleLb.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        titleLb.textColor =  ColorExtension().largeGray
        titleLb.textAlignment = NSTextAlignment.center
        descLb.text = "desc"
        descLb.textAlignment = NSTextAlignment.center
        descLb.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        descLb.textColor = ColorExtension().smallGray
        self.addSubview(descLb)
        descLb.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
            make.height.greaterThanOrEqualTo(10)
        }
        titleLb.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(descLb.snp.top).offset(-2)
            make.height.greaterThanOrEqualTo(15)
        }
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalTo(titleLb.snp.top).offset(-5)
            make.centerX.equalToSuperview()
            make.width.lessThanOrEqualTo(self.snp.width)
        }
        
        imageView.layer.addSublayer(imageLayer)
        imageLayer.frame = CGRect.zero
        imageLayer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        self.imageView.layer.addSublayer(imageLayer)
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageViewFrame = imageView.frame
        imageLayer.frame = CGRect.init(x: 0, y: 0, width: imageViewFrame.size.width, height: imageViewFrame.size.height * (1 - proportionNum))
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
