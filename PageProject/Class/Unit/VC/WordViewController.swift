//
//  WordViewController.swift
//  PageProject
//
//  Created by tiao on 2018/9/15.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class WordViewController: RootViewController {

    var headerView = WordHeaderView()
    var wordTableView : UITableView!
    //隐藏状态栏

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //添加headerView
        addHeaderView()
        //添加TablaeView
        addTableView()
    }

    
   
    
    //添加headerView
    func addHeaderView(){
        headerView.delegate = self
        headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 140 + ScreenBounsConfig().NAVIGATIONBAR_HEIGHT)
        self.view.addSubview(headerView)
    }
    //添加TablaeView
    func addTableView(){
        wordTableView = UITableView(frame: CGRect(x: 0, y: 140 + ScreenBounsConfig().NAVIGATIONBAR_HEIGHT, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 140 - ScreenBounsConfig().NAVIGATIONBAR_HEIGHT))
        
        self.view.addSubview(wordTableView)
        wordTableView.delegate = self as UITableViewDelegate
        wordTableView.dataSource = self as UITableViewDataSource
        wordTableView.separatorStyle = .none
        wordTableView.estimatedRowHeight = 180
        wordTableView.rowHeight =  UITableViewAutomaticDimension
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordSectionTableViewCell", for: indexPath) as! WordSectionTableViewCell
        cell.selectionStyle = .none
        if indexPath.row % 2 == 0 {
            cell.cellStype = .leftTwoQuestionWithTitle
        } else {
            cell.cellStype = .rightTwoQuestion
        }
        return cell
    }
}
extension WordViewController : HeaderViewDelegate {
    func turnBackAction() {
       self.navigationController?.popViewController(animated: true)
    }
    
    func shareAction() {
        
    }
    
    
}
extension WordViewController : UITableViewDelegate {
   
    
}


