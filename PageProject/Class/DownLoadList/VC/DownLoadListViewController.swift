//
//  DownLoadListViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/28.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class DownLoadListViewController: RootUnShowStatesViewController {
    let listTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.navigationItem.title = "课本下载记录"
        self.hiddenNavigationBarLine();
    }
    override func viewSetting() {
        super.viewSetting()
        self.view.backgroundColor = ColorExtension().bottomGray
        view.addSubview(listTableView)
        listTableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self.safe)
            make.top.equalTo(self.safe).offset(10)
        }
        listTableView.delegate = self as UITableViewDelegate
        listTableView.dataSource = self as UITableViewDataSource
        listTableView.separatorStyle = .none
        listTableView.rowHeight = UIScreen.main.bounds.size.width * 3 / 8
        listTableView.register(UINib.init(nibName: "DownListTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "DownListTableViewCell")
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

extension DownLoadListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DownListTableViewCell", for: indexPath) as! DownListTableViewCell
        cell.selectionStyle = .none
        cell.indexPath = indexPath
        cell.delegate = self
        if indexPath.row % 2 == 0 {
            cell.bookState = .load
        } else {
            cell.bookState = .unLoad
        }
        return cell
    }
    
    
}
extension DownLoadListViewController:UITableViewDelegate {
    
}
extension DownLoadListViewController:DeleteDelegate {
    func delete(indexPath: IndexPath) {
        let alert = RootAlertController.init(title: nil, message: "确定删除该课本已下载的内容?", preferredStyle: .alert)
        let cancel = UIAlertAction.init(title: "取消", style: .default) { (action) in
            
        }
        let sure = UIAlertAction.init(title: "删除", style: .default) { (action) in
            
        }
        alert.addAction(cancel,ColorExtension().smallGray)
        alert.addAction(sure,ColorExtension().wordBlue)
        
        self.present(alert, animated: true, completion: nil)
    }
}

