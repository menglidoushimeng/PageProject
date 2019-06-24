//
//  SoundsViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/11/27.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

class SoundsViewController: RootUnNaviProgressBarViewController {
    let soundsTable = UITableView.init(frame: CGRect.zero, style: .grouped)

    var selectedIndex = IndexPath.init(row: 0, section: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(naviBarView)
        naviBarView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.rightBtn.snp.centerY)
        }
        // Do any additional setup after loading the view.
    }
    let naviBarView = Bundle.main.loadNibNamed("SoundNaviBarHeader", owner: self, options: nil)?.first as! SoundNaviBarHeader
    override func navigationBarSetting() {
        super.navigationBarSetting()
     
    }
    override func viewSetting() {
        super.viewSetting()
        
        self.rightBtn.setImage(UIImage.init(named: "dict_icontextshare"), for: .normal)
        
        self.view.addSubview(soundsTable)

        soundsTable.showsVerticalScrollIndicator = false
        soundsTable.showsHorizontalScrollIndicator = false
        soundsTable.bounces = false
        soundsTable.sectionFooterHeight = UIScreen.main.bounds.size.height - 200
        soundsTable.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.safe)
            make.top.equalTo(self.turnBackBtn.snp.bottom)
        }
        
        soundsTable.register(UINib.init(nibName: String(describing: type(of:SoundsTableViewCell())), bundle: nil), forCellReuseIdentifier:  String(describing: type(of:SoundsTableViewCell())))
        
        soundsTable.register(UINib.init(nibName: String(describing: type(of:SoundsSelectedTableViewCell())), bundle: nil), forCellReuseIdentifier:  String(describing: type(of:SoundsSelectedTableViewCell())))
        
        soundsTable.delegate = self
        soundsTable.dataSource = self

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
        
        coverView.addSubview(self.shareCommonView)
        self.shareCommonView.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.size.width / 2)
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
        self.shareView.isHidden = false
        self.shareCommonView.isHidden = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    lazy var shareCommonView:ShareCommonView = {() -> ShareCommonView in
        let lazyShareView = Bundle.main.loadNibNamed("ShareCommonView", owner: self, options: nil)?.first as! ShareCommonView
        lazyShareView.shareActionStyle = { [weak self](style:ShareActionStyle) in
            if style != .cancel {
               
            }
            //  self?.bookViewModel.shareActionStyle(style)
            self?.cover.removeFromSuperview()
            
        }
        return lazyShareView
    }()
    
}
extension SoundsViewController: UITableViewDelegate {
    
}

extension SoundsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView()
        footView.backgroundColor = UIColor.white
        return footView
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if selectedIndex != indexPath {
            let cell = tableView.dequeueReusableCell(withIdentifier:  String(describing: type(of:SoundsTableViewCell())), for: indexPath) as! SoundsTableViewCell
            cell.selectionStyle = .none
            switch indexPath.row % 4 {
            case 0:
                do {
                    cell.cellColor = .grayDark
                }
                break
            case 1:
                do {
                    cell.cellColor = .glodenDark
                }
                break
            case 2:
                do {
                    cell.cellColor = .greenDark
                }
                break
            case 3:
                do {
                    cell.cellColor = .redDark
                }
                break
            default: break
            }
            
            return cell
        } else {
             let cell = tableView.dequeueReusableCell(withIdentifier:  String(describing: type(of:SoundsSelectedTableViewCell())), for: indexPath) as! SoundsSelectedTableViewCell
             cell.selectionStyle = .none
            return cell
        }
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndex as IndexPath != indexPath {
            selectedIndex = indexPath
            tableView.reloadData()
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath != selectedIndex {
            return 100
        } else {
            return 200
        }
    }
    
}
extension SoundsViewController: ShareRecordViewDelegate {
    func shareSoundsFunc() {
        self.shareView.isHidden = true
        self.shareCommonView.isHidden = false
    }
    
    func shareAchievementFunc() {
        self.cover.removeFromSuperview()
        UIApplication.shared.keyWindow?.addSubview(self.shareRecordView)
    }
    
    
}
