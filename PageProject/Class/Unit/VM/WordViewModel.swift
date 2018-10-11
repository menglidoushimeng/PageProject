//
//  WordViewModel.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/10/11.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class WordViewModel: RootTableViewViewModel {
    override func cellForRow(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let superCell = super.cellForRow(tableView, indexPath)
        let cell = superCell as! WordSectionTableViewCell
        cell.selectionStyle = .none
        cell.indexPath = indexPath
        cell.delegate = (self as WordViewCellDelegate)
        if indexPath.row % 2 == 0 {
            cell.cellStype = .leftTwoQuestionWithTitle
        } else {
            cell.cellStype = .rightTwoQuestion
        }
        return cell
    }
    func getDataSouce() {
        let models = NSMutableArray.init()
        for _ in 0...10 {
            let model = RootTableViewCellModel()
            model.cellIdentifier = String(describing: type(of: WordSectionTableViewCell()))
            models.add(model)
        }
        self.dataSource = ([models] as! Array<Array<RootTableViewCellModel>>)
    }
    
}
extension WordViewModel : WordViewCellDelegate {
    func cellDidSelected(indexPath: IndexPath, leftBtn: Bool) {
        let rows = self.dataSource?[indexPath.section]
        let model = rows![indexPath.row]
        tabDelegate?.didSelectedCell?(model)
    }
}
