//
//  WordModeViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/6/20.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class WordModeViewController: RootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.navigationItem.title = "睡前模式"
        self.navigationController?.navigationBar.barTintColor = UIColor.hex(hexString: "#1F497D")
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    override func viewSetting() {
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.tintColor = ColorExtension().largeGray
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.black]
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
