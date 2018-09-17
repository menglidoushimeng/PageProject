//
//  WordViewController.swift
//  PageProject
//
//  Created by tiao on 2018/9/15.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {

    var headerView = WordHeaderView()
    var wordTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //添加导航栏右边按钮
        addNaviShareRiehtBtn()
        //添加headerView
        addHeaderView()
        //添加TablaeView
        addTableView()
    }
    
    //添加导航栏右边按钮
    func  addNaviShareRiehtBtn(){
        let shareBtn = UIButton()
        let backBtn = UIButton()
        
        shareBtn.frame = CGRect(x: 0, y: 0, width: 44, height: 40)
        shareBtn.setTitle("分享", for: .normal)
        shareBtn.setTitleColor(UIColor.black, for: .normal)
        shareBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        shareBtn.addTarget(self, action:#selector(shareAction(_:)), for:.touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareBtn)
        
        backBtn.frame = CGRect(x: 0, y: 0, width: 44, height: 40)
        backBtn.setImage(UIImage.init(named: "back"), for: .normal)
        backBtn.addTarget(self, action: #selector(backAction(_:)), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
    }
    
    //分享按钮点击事件
    @objc func shareAction(_ button:UIButton) {
        print("我摁下了这个按钮")
    }
    
    //返回按钮点击事件
    @objc func backAction(_ button:UIButton){
        self.navigationController?.popViewController(animated:true)
    }
    
    //添加headerView
    func addHeaderView(){
        headerView.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 140)
        self.view.addSubview(headerView)
    }
    //添加TablaeView
    func addTableView(){
        wordTableView = UITableView(frame: CGRect(x: 0, y: 64+140, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-64-140))
        
        self.view.addSubview(wordTableView)
        wordTableView.delegate = self as UITableViewDelegate
        wordTableView.dataSource = self as UITableViewDataSource
        wordTableView.separatorStyle = .none
        
        wordTableView.register(WordSectionTableViewCell.self, forCellReuseIdentifier: "WordSectionTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



extension WordViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordSectionTableViewCell", for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}

extension WordViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}


