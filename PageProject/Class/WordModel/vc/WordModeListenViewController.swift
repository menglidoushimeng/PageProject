//
//  WordModeListenViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/6/25.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class WordModeListenViewController: RootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.hiddenNavigationBarLine()
        self.navigationItem.title = "听写模式"
    }
    override func viewSetting() {
        super.viewSetting()
        self.view.backgroundColor = UIColor.hex(hexString: "#f4f5f6")
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
