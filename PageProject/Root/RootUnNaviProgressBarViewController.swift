//
//  RootUnNaviProgressBarViewController.swift
//  PageProject
//
//  Created by 汪文浩 on 2018/11/12.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class RootUnNaviProgressBarViewController: RootUnShowStatesViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var progressWidthLayout: NSLayoutConstraint!
    
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.navigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func turnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func playAction(_ sender: UIButton) {
        
        
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
