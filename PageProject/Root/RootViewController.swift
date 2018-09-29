//
//  RootViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/21.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var navigationBarHidden:Bool = false
    var safe:UILayoutGuide {
        get {
            return self.view.safeAreaLayoutGuide
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBarSetting()
        self.viewSetting()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = navigationBarHidden
        self.navigationController?.tabBarController?.tabBar.isHidden = !(self.navigationController?.viewControllers.count ?? 0 <= 1)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    func navigationBarSetting() {
        self.navigationController?.navigationBar.tintColor = ColorExtension().largeGray
        guard self.navigationController?.viewControllers.count ?? 0 <= 1 else {
            let leftItem = UIBarButtonItem.init(image: UIImage.init(named: "dict_iconbigreturn"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(leftBarItemAction(leftItem:)))
            self.navigationItem.leftBarButtonItem = leftItem
            return
        }
        
        
    }
    func viewSetting() {
        
    }
    
    @objc func leftBarItemAction(leftItem:UIBarButtonItem) {
     self.navigationController?.popViewController(animated: true)
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
