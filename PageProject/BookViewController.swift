//
//  BookViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/14.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet weak var bookTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSetting()

        // Do any additional setup after loading the view.
    }
    func viewSetting() {
        self.bookTableView.dataSource = self as UITableViewDataSource
        self.bookTableView.delegate = self as UITableViewDelegate
        self.bookTableView.register(UINib.init(nibName: "BookHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "BookHeaderTableViewCell")
        self.bookTableView.register(UINib.init(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        self.bookTableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BookViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookHeaderTableViewCell", for: indexPath) as! BookHeaderTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
}
extension BookViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UIScreen.main.bounds.size.width
        } else {
            return 80
        }
    }
}
