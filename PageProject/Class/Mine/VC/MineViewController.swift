//
//  MineViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/26.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class MineViewController: RootViewController {
    let tableView = UITableView()
    
    let lvLb = UILabel();
    let flashImgView = UIImageView.init(image: UIImage.init(named: "dict_sexboy"))
    let redTextLb = UILabel()
    let grayTextLb = UILabel()
    let starImgView =  UIImageView.init(image: UIImage.init(named: "dict_aostar"))
    let starLb = UILabel();
    
    let settingBtn = UIButton();
    let settingBtnRed = UIImageView.init(image: UIImage.init(named: "menu_red_dot"))
    
    
    let listDataSource = MineModel.MineModelArr()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewSetting() {
        super.viewSetting()
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(self.safe)
            make.top.equalTo(self.safe).offset(32)
            
        }
        self.tableView.bounces = false
        self.tableView.dataSource = self as UITableViewDataSource
        self.tableView.delegate = self as UITableViewDelegate
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib.init(nibName: "MineHeaderLoginTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MineHeaderLoginTableViewCell")
        self.tableView.register(UINib.init(nibName: "MineHeaderUnLoginTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MineHeaderUnLoginTableViewCell")
        
        self.tableView.register(UINib.init(nibName: "MineTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MineTableViewCell")
        
        
        
        
        self.view.addSubview(lvLb)
        lvLb.text = "Lv.12"
        lvLb.textColor = ColorExtension().largeGray
        lvLb.font = UIFont.boldSystemFont(ofSize: 12)
        lvLb.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.bottom.equalTo(tableView.snp.top)
        }
        
        self.view.addSubview(flashImgView)
        flashImgView.snp.makeConstraints { (make) in
            make.left.equalTo(lvLb.snp.right).offset(18)
            make.centerY.equalTo(lvLb.snp.centerY)
            make.height.width.equalTo(15)
        }
        
        self.view.addSubview(redTextLb)
        redTextLb.textColor = ColorExtension().textRed
        redTextLb.text = "10000"
        redTextLb.font = UIFont.systemFont(ofSize: 10)
        redTextLb.snp.makeConstraints { (make) in
            make.left.equalTo(flashImgView.snp.right).offset(5)
            make.centerY.equalTo(flashImgView.snp.centerY)
        }
        
        self.view.addSubview(grayTextLb)
        grayTextLb.textColor = ColorExtension().smallGray
        grayTextLb.text = "/20000"
        grayTextLb.font = UIFont.systemFont(ofSize: 10)
        grayTextLb.snp.makeConstraints { (make) in
            make.left.equalTo(redTextLb.snp.right)
            make.centerY.equalTo(flashImgView.snp.centerY)
        }
        
        self.view.addSubview(starImgView)
        starImgView.snp.makeConstraints { (make) in
            make.left.equalTo(grayTextLb.snp.right).offset(18)
            make.centerY.equalTo(lvLb.snp.centerY)
            make.height.width.equalTo(15)
        }
        
        self.view.addSubview(starLb)
        starLb.textColor = ColorExtension().starGold
        starLb.text = "67"
        starLb.font = UIFont.systemFont(ofSize: 10)
        starLb.snp.makeConstraints { (make) in
            make.left.equalTo(starImgView.snp.right).offset(5)
            make.centerY.equalTo(flashImgView.snp.centerY)
        }
        
        self.view.addSubview(settingBtn)
        settingBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.centerY.equalTo(lvLb.snp.centerY)
            
        }
        settingBtn.setImage(UIImage.init(named: "dict_icontextsetup"), for: .normal)
        
        self.view.addSubview(settingBtnRed)
        settingBtnRed.snp.makeConstraints { (make) in
            make.bottom.equalTo(settingBtn.snp.top).offset(18)
            make.right.equalTo(settingBtn.snp.left).offset(8)
            make.height.width.equalTo(12)
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
extension MineViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDataSource.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let isLogin = false
            
            if isLogin {
               let cell = tableView.dequeueReusableCell(withIdentifier: "MineHeaderLoginTableViewCell", for: indexPath) as! MineHeaderLoginTableViewCell
                cell.selectionStyle = .none
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MineHeaderUnLoginTableViewCell", for: indexPath) as! MineHeaderUnLoginTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MineTableViewCell", for: indexPath) as! MineTableViewCell
            let model = listDataSource[indexPath.row - 1] as! MineModel
            cell.cellImg.image = UIImage.init(named: model.imageName)
            cell.titleLb.text = model.title
            cell.descLb.text =  model.desc
            cell.rightLb.text = model.rightDesc
            cell.rightLb.textColor = model.rightTextColor
            cell.redImgView.isHidden = model.hiddenRedView
            return cell
        }
    }
    
    
}
extension MineViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UIScreen.main.bounds.size.width / 2
        } else {
            return 48
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = listDataSource[indexPath.row - 1] as! MineModel
        if model.title == "课本下载记录" {
            let vc = DownLoadListViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }
}
