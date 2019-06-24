//
//  SelectedGradeView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/3/1.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class SelectedGradeView: RootView {

    let layout = UICollectionViewFlowLayout.init()
    var gradeCollection:UICollectionView?
    
    override func viewSetting() {
        super.viewSetting()
        self.backgroundColor = UIColor.clear
        let img = UIImageView.init(image: UIImage.init(named: "dict_pickup"))
        self.addSubview(img)
        img.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        let bgView = UIView.init()
        self.addSubview(bgView)
        bgView.layer.cornerRadius = 12
        bgView.backgroundColor = UIColor.white
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(img.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        let title = UILabel()
        title.text = "请选择你的年级"
        title.textAlignment = .center
        title.textColor = ColorExtension().wordBlue
        title.font = UIFont.systemFont(ofSize: 16)
        bgView.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        gradeCollection = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        bgView.addSubview(gradeCollection!)
        gradeCollection!.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        gradeCollection?.bounces = false
        gradeCollection?.backgroundColor = UIColor.clear
        
       layout.itemSize = CGSize.init(width: (UIScreen.main.bounds.size.width - 20) / 6, height: 44)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 10, right: 10)
        
        
       
        gradeCollection!.delegate = self
        gradeCollection!.dataSource = self
        gradeCollection!.register(UINib.init(nibName: "GradeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GradeCollectionViewCell")
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension SelectedGradeView:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GradeCollectionViewCell", for: indexPath) as! GradeCollectionViewCell
        
        cell.didSelectedGrade(selected: indexPath.row == 3)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = ColorExtension().touchGray
    }
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor =  UIColor.white
    }
}
