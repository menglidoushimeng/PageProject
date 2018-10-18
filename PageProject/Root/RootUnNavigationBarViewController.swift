//
//  RootUnNavigationBarViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/10/17.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class RootUnNavigationBarViewController: RootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewSetting() {
        super.viewSetting()
        self.navigationBarHidden = true
    }
    lazy var guideUnBar:UILayoutGuide = { () -> UILayoutGuide in
        let guide = UILayoutGuide()
        self.view.addLayoutGuide(guide)
        guide.snp.makeConstraints({ (make) in
            make.bottom.left.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(20)
            
        })
        return guide
    }()
    override var guideLayout:UILayoutGuide {
        get {
            return self.guideUnBar
        }
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
