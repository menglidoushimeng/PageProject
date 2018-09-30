//
//  BookViewModel.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/21.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol BookViewModelDelegate:RootViewModelDelegate {
    /******* 自定义协议  ********/
    func shareViewShow()
}


class BookViewModel: RootViewModel {
     var bookDataSource:BookModel? // 教科书数据源
    
    
     weak var bookDelegate:BookViewModelDelegate?
    
    
    
/*********************  DataSource  *********************/
    
    
    func cellForRow(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookHeaderTableViewCell", for: indexPath) as! BookHeaderTableViewCell
            cell.selectionStyle = .none
            cell.HeaderViewAction = {(enumType:HeaderTapEnum) in
                switch enumType {
                case .share : do{
                    self.bookDelegate?.shareViewShow()
                }
                    break;
                case .listen : do {
                    print("听课文")
                }
                    break;
                case .word : do {
                    print("单词")
                }
                break;
                case .sentence : do {
                    print("短语")
                }
                break;
                case .keySentence : do {
                    print("重点句型")
                }
                break;
                case .text : do {
                    print("朗读课文")
                }
                break;
                default : break
                }
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
    
    
    func numberOfSection(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    func numberOfRowsInSection(tableView: UITableView, section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return bookDataSource?.dict_book_units?.count ?? 0
        }
    }
    
    
/*********************  Delegate  *********************/
    
    
    func heightForRowAt(tableView: UITableView,  indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return UIScreen.main.bounds.size.width
        } else {
            return 60
        }
    }
    
    
    func didSelectRowAt( tableView: UITableView,  indexPath: IndexPath) {
        
        bookDelegate?.onNextViewController()
    }
}
