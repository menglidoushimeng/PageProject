//
//  BookViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/14.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

import RxDataSources
import RxSwift
import RxCocoa
import SwViewCapture

class BookViewController: RootViewController {
    let bookViewModel = BookViewModel()
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
        lazyShareView.shareActionStyle = { [weak self](style:ShareActionStyle) in
            self?.shareImgCustion(style)
          //  self?.bookViewModel.shareActionStyle(style)
            self?.cover.removeFromSuperview()
            
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
            make.top.bottom.left.right.equalTo(self.safe)
        }
        self.bookTableView.dataSource = self as UITableViewDataSource
        self.bookTableView.delegate = self as UITableViewDelegate
        self.bookTableView.register(UINib.init(nibName: "BookHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "BookHeaderTableViewCell")
        self.bookTableView.register(UINib.init(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        self.bookTableView.separatorStyle = UITableViewCellSeparatorStyle.none

        
        self.bookTableView.rx.itemSelected.subscribe(onNext: { (indexPath) in
             self.bookViewModel.didSelectRowAt(self.bookTableView,  indexPath)
        }).disposed(by: disposeBag)
    }
    
    
    /// 制作分享图
    func shareImgCustion(_ style:ShareActionStyle) {
        self.bookTableView.swContentScrollCapture({ (image) in
            let img = UIImage.init(named: "dict_qr")
            let megreImg = ImageTool.mergeImges(image!, img!, CGRect.init(x: image!.size.width - 70, y: 0, width: 70, height: 70))

            var headImg = UIImage.init(named: "13")
            headImg = ImageTool.cornerImage(headImg!, CGSize.init(width: 40, height: 40), 20)

            let megreHeadImg = ImageTool.mergeImges(megreImg, headImg!, CGRect.init(x: 10, y: 10, width: 40, height: 40))
            
            let megreStringImg = ImageTool.mergeImges(megreHeadImg, "昵称", CGPoint.init(x: 55, y: 18), ColorExtension().middenGray, UIFont.systemFont(ofSize: 23, weight: UIFont.Weight(rawValue: -1)))
            
            let shareImg = UIImageView.init(image: megreStringImg)
            shareImg.frame = CGRect.init(x: 0, y: 30, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 30)
            shareImg.contentMode = UIViewContentMode.scaleAspectFit
            UIApplication.shared.keyWindow?.addSubview(shareImg)
        })
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
        return bookViewModel.cellForRow(tableView,indexPath)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return bookViewModel.numberOfSection(in:tableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookViewModel.numberOfRowsInSection(tableView, section)
    }
}
extension BookViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return  bookViewModel.heightForRowAt(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}

extension BookViewController: BookViewModelDelegate {
    func shareViewShow() {
        UIApplication.shared.keyWindow?.addSubview(self.cover)
    }
    func didSelectedCell(_ model: RootTableViewCellModel) {
        let wordVC = WordViewController()
        wordVC.navigationBarHidden = true
        self.navigationController?.pushViewController(wordVC, animated: true)
    }
    
    
}
