//
//  SearchViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/2/20.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
@available(iOS 10.0, *)
class SearchViewController: RootUnNavigationBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func action(_ sender: UIButton) {
        self.navigationController?.pushViewController(WordModeListViewController(), animated: true)
    }
    @IBAction func action1(_ sender: UIButton) {
        let vc = WriteSentenceViewController.init(keyBoardType: .normal, textViewType: .normal  )
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func action2(_ sender: UIButton) {
        let vc = WriteSentenceViewController.init(keyBoardType: .small, textViewType: .custom)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @available(iOS 10.0, *)
    @IBAction func action3(_ sender: UIButton) {
        let vc = ReadingViewController.init()
        self.navigationController?.pushViewController(vc, animated: true);
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
