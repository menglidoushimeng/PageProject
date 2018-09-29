//
//  BookViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/14.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit




class BookViewController: RootViewController {
     var bookViewModel = BookViewModel();
     var bookTableView = UITableView()
    lazy var cover:Cover = { () -> Cover in
        let coverView = Cover.init(frame: UIScreen.main.bounds, block: {
            
        }, color: UIColor.black.withAlphaComponent(0.7), removeSelf: true)
        coverView.addSubview(self.shareView)
        self.shareView.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.size.width / 2)
        })
        return coverView
    }()
    lazy var shareView:ShareCommonView = {() -> ShareCommonView in
        let lazyShareView = Bundle.main.loadNibNamed("ShareCommonView", owner: self, options: nil)?.first as! ShareCommonView
        lazyShareView.shareActionStyle = { (style:ShareActionStyle) in
            
        }
        return lazyShareView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    override func viewSetting() {
        super.viewSetting();
        self.bookViewModel.bookDelegate = self;
        self.view.addSubview(bookTableView)
        bookTableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
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
        return bookViewModel.cellForRow(tableView:tableView,indexPath: indexPath)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return bookViewModel.numberOfSection(in:tableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookViewModel.numberOfRowsInSection(tableView:tableView, section:section)
    }
}
extension BookViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return  bookViewModel.heightForRowAt(tableView: tableView, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        bookViewModel.didSelectRowAt(tableView: tableView, indexPath: indexPath)
    }
}

extension BookViewController: BookViewModelDelegate {
    func shareViewShow() {
        UIApplication.shared.keyWindow?.addSubview(self.cover)
    }
    
    func onNextViewController() {
        let wordVC = WordViewController()
        wordVC.navigationBarHidden = true
        self.navigationController?.pushViewController(wordVC, animated: true)
    }
    
}
