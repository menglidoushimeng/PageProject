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
import RxDataSources

protocol BookViewModelDelegate:RootTableViewViewModelDelegate {
    /******* 自定义协议  ********/
    func shareViewShow()
    func headerAction()
    
}


class BookViewModel: RootTableViewViewModel {
   
    weak var bookDelegate:BookViewModelDelegate?
    func shareActionStyle(_ :ShareActionStyle) {
        
    }
    
    override init() {
        super.init()
        self.dataSource = self.bookUnitModelSource()
        
    }
    
    func bookUnitModelSource() -> Array<Array<RootTableViewCellModel>> {
        let headModel = RootTableViewCellModel()
        headModel.cellIdentifier = String(describing: type(of:BookHeaderTableViewCell()))
        let headers = [headModel]
        
        let bookUnits = NSMutableArray.init()
        
        for _ in 1...10{
            let unitModel = RootTableViewCellModel()
            unitModel.cellIdentifier = String(describing: type(of:BookTableViewCell()))
            
            bookUnits.add(unitModel)
        }
//        for unit in BookModel().dict_book_units ?? []{
//            let unitModel = RootTableViewCellModel()
//            unitModel.cellIdentifier = String(describing: type(of:BookTableViewCell()))
//            unitModel.cellModel = unit
//            bookUnits.add(unitModel)
//        }
        return [headers,bookUnits as! Array<RootTableViewCellModel>]
    }
    
/*********************  DataSource  *********************/
    
    
   override func cellForRow(_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.cellForRow(tableView, indexPath) 
        
        if indexPath.section == 0 {
            let headerCell = cell as! BookHeaderTableViewCell
            headerCell.selectionStyle = .none
            
            headerCell.HeaderViewAction = {(enumType:HeaderTapEnum) in
                switch enumType {
                case .share : do{
                    self.bookDelegate?.shareViewShow()
                }
                    break;
                case .listen : do {
                    print("听课文")
                    self.bookDelegate?.headerAction()
                }
                    break;
                case .word : do {
                    print("单词")
                    self.bookDelegate?.headerAction()
                }
                break;
                case .sentence : do {
                    print("短语")
                    self.bookDelegate?.headerAction()
                }
                break;
                case .keySentence : do {
                    print("重点句型")
                    self.bookDelegate?.headerAction()
                }
                break;
                case .text : do {
                    print("朗读课文")
                    self.bookDelegate?.headerAction()
                }
                break;
                }
            }
            
        } else {
            let bookCell = cell as! BookTableViewCell
            bookCell.selectionStyle = .none
            bookCell.index = indexPath
            if indexPath.row % 5 == 0 {
                bookCell.cellType = .unLoad
                bookCell.star = true
            } else if indexPath.row % 5 == 1 {
                bookCell.cellType = .practice
                bookCell.star = true
            } else if indexPath.row % 5 == 2 {
                bookCell.cellType = .understand
                bookCell.star = true
            } else if indexPath.row % 5 == 3 {
                bookCell.cellType = .grasp
                bookCell.star = true
            } else if indexPath.row % 5 == 4 {
                bookCell.cellType = .grasp
                bookCell.star = false
            }
            bookCell.cellDownLoadBlock = {(index) in
                print("点击了下载按钮");
            }
            
        }
        return cell
    }
    
    
    
/*********************  Delegate  *********************/
    
    
   override func heightForRowAt(_ tableView: UITableView,  _ indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableViewAutomaticDimension
        } else {
            return 60
        }
    }
    override func estimatedHeightForRowAt(_ tableView: UITableView, _ indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UIScreen.main.bounds.size.width
        } else {
            return 60
        }
    }
    
   override func didSelectRowAt( _ tableView: UITableView,  _ indexPath: IndexPath) {
        let rows = self.dataSource?[indexPath.section]
        let model = rows![indexPath.row]
        bookDelegate?.didSelectedCell?(model)
    }
}


