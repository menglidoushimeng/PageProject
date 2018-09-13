//
//  ViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/13.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
// Example
        let view = ImageTitleView()
        self.view.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
        view.proportion = 0.5
        view.titleText = "标题"
        view.descText = "0/0"
        view.showImage = UIImage.init(named: "dict_playtextbig")!
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

