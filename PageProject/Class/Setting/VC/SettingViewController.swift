//
//  SettingViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/30.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SettingViewController: RootViewController {
    var newVersion:Bool { // 是否有新版本
        get {
            return !versionRed.isHidden
        }
        set {
            versionRed.isHidden = !newValue
        }
    }
    
    
    private let iphoneDownLoadView = UIView.init(backgroundColor: UIColor.white);
    private let iphoneDownLoadLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "允许手机流量下载", textColor: ColorExtension().largeGray)
    private let iphoneDownLoadSelected = UIButton.init(normalImg: "dict_lightoff", selectedImg: "dict_lighton")
    
    private let versionBtn = UIButton.init(color: UIColor.white);
    private let versionLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "当前版本", textColor: ColorExtension().largeGray)
    private let version = UILabel.init(font: UIFont.systemFont(ofSize: 14), text: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String, textColor: ColorExtension().smallGray)
    private let versionRed = UIImageView.init(image: UIImage.init(named: "menu_red_dot"))
    
    private let shareBtn = UIButton.init(color: UIColor.white);
    private let shareLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "推荐给朋友", textColor: ColorExtension().largeGray)
    private let shareImg = UIImageView.init(image: UIImage.init(named: "dict_gotodo"))
    
    private let questionsBtn = UIButton.init(color: UIColor.white);
    private let questionsLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "常见问题", textColor: ColorExtension().largeGray)
    private let questionsImg = UIImageView.init(image: UIImage.init(named: "dict_gotodo"))
    
    private let qqBtn = UIButton.init(color: UIColor.white);
    private let qqLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "QQ群", textColor: ColorExtension().largeGray)
    private let qq = UILabel.init(font: UIFont.systemFont(ofSize: 14), text: "659839707 (同学2群)\n663552438 (老师家长群)", textColor: ColorExtension().smallGray)
    
    private let wechatBtn = UIButton.init(color: UIColor.white);
    private let wechatLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "关注微信服务号", textColor: ColorExtension().largeGray)
    private let wechat = UILabel.init(font: UIFont.systemFont(ofSize: 14), text: "小飞机英语", textColor: ColorExtension().smallGray)
    
    private let note = UILabel.init(font: UIFont.systemFont(ofSize: 12), text: "期待您联系我们，提出建议和意见", textColor: ColorExtension().smallGray)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.actionSetting()
        
        // Do any additional setup after loading the view.
    }
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.navigationItem.title = "设置"
    }
    override func viewSetting() {
        super.viewSetting()
        self.view.backgroundColor = ColorExtension().bottomGray
        self.view.addSubview(iphoneDownLoadView)
        self.view.addSubview(iphoneDownLoadLabel)
        self.view.addSubview(iphoneDownLoadSelected)
        iphoneDownLoadView.snp.makeConstraints { (make) in
            make.top.equalTo(self.safe).offset(10)
            make.left.right.equalTo(self.safe)
            make.height.equalTo(60)
        }
        iphoneDownLoadLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(iphoneDownLoadView.snp.centerY)
            make.left.equalToSuperview().offset(20)
        }
        iphoneDownLoadSelected.snp.makeConstraints { (make) in
            make.centerY.equalTo(iphoneDownLoadView.snp.centerY)
            make.right.equalToSuperview().offset(-10)
        }
        iphoneDownLoadSelected.rx.tap.bind { [weak self] in
            self?.iphoneDownLoadSelected.isSelected =  !(self?.iphoneDownLoadSelected.isSelected)!
        }.disposed(by: disposeBag)
        
        
        
        
        
        self.view.addSubview(versionBtn)
        self.view.addSubview(versionLabel)
        self.view.addSubview(version)
        self.view.addSubview(versionRed)
        versionBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.safe)
            make.top.equalTo(iphoneDownLoadView.snp.bottom)
            make.height.equalTo(iphoneDownLoadView.snp.height)
        }
        versionLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(versionBtn.snp.centerY)
            make.left.equalTo(iphoneDownLoadLabel.snp.left)
        }
        version.snp.makeConstraints { (make) in
            make.centerY.equalTo(versionBtn.snp.centerY)
            make.right.equalToSuperview().offset(-30)
        }
        versionRed.snp.makeConstraints { (make) in
            make.left.equalTo(versionLabel.snp.right)
            make.bottom.equalTo(versionLabel.snp.top).offset(5)
        }
        
        
        self.view.addSubview(shareBtn)
        self.view.addSubview(shareLabel)
        self.view.addSubview(shareImg)
        shareBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.safe)
            make.top.equalTo(versionBtn.snp.bottom)
            make.height.equalTo(iphoneDownLoadView.snp.height)
        }
        shareLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(shareBtn.snp.centerY)
            make.left.equalTo(iphoneDownLoadLabel.snp.left)
        }
        shareImg.snp.makeConstraints { (make) in
            make.centerY.equalTo(shareBtn.snp.centerY)
            make.right.equalToSuperview()
        }
        
        
        self.view.addSubview(questionsBtn)
        self.view.addSubview(questionsLabel)
        self.view.addSubview(questionsImg)
        questionsBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.safe)
            make.top.equalTo(shareBtn.snp.bottom).offset(10)
            make.height.equalTo(iphoneDownLoadView.snp.height)
        }
        questionsLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(questionsBtn.snp.centerY)
            make.left.equalTo(iphoneDownLoadLabel.snp.left)
        }
        questionsImg.snp.makeConstraints { (make) in
            make.centerY.equalTo(questionsBtn.snp.centerY)
            make.right.equalTo(shareImg.snp.right)
        }
        
        
        
        self.view.addSubview(qqBtn)
        self.view.addSubview(qqLabel)
        self.view.addSubview(qq)
        qq.textAlignment = .right
        qqBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.safe)
            make.top.equalTo(questionsBtn.snp.bottom)
            make.height.equalTo(iphoneDownLoadView.snp.height)
        }
        qqLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(qqBtn.snp.centerY)
            make.left.equalTo(iphoneDownLoadLabel.snp.left)
        }
       qq.snp.makeConstraints { (make) in
            make.centerY.equalTo(qqBtn.snp.centerY)
            make.right.equalTo(version.snp.right)
        }
        
        
        self.view.addSubview(wechatBtn)
        self.view.addSubview(wechatLabel)
        self.view.addSubview(wechat)
        wechatBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.safe)
            make.top.equalTo(qqBtn.snp.bottom)
            make.height.equalTo(iphoneDownLoadView.snp.height)
        }
        wechatLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(wechatBtn.snp.centerY)
            make.left.equalTo(iphoneDownLoadLabel.snp.left)
        }
        wechat.snp.makeConstraints { (make) in
            make.centerY.equalTo(wechatBtn.snp.centerY)
            make.right.equalTo(version.snp.right)
        }
        
        self.view!.addSubview(note)
        note.snp.makeConstraints { (make) in
            make.top.equalTo(wechatBtn.snp.bottom).offset(10)
            make.left.equalTo(wechatLabel.snp.left)
        }
        
        
        
        
    }
    func actionSetting () {
        versionBtn.rx.tap.bind {[weak self] in
            print("版本")
            }.disposed(by: disposeBag)
        shareBtn.rx.tap.bind {[weak self] in
            print("分享")
            }.disposed(by: disposeBag)
        questionsBtn.rx.tap.bind {[weak self] in
            print("疑问")
            }.disposed(by: disposeBag)
        qqBtn.rx.tap.bind {[weak self] in
            print("QQ群")
            }.disposed(by: disposeBag)
        wechatBtn.rx.tap.bind {[weak self] in
            print("微信服务号")
            }.disposed(by: disposeBag)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UILabel {
    convenience init(font:UIFont,text:String,textColor:UIColor) {
        self.init()
        self.text = text
        self.numberOfLines = 0
        self.font = font
        self.textColor = textColor
    }
}
extension UIView {
    convenience init(backgroundColor:UIColor){
        self.init()
        self.backgroundColor = backgroundColor
    }
    
}
extension UIButton {
    convenience init(color:UIColor){
        self.init()
        self.backgroundColor = color
        self.addTarget(self, action: #selector(touchDown), for:UIControlEvents.touchDown)
        self.addTarget(self, action: #selector(touchOutSide), for:UIControlEvents.touchUpOutside)
        self.addTarget(self, action: #selector(touchOutSide), for:UIControlEvents.touchUpInside)
    }
    @objc func touchDown() {
        self.backgroundColor = ColorExtension().touchGray
    }
    @objc func touchOutSide() {
        self.backgroundColor = UIColor.white
    }
    convenience init(normalImg:String,selectedImg:String){
        self.init()
        self.setImage(UIImage.init(named: normalImg), for: .normal)
        self.setImage(UIImage.init(named: selectedImg), for: .selected)
    }
}
