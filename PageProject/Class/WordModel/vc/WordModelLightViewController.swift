//
//  WordModelLightViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/6/24.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

enum WordViewStates {
    case browse // 浏览
    case read // 早读
    case bySelf // 自测
}

class WordModelLightViewController: RootViewController {

    
    var viewStates:WordViewStates = .browse
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.hiddenNavigationBarLine()
        self.navigationController?.navigationBar.barTintColor = UIColor.hex(hexString: "#f4f5f6")
        switch viewStates {
        case .browse:
            do {
             self.navigationItem.title = "浏览模式"
            }
            break
        case .read:
            do {
                self.navigationItem.title = "早读模式"
            }
            break
        case .bySelf:
            do {
                self.navigationItem.title = "自测模式"
            }
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBOutlet weak var bottomLeftSender: UIButton!
    @IBAction func bottomLeftAction(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var bottomCenterLb: UILabel!
    @IBOutlet weak var bottomRightSender: UIButton!
    @IBAction func bottomRightAction(_ sender: UIButton) {
    }
    
    
    
    override func viewSetting() {
        super.viewSetting()
        self.view.backgroundColor = UIColor.hex(hexString: "#f4f5f6")
        switch self.viewStates {
        case .read:
            do{
                self.bottomLeftSender.isHidden = true
                self.bottomCenterLb.isHidden = true
                self.bottomRightSender.setTitle("锁屏播放", for: .normal)
            }
             break;
        case .browse:
            do{
                self.bottomLeftSender.setTitle("封面", for: .normal)
                self.bottomCenterLb.isHidden = true
                self.bottomRightSender.setTitle("从该词起顺序听写", for: .normal)
            }
             break;
        case .bySelf:
            do{
                self.bottomLeftSender.isHidden = true
                self.bottomCenterLb.text = "看词义，说出单词，再比对结果"
                self.bottomRightSender.isHidden = true
            }
            break;
        }
       
    }
    
    // 图片
    @IBOutlet weak var headImg: UIImageView!
    
    // 分子
    @IBOutlet weak var molecular: UILabel!
    // 分母
    @IBOutlet weak var denominator: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
