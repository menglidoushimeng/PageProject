//
//  RootTableViewViewModel.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/10/11.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

@objc protocol RootTableViewViewModelDelegate:RootViewModelDelegate {
    /******* 自定义协议  ********/
   @objc optional func didSelectedCell(_ model:RootTableViewCellModel)
}

class RootTableViewViewModel: RootViewModel {

    let rowHeight:CGFloat = 40
    let estimatedRowHeight:CGFloat = 40
    var dataSource:Array<Array<RootTableViewCellModel>>?
    
    weak var tabDelegate:RootTableViewViewModelDelegate?
    
    
    /*********************  DataSource  *********************/
    func cellForRow(_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell {
        
        let rows = self.dataSource?[indexPath.section]
        let model = rows![indexPath.row]
        let cell:UITableViewCell
        
        if model.cellIdentifier == nil || model.cellIdentifier == "" {
            let ID:String = "NormalCell"
            var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: ID)
            if cell == nil {
                cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: ID)
            }
            return cell!
        } else {
            cell  = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier!, for: indexPath)
            return cell
        }
        

    }
    func numberOfSection(in tableView: UITableView) -> Int {
        return self.dataSource?.count ?? 0
    }
    
    
    func numberOfRowsInSection(_ tableView: UITableView, _ section: Int) -> Int {
        let rows = self.dataSource?[section]
        return rows?.count ?? 0
    }
    
    
    /*********************  Delegate  *********************/
    
    
    func heightForRowAt(_ tableView: UITableView,  _ indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func estimatedHeightForRowAt(_ tableView: UITableView, _ indexPath: IndexPath) -> CGFloat {
        return estimatedRowHeight
    }
    func didSelectRowAt( _ tableView: UITableView,  _ indexPath: IndexPath) {
        
    }
}

