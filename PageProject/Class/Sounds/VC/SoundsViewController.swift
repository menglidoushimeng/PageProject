//
//  SoundsViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/11/27.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

class SoundsViewController: RootUnNaviProgressBarViewController {
    let soundsTable = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewSetting() {
        super.viewSetting()
        self.rightBtn.setImage(UIImage.init(named: "dict_icontextshare"), for: .normal)
        
        self.view.addSubview(soundsTable)
        soundsTable.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.safe)
            make.top.equalTo(self.turnBackBtn.snp.bottom)
        }
        soundsTable.register(UINib.init(nibName: String(describing: type(of:SoundsTableViewCell())), bundle: nil), forCellReuseIdentifier:  String(describing: type(of:SoundsTableViewCell())))
        soundsTable.delegate = self
        soundsTable.dataSource = self
        soundsTable.estimatedRowHeight = 100
        soundsTable.rowHeight = UITableViewAutomaticDimension
        soundsTable.estimatedSectionHeaderHeight = 200
        soundsTable.sectionHeaderHeight = UITableViewAutomaticDimension
        soundsTable.separatorStyle  = .none
    }
    lazy var cover:Cover = { () -> Cover in
        let coverView = Cover.init(frame: UIScreen.main.bounds, block: {
            
        }, color: UIColor.black.withAlphaComponent(0.7), removeSelf: true)
        coverView.addSubview(self.shareView)
        
        self.shareView.snp.makeConstraints({ (make) in
            make.centerX.equalTo(coverView.snp.centerX)
            make.centerY.equalTo(coverView.snp.centerY)
            make.width.equalTo(UIScreen.main.bounds.size.width * 0.85)
        })
        return coverView
    }()
    lazy var shareView:ShareRecordView = {() -> ShareRecordView in
        let lazyShareView = Bundle.main.loadNibNamed("ShareRecordView", owner: self, options: nil)?.first as! ShareRecordView
        lazyShareView.delegate = self
        return lazyShareView
    }()
    
    lazy var shareRecordView:ShareRecordDetail = {() -> ShareRecordDetail in
        let lazyShareDetail = Bundle.main.loadNibNamed("ShareRecordDetail", owner: self, options: nil)?.first as!  ShareRecordDetail
        lazyShareDetail.frame = UIScreen.main.bounds
        return lazyShareDetail
    }()
    
    override func rightAction(_ sender: UIButton) {
        UIApplication.shared.keyWindow?.addSubview(cover)
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
extension SoundsViewController: UITableViewDelegate {
    
}

extension SoundsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("SoundsViewHeader", owner: self, options: nil)?.last as! SoundsViewHeader
        return headerView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  String(describing: type(of:SoundsTableViewCell())), for: indexPath) as! SoundsTableViewCell
        return cell
    }
    
    
}
extension SoundsViewController: ShareRecordViewDelegate {
    func shareAchievementFunc() {
        self.cover.removeFromSuperview()
        UIApplication.shared.keyWindow?.addSubview(self.shareRecordView)
    }
    
    
}
