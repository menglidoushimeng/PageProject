//
//  SectionViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/28.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class SectionViewController: RootUnShowStatesViewController {
    let sectionTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func navigationBarSetting() {
        super.navigationBarSetting()
        
       self.navigationBarHidden = true
    }
    override func viewSetting() {
        super.viewSetting()
        self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = ColorExtension().bottomGray
        view.addSubview(sectionTableView)
        sectionTableView.snp.makeConstraints { (make) in
             make.top.left.bottom.right.equalTo(self.safe)
           
        }
        sectionTableView.bounces = false
        sectionTableView.showsHorizontalScrollIndicator = false
        sectionTableView.showsVerticalScrollIndicator = false
        sectionTableView.backgroundColor = ColorExtension().bottomGray
        sectionTableView.delegate = self as UITableViewDelegate
        sectionTableView.dataSource = self as UITableViewDataSource
        sectionTableView.estimatedRowHeight = 100;
        sectionTableView.rowHeight = UITableViewAutomaticDimension;
        sectionTableView.separatorStyle = .none
        
        sectionTableView.register(UINib.init(nibName: "SectionTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "SectionTableViewCell")
        
        sectionTableView.estimatedSectionHeaderHeight = UIScreen.main.bounds.size.width  / 2 + 44
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionTableViewCell", for: indexPath) as! SectionTableViewCell
        if indexPath.row % 2 == 0 {
            cell.cellState = .understand
        } else {
            cell.cellState = .grasp
        }
        return cell
    }
    
    
}
extension SectionViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeaderView") as! SectionHeaderView
        headerView.delegate = self
        return headerView;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let alert = UIAlertController.init(title: "选择页面", message: "", preferredStyle: .actionSheet)
        let action1 = UIAlertAction.init(title: "页面1", style: .default) { (action) in
            let vc = SelectedViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        alert.addAction(action1)
        
        let action2 = UIAlertAction.init(title: "页面2", style: .default) { (action) in
            let vc = CombinationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        alert.addAction(action2)
        
        let action3 = UIAlertAction.init(title: "页面3", style: .default) { (action) in
            let vc = SelectedSectenceViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        alert.addAction(action3)
        
        let action4 = UIAlertAction.init(title: "页面4", style: .default) { (action) in
            let vc = SoundsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        alert.addAction(action4)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
   
}
extension SectionViewController:SectionHeaderDelegate {
    func trunBackFunction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func stateFunction() {
        print("掌握状态")
    }
    func challengeFunction() {
        print("挑战奥金星")
    }
    
}
