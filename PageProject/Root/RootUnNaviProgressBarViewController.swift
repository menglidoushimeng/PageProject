//
//  RootUnNaviProgressBarViewController.swift
//  PageProject
//
//  Created by 汪文浩 on 2018/11/12.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class RootUnNaviProgressBarViewController: RootUnShowStatesViewController {

    
   
    
    
    var backgroundView = UIView()
    var progressView = UIView()
    
    var turnBackBtn = UIButton()
    var rightBtn = UIButton()
    
    
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.navigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewSetting() {
        super.viewSetting()
        
        self.view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.safe)
            make.left.equalTo(self.safe)
            make.right.equalTo(self.safe)
            make.height.equalTo(8)
        }
        backgroundView.backgroundColor = ColorExtension().bottomGray
        
        self.view.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.top.equalTo(self.safe)
            make.left.equalTo(self.safe)
            make.width.equalTo(100)
            make.height.equalTo(8)
        }
        progressView.backgroundColor = ColorExtension().rightGreen
        
        self.view.addSubview(turnBackBtn)
        turnBackBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.backgroundView.snp.bottom)
            make.left.equalTo(self.safe)
            make.width.equalTo(32)
            make.height.equalTo(42)
        }
        turnBackBtn.setImage(UIImage.init(named: "dict_iconbigreturn"), for: .normal)
        turnBackBtn.addTarget(self, action: #selector(turnBackAction(_:)), for: .touchUpInside)
        
        self.view.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.backgroundView.snp.bottom)
            make.right.equalTo(self.safe)
//            make.width.equalTo(42)
//            make.height.equalTo(42)
        }
        rightBtn.setImage(UIImage.init(named: "dict_playsound"), for: .normal)
        rightBtn.addTarget(self, action: #selector(rightAction(_:)), for: .touchUpInside)
        
    }
    @objc func turnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightAction(_ sender: UIButton) {
        
        
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
