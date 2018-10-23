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

class SettingViewController: RootUnShowStatesViewController {
    var newVersion:Bool { // 是否有新版本
        get {
            return !versionRed.isHidden
        }
        set {
            versionRed.isHidden = !newValue
        }
    }
    
    private let scrollView = RootScrollView.init()
    private let baseView = UIView()
    
    private let iphoneDownLoadView = UIView.init(backgroundColor: UIColor.white);
    private let iphoneDownLoadLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "允许手机流量下载", textColor: ColorExtension().largeGray)
    private let iphoneDownLoadSelected = UIButton.init(normalImg: "dict_lightoff", selectedImg: "dict_lighton")
    
    private let versionBtn = UIButton.init(color: UIColor.white);
    private let versionLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "当前版本", textColor: ColorExtension().largeGray)
    private let version = UILabel.init(font: UIFont.systemFont(ofSize: 14), text: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String, textColor: ColorExtension().smallGray)
    private let versionRed = UIImageView()
    
    private let shareBtn = UIButton.init(color: UIColor.white);
    private let shareLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "推荐给朋友", textColor: ColorExtension().largeGray)
    private let shareImg = UIImageView.init(image: UIImage.init(named: "dict_gotodo"))
    
    private let questionsBtn = UIButton.init(color: UIColor.white);
    private let questionsLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "常见问题解答", textColor: ColorExtension().largeGray)
    private let questionsImg = UIImageView.init(image: UIImage.init(named: "dict_gotodo"))
    
    private let qqBtn = UIButton.init(color: UIColor.white);
    private let qqLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "QQ群", textColor: ColorExtension().largeGray)
    private let qq = UILabel.init(font: UIFont.systemFont(ofSize: 14), text: "659839707 (同学2群)\n663552438 (老师家长群)", textColor: ColorExtension().smallGray)
    
    private let wechatBtn = UIButton.init(color: UIColor.white);
    private let wechatLabel = UILabel.init(font: UIFont.systemFont(ofSize: 16), text: "关注微信服务号", textColor: ColorExtension().largeGray)
    private let wechat = UILabel.init(font: UIFont.systemFont(ofSize: 14), text: "小飞机英语", textColor: ColorExtension().smallGray)
    
    private let note = UILabel.init(font: UIFont.systemFont(ofSize: 12), text: "期待您联系我们，提出建议和意见", textColor: ColorExtension().smallGray)
    
    
    let outBtn = UIButton.init()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actionSetting()
        
        // Do any additional setup after loading the view.
    }
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.navigationItem.title = "设置"
        self.hiddenNavigationBarLine();
    }
    override func viewSetting() {
        super.viewSetting()
        self.view.backgroundColor = ColorExtension().bottomGray
        
        self.view.addSubview(self.scrollView)
        self.scrollView.delaysContentTouches = false;
        
        self.scrollView.canCancelContentTouches = true;
        scrollView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.safe)
        }
   
       
        
        self.scrollView.addSubview(iphoneDownLoadView)
        self.scrollView.addSubview(iphoneDownLoadLabel)
        self.scrollView.addSubview(iphoneDownLoadSelected)
        iphoneDownLoadView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview()
            make.width.equalTo(self.safe.snp.width)
            make.height.equalTo(60)
        }
        iphoneDownLoadLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(iphoneDownLoadView.snp.centerY)
            make.left.equalToSuperview().offset(20)
        }
        iphoneDownLoadSelected.snp.makeConstraints { (make) in
            make.centerY.equalTo(iphoneDownLoadView.snp.centerY)
            make.right.equalTo(self.safe).offset(-10)
        }
        iphoneDownLoadSelected.rx.tap.bind { [weak self] in
            self?.iphoneDownLoadSelected.isSelected =  !(self?.iphoneDownLoadSelected.isSelected)!
        }.disposed(by: disposeBag)
        
        
        
        
        
        self.scrollView.addSubview(versionBtn)
        self.scrollView.addSubview(versionLabel)
        self.scrollView.addSubview(version)
        self.scrollView.addSubview(versionRed)
        versionBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.scrollView.snp.left)
            make.width.equalTo(self.iphoneDownLoadView.snp.width)
            make.top.equalTo(iphoneDownLoadView.snp.bottom)
            make.height.equalTo(iphoneDownLoadView.snp.height)
        }
        versionLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(versionBtn.snp.centerY)
            make.left.equalTo(iphoneDownLoadLabel.snp.left)
        }
        version.snp.makeConstraints { (make) in
            make.centerY.equalTo(versionBtn.snp.centerY)
            make.right.equalTo(self.safe).offset(-30)
        }
        versionRed.backgroundColor = ColorExtension().errorOrange
        versionRed.layer.cornerRadius = 6
        versionRed.snp.makeConstraints { (make) in
            make.left.equalTo(versionLabel.snp.right).offset(4)
            make.bottom.equalTo(versionLabel.snp.top).offset(10)
            make.width.height.equalTo(12)
        }


        self.scrollView.addSubview(shareBtn)
        self.scrollView.addSubview(shareLabel)
        self.scrollView.addSubview(shareImg)
        shareBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.scrollView.snp.left)
            make.width.equalTo(self.iphoneDownLoadView.snp.width)
            make.top.equalTo(versionBtn.snp.bottom)
            make.height.equalTo(iphoneDownLoadView.snp.height)
        }
        shareLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(shareBtn.snp.centerY)
            make.left.equalTo(iphoneDownLoadLabel.snp.left)
        }
        shareImg.snp.makeConstraints { (make) in
            make.centerY.equalTo(shareBtn.snp.centerY)
            make.right.equalTo(self.safe).offset(-15)
        }


        self.scrollView.addSubview(questionsBtn)
        self.scrollView.addSubview(questionsLabel)
        self.scrollView.addSubview(questionsImg)
        questionsBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.scrollView.snp.left)
            make.width.equalTo(self.iphoneDownLoadView.snp.width)
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



        self.scrollView.addSubview(qqBtn)
        self.scrollView.addSubview(qqLabel)
        self.scrollView.addSubview(qq)
        qq.textAlignment = .right
        qqBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.scrollView.snp.left)
            make.width.equalTo(self.iphoneDownLoadView.snp.width)
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


        self.scrollView.addSubview(wechatBtn)
        self.scrollView.addSubview(wechatLabel)
        self.scrollView.addSubview(wechat)
        wechatBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.scrollView.snp.left)
            make.width.equalTo(self.iphoneDownLoadView.snp.width)
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

        self.scrollView.addSubview(note)
        note.snp.makeConstraints { (make) in
            make.top.equalTo(wechatBtn.snp.bottom).offset(10)
            make.left.equalTo(wechatLabel.snp.left)
        }

        self.scrollView.addSubview(outBtn)
        var outTopHeight = self.safe.layoutFrame.size.height - 64;
        if UIDevice().isX() {
            outTopHeight = outTopHeight - 72;
        }
        outBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.scrollView.snp.left).offset(30)
            make.centerX.equalTo(self.scrollView.snp.centerX)
            make.top.equalTo(self.scrollView.snp.top).offset(outTopHeight)
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-30)
            make.height.equalTo(40)
        }
        outBtn.setTitleColor(ColorExtension().questionOrange, for: .normal)
        outBtn.setTitle("退出当前账号", for: .normal)
        outBtn.layer.cornerRadius = 10
        outBtn.layer.borderWidth = 1
        outBtn.layer.borderColor = ColorExtension().questionOrange.cgColor
        
        
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

   
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
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
        self.setBackground(color: ColorExtension().touchGray, state: .highlighted)
    }

    convenience init(normalImg:String,selectedImg:String){
        self.init()
        self.setImage(UIImage.init(named: normalImg), for: .normal)
        self.setImage(UIImage.init(named: selectedImg), for: .selected)
    }
    func setBackground(color:UIColor,state:UIControlState) {
        self.setBackgroundImage(self.imageWithColor(color: color), for: state)
    
    }
    func imageWithColor(color:UIColor) -> UIImage {
        let rect = CGRect.init(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext();
        context!.setFillColor(color.cgColor)
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
    
    
   
}




