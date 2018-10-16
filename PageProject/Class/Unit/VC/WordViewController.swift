//
//  WordViewController.swift
//  PageProject
//
//  Created by tiao on 2018/9/15.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class WordViewController: RootUnShowStatesViewController {

    var headerView = WordHeaderView()
    let wordViewModel = WordViewModel()
    
    var wordTableView : UITableView!
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
        lazyShareView.shareActionStyle = { [weak self](style:ShareActionStyle) in
            if style != .cancel {
                self?.shareImgCustion(style)
            }
            self?.cover.removeFromSuperview()
        }
        return lazyShareView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewSetting() {
        super.viewSetting()
        wordViewModel.getDataSouce()
        wordViewModel.tabDelegate = self as RootTableViewViewModelDelegate
        self.view.backgroundColor = UIColor.white
        //添加headerView
        addHeaderView()
        //添加TablaeView
        addTableView()
    }
   
    
    //添加headerView
    func addHeaderView(){
        headerView.delegate = self
        self.view.addSubview(headerView);
        self.headerView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.safe)
            make.height.equalTo(160)
        }
    }
    //添加TablaeView
    func addTableView(){
        wordTableView = UITableView()
        
        self.view.addSubview(wordTableView)
        wordTableView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(self.safe)
            make.top.equalTo(self.headerView.snp.bottom)
        }
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
    /// 制作分享图
    func shareImgCustion(_ style:ShareActionStyle) {
        self.headerView.swCapture { (header) in
            ImageTool.addUserInfo(header!, UIImage.init(named: "13")!, "昵称", { (headerImg) in
                self.wordTableView.swContentScrollCapture({ (tableImg) in
                    let megreImg = ImageTool.jointImges(CGSize.init(width: (headerImg?.size.width)!, height: (headerImg?.size.height)! + (tableImg?.size.height)!), headerImg!, tableImg!, CGRect.init(x: 0, y: (headerImg?.size.height)!, width: (tableImg?.size.width)!, height: (tableImg?.size.height)!))

                    let shareImg = UIImageView.init(image: megreImg)
                    shareImg.frame = UIScreen.main.bounds
                    shareImg.contentMode = UIViewContentMode.scaleAspectFit
                    shareImg.backgroundColor = UIColor.white
                    UIApplication.shared.keyWindow?.addSubview(shareImg)
                    shareImg.isUserInteractionEnabled = true;
                    shareImg.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(self.tapAction(_:))))
                })
                
            })
            
            
            
        }
        
        
    }
    @objc func tapAction(_ tap:UITapGestureRecognizer) {
        tap.view?.removeFromSuperview()
    }
}



extension WordViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordViewModel.numberOfRowsInSection(tableView,section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return wordViewModel.cellForRow(tableView,indexPath)
    }
    
}
extension WordViewController : UITableViewDelegate {
    
    
}
extension WordViewController : HeaderViewDelegate {
    func turnBackAction() {
       self.navigationController?.popViewController(animated: true)
    }
    
    func shareAction() {
        UIApplication.shared.keyWindow?.addSubview(self.cover)
    }
    func listText() {
        print("听课文")
    }
    func wordsCard() {
        print("单词卡")
    }
    func sentenceCard() {
        print("短语卡")
    }
    
    
}

extension WordViewController:RootTableViewViewModelDelegate {
    func didSelectedCell(_ model: RootTableViewCellModel) {
        let sectionVc =  SectionViewController()
        sectionVc.navigationBarHidden = false
        self.navigationController?.pushViewController(sectionVc, animated: true)
    }
    
}

