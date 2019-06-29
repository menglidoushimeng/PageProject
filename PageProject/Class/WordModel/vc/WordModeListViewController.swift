//
//  WordModeListViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/6/25.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class WordModeListViewController: RootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var wordListTable: UITableView!
    
    override func viewSetting() {
         super.viewSetting()
        
        self.wordListTable.register(UINib.init(nibName: "WordModeListTableViewCell", bundle: nil), forCellReuseIdentifier: "WordModeListTableViewCell");
        self.wordListTable.rowHeight = 20
        self.wordListTable.dataSource = self
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

extension WordModeListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordModeListTableViewCell", for: indexPath)
        return cell
    }
}
