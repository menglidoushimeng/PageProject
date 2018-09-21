//
//  BookViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/14.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BookViewController: UIViewController {

    
    var bookDataSource:BookModel? // 教科书数据源
     var bookTableView = UITableView()
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewSetting()

        // Do any additional setup after loading the view.
    }
    func viewSetting() {
        self.view.addSubview(bookTableView)
        bookTableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
        self.bookTableView.dataSource = self as UITableViewDataSource
        self.bookTableView.delegate = self as UITableViewDelegate
        self.bookTableView.register(UINib.init(nibName: "BookHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "BookHeaderTableViewCell")
        self.bookTableView.register(UINib.init(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        self.bookTableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BookViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookHeaderTableViewCell", for: indexPath) as! BookHeaderTableViewCell
            cell.selectionStyle = .none
            cell.HeaderViewAction = {(enumType) in
                
               print("视图头部点击事件")
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
//            var bookUnit = bookDataSource?.dict_book_units![indexPath.row] as! BookUnitModel // 获取cell对应的model
            cell.selectionStyle = .none
            cell.index = indexPath
            if indexPath.row % 2 == 0 {
                cell.cellType = .unLoad
            } else {
                cell.cellType = .load
            }
            cell.cellDownLoadBlock = {(index) in
                print("点击了下载按钮");
            }
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return 1
        } else {
 #if DEBUG
            print("走了debug")
            return 10
 #else
            print("走了debug之外")
            return (bookDataSource?.dict_book_units?.count)!
 #endif
        }
    }
    
}
extension BookViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UIScreen.main.bounds.size.width
        } else {
            return 60
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let wordVC = WordViewController()
        self.navigationController?.pushViewController(wordVC, animated: true)
    }
}
