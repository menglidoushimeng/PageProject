//
//  SelectedUnitModel.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/3/5.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum CellStyle {
    case Title
    case Unit_load
    case Unit_unload
    case Class
}

class SelectedUnitModel: NSObject {

    var selected = false
   
    func superModelSelected() {
        if superModel != nil{
            if selected == false {
                superModel?.selected = false
            } else {
                var allSelected = true
                for superChildModel in (superModel?.childrenModels)! {
                    if superChildModel.selected == false && superChildModel.cellStyle != .Unit_unload {
                        allSelected = false
                        break
                    }
                }
                if allSelected == true {
                    superModel?.selected = true
                }
            }
            superModel?.superModelSelected()
            
        }
        
    }
    func childModelSelected() {
        for childModel in childrenModels {
           childModel.selected = selected
           childModel.childModelSelected()
        }
        
    }
    var cellStyle:CellStyle?
    var title:String?
    var superModel:SelectedUnitModel?
    var childrenModels = Array<SelectedUnitModel>()
    
    
}
