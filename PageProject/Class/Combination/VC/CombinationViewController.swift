//
//  CombinationViewController.swift
//  PageProject
//
//  Created by 汪文浩 on 2018/11/14.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class CombinationViewController: RootUnNaviProgressBarViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let collection = UICollectionView()
    override func viewSetting() {
        super.viewSetting()
        self.view.addSubview(collection)
        collection.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.safe)
            make.top.equalTo(self.turnBackBtn.snp.bottom)
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
