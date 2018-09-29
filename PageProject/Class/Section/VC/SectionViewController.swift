//
//  SectionViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/28.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class SectionViewController: RootViewController {
    let sectionTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.navigationItem.title = "SectionA"
        self.navigationController?.navigationBar.barTintColor = ColorExtension().bottomGray
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    override func viewSetting() {
        super.viewSetting()
        view.backgroundColor = ColorExtension().bottomGray
        view.addSubview(sectionTableView)
        sectionTableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view.safeAreaLayoutGuide)
        }
        sectionTableView.backgroundColor = ColorExtension().bottomGray
        sectionTableView.delegate = self as UITableViewDelegate
        sectionTableView.dataSource = self as UITableViewDataSource
        sectionTableView.estimatedRowHeight = 40;
        sectionTableView.rowHeight = UITableViewAutomaticDimension;
        sectionTableView.separatorStyle = .none
        sectionTableView.rowHeight = UIScreen.main.bounds.size.width * 3 / 8
        sectionTableView.register(UINib.init(nibName: "SectionTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "SectionTableViewCell")
        
        sectionTableView.estimatedSectionHeaderHeight = UIScreen.main.bounds.size.width  / 2
        sectionTableView.sectionHeaderHeight = UITableViewAutomaticDimension
        sectionTableView.register(UINib.init(nibName: "SectionHeaderView", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "SectionHeaderView")
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
extension SectionViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionTableViewCell", for: indexPath) as! SectionTableViewCell
        return cell
    }
    
    
}
extension SectionViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeaderView")
        return headerView;
    }
   
}
