//
//  SelectedUnitView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/3/5.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class SelectedUnitView: RootView {
    
    let ScreenWidth  = UIScreen.main.bounds.width
    let ScreenHeight = UIScreen.main.bounds.height
    var titleModel:SelectedUnitModel?
    
    let cancelBtn = UIButton()
    let sureBtn = UIButton()
    
    var selectedCollectionView:UICollectionView?
    let flowLayout = CollectionViewAlignFlowLayout.init()
    var unitSource = Array<Array<SelectedUnitModel>>()
    
    override func viewSetting() {
        super.viewSetting()
        self.backgroundColor = ColorExtension().bottomGray
        self.addSubview(cancelBtn)
        cancelBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
        }
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.setTitleColor(ColorExtension().smallGray, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancelBtn.addTarget(self, action: #selector(cancelAction(sender:)), for: .touchDown)
        
        self.addSubview(sureBtn)
        sureBtn.snp.makeConstraints { (make) in
            make.top.equalTo(cancelBtn.snp.top)
            make.right.equalToSuperview().offset(-20)
        }
        sureBtn.setTitle("确定", for: .normal)
        sureBtn.setTitleColor(ColorExtension().wordBlue, for: .normal)
        sureBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        sureBtn.addTarget(self, action: #selector(sureAction(sender:)), for: .touchDown)
       
        flowLayout.cellType = .left
        flowLayout.minimumLineSpacing = 0
        flowLayout.betweenOfCell = 0

        
       
        selectedCollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        self.addSubview(selectedCollectionView!)
        selectedCollectionView!.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(cancelBtn.snp.bottom).offset(20)
        }
        
        selectedCollectionView?.backgroundColor = UIColor.clear
        selectedCollectionView?.delegate = self
        selectedCollectionView?.dataSource = self
     
        selectedCollectionView?.register(UINib.init(nibName: "SelectedUnitCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectedUnitCollectionViewCellLoad")
        selectedCollectionView?.register(UINib.init(nibName: "SelectedUnitCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectedUnitCollectionViewCellUnload")
        selectedCollectionView?.register(UINib.init(nibName: "SelectedUnitClassNameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectedUnitClassNameCollectionViewCell")
     
        
        self.exampleModels()
    }
    
    func exampleModels() {
        var superModel:SelectedUnitModel?
        var unitModel:SelectedUnitModel?
        var unitModel2:SelectedUnitModel?
        var unitModel3:SelectedUnitModel?
        for num in 1...28 {
            let model = SelectedUnitModel()
            switch num {
            case 1:do {
                 superModel = model
                titleModel = model
                 model.cellStyle = .Title
                break
                }
            case 2,11,18:do {
               
                    if num == 2{
                        unitModel = model
                    }
                    if num == 11{
                        unitModel2 = model
                    }
                    if num == 18{
                        unitModel3 = model
                    }
                superModel?.childrenModels.append(model)
                model.superModel = superModel
                
                model.cellStyle = .Unit_load
                break
                }
            case 3...10,12...17,19...25:do {
                model.cellStyle = .Class
                if num < 11 {
                    unitModel?.childrenModels.append(model)
                    model.superModel = unitModel
                } else if num < 18 {
                    unitModel2?.childrenModels.append(model)
                    model.superModel = unitModel2
                } else if num < 26 {
                    unitModel3?.childrenModels.append(model)
                    model.superModel = unitModel3
                }
                break
                }
            case 26...28:do {
                model.cellStyle = .Unit_unload
                superModel?.childrenModels.append(model)
                model.superModel = superModel
                break
                }
            default:
                break
            }
           
        }
        self.exampleModel(model: superModel!)
       selectedCollectionView?.reloadData()
    }
    
    func exampleModel(model:SelectedUnitModel) {
        
         unitSource.append([model])
        for childModel in model.childrenModels {
            if childModel.cellStyle != .Class {
                self.exampleModel(model: childModel)
            } else {
                self.unitSource.append(model.childrenModels)
                break
            }
        }
    }
    
    @objc func cancelAction(sender:UIButton) {
        self.removeFromSuperview()
    }
    @objc func sureAction(sender:UIButton) {
        self.cancelAction(sender: sender)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension SelectedUnitView:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let model = self.unitSource[indexPath.section][indexPath.row]
        model.selected = !model.selected
        model.childModelSelected()
        model.superModelSelected()
        collectionView.reloadData()
    }
}

extension SelectedUnitView:UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return unitSource.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return unitSource[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = self.unitSource[indexPath.section][indexPath.row]
        if model.cellStyle == .Class {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedUnitClassNameCollectionViewCell", for: indexPath) as! SelectedUnitClassNameCollectionViewCell
            cell.selectedView.layer.borderColor = ColorExtension().smallGray.cgColor
            if model.selected {
                cell.selectedView.layer.borderWidth = 0
                cell.selectedView.backgroundColor = ColorExtension().wordBlue
            } else {
                cell.selectedView.layer.borderWidth = 1
                 cell.selectedView.backgroundColor = UIColor.white
            }
            
            
            return cell
        } else  if model.cellStyle == .Unit_load || model.cellStyle == .Title{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedUnitCollectionViewCellLoad", for: indexPath) as! SelectedUnitCollectionViewCell
            cell.selectedView.layer.borderWidth = 1
            cell.selectedView.layer.borderColor = ColorExtension().wordBlue.cgColor
            if model.selected {
                 cell.selectedView.backgroundColor = ColorExtension().wordBlue
            } else {
                cell.selectedView.backgroundColor = UIColor.white
            }
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedUnitCollectionViewCellUnload", for: indexPath) as! SelectedUnitCollectionViewCell
            cell.selectedView.backgroundColor = ColorExtension().smallGray
            cell.unitLb.textColor = ColorExtension().smallGray
            return cell
        }
    }
    
}
extension SelectedUnitView:UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let model = self.unitSource[indexPath.section][indexPath.row]
        if model.cellStyle == .Class {
           return CGSize.init(width: ScreenWidth / 4, height: 42)
        } else {
            return CGSize.init(width: ScreenWidth , height: 42)
        }
    }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let array = self.unitSource[section]
        if array.count > 0 {
            if array.first?.cellStyle != .Class {
                return UIEdgeInsetsMake(0, 0, 0, 0)
            } else {
                 return UIEdgeInsetsMake(0, 0, 16, 0)
            }
        }
         return UIEdgeInsetsMake(0, 0, 0, 0)
    }
}
