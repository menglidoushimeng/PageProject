//
//  RootViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/21.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
class RootViewController: UIViewController {
    
    var navigationBarHidden:Bool = false
    
    var disposeBag = DisposeBag()
    
    
    
    lazy var guide:UILayoutGuide = { () -> UILayoutGuide in
        let guide = UILayoutGuide()
        self.view.addLayoutGuide(guide)
        guide.snp.makeConstraints({ (make) in
            make.top.bottom.left.right.equalTo(self.view)
            
        })
        return guide
    }()
    var guideLayout:UILayoutGuide {
        get {
            return self.guide
        }
    }
    
    var safe:UILayoutGuide {
        get {
            if #available(iOS 11.0, *) {
                return self.view.safeAreaLayoutGuide
            } else {
                return self.guideLayout
            }
            
        }
    }
    func automaticallyAdjustsSetting(scrollView:UIScrollView) {
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never;
        } else {
            self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0);
            self.automaticallyAdjustsScrollViewInsets = false;
        }
    }
    func hiddenNavigationBarLine() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    }
    func hiddenNavigationLeftItem() {
        let leftEmptyItem = UIBarButtonItem.init()
        self.navigationItem.leftBarButtonItem = leftEmptyItem;
       
    }
    func isHeightVersion() -> Bool {
        let version = UIDevice.current.systemVersion
        let versionFloat = version._bridgeToObjectiveC().floatValue
        return versionFloat >= 11
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBarSetting()
        self.viewSetting()
        self.viewDidSet()
        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
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
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        guard self.navigationController?.viewControllers.count ?? 0 <= 1 else {
            let leftItem = UIBarButtonItem.init(image: UIImage.init(named: "dict_iconbigreturn"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(leftBarItemAction(leftItem:)))
            self.navigationItem.leftBarButtonItem = leftItem
            return
        }
    }
    func viewSetting() {
        self.view.backgroundColor = UIColor.white
       
    }
    func viewDidSet() {
        
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


