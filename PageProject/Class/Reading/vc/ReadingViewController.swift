//
//  ReadingViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/6/15.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

enum ReadingStatus {
    case browse // 浏览
    case listen // 听写
    case sleep // 睡前
    case read // 早读
    case bySelf // 自测
}

class ReadingViewController: RootViewController {
    
    var selectedSender :UIButton?
    var readStatus = ReadingStatus.browse
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.navigationController?.navigationBar.barTintColor = UIColor.hex(hexString: "#F4F5F6")
        self.hiddenNavigationBarLine()
        self.navigationItem.title = "单词卡"
        let rightItem = UIBarButtonItem.init(image: UIImage.init(named: "dict_icontextshare")!.withRenderingMode(.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightBarItemAction(rightItem:)))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    override func viewSetting() {
        super.viewSetting()
        self.view.backgroundColor = UIColor.hex(hexString: "#F4F5F6")
        self.selectedSender = browseSender
        self.selectedSender?.isSelected = true
        
    }
    @objc  func rightBarItemAction(rightItem:UIButton)  {
        
    }
    
    
    
    @IBOutlet weak var browseSender: UIButton!
    
    @IBAction func browseAction(_ sender: UIButton) {
        self.senderSelected(sender);
    }
    
    @IBOutlet weak var listenSender: UIButton!
    
    @IBAction func listenAction(_ sender: UIButton) {
        self.senderSelected(sender);
    }
    
    @IBOutlet weak var sleepSender: UIButton!
    
    @IBAction func sleepAction(_ sender: UIButton) {
        self.senderSelected(sender);
    }
    
    @IBOutlet weak var readSender: UIButton!
    
    @IBAction func readAction(_ sender: UIButton) {
        self.senderSelected(sender);
    }
    
    @IBOutlet weak var selfSender: UIButton!
    
    @IBAction func selfAction(_ sender: UIButton) {
        
    }
    func senderSelected(_ sender:UIButton)  {
        selectedSender?.isSelected = false
        sender.isSelected = true
        selectedSender = sender
    }
    @IBAction func readSetAction(_ sender: UIButton) {
        switch self.readStatus {
        case .browse:
            do {
                let readSetView = Bundle.main.loadNibNamed("ReadSetView", owner: self, options: nil)?.first as! ReadSetView
                UIApplication.shared.keyWindow?.addSubview(readSetView)
                readSetView.snp.makeConstraints { (make) in
                    make.left.right.top.equalTo(self.safe)
                    make.bottom.equalTo(self.browseSender.snp.top)
                }
                break
        }
        case .listen:
            do {
                break
            }
        case .sleep:
            do {
                break
            }
        case .read:
            do {
                break
            }
        case .bySelf:
            do {
                break
            }
        }
    }
    @IBAction func beginAction(_ sender: UIButton) {
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
