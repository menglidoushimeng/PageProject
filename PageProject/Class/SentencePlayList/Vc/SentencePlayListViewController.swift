//
//  SentencePlayListViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/2/20.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class SentencePlayListViewController: RootUnNaviProgressBarViewController {

    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var footView: UIView!
    

    private let blueLineView = UIView()
    private var dataSource:Array = [1,2,3,4,5,6,7,8,9,10]
    private var playRow:NSInteger  = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func navigationBarSetting() {
        super.navigationBarSetting()
        progressView.backgroundColor = ColorExtension().lineGray
        progressView.snp.updateConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.size.width)
        }
        rightBtn.isHidden = true
        
        progressView.addSubview(blueLineView)
        blueLineView.backgroundColor = ColorExtension().wordBlue
        blueLineView.snp.makeConstraints { (make) in
            make.top.bottom.left.equalToSuperview()
            make.width.equalTo(2)
        }
    }
    override func viewSetting() {
        super.viewSetting()
        let headGradientLayer = CAGradientLayer()
        headGradientLayer.frame = self.headView.bounds
        headGradientLayer.colors = [UIColor.white.cgColor,UIColor.white.withAlphaComponent(0).cgColor]
        
        headView.layer.addSublayer(headGradientLayer)
        
        let footGradientLayer = CAGradientLayer()
        footGradientLayer.frame = self.footView.bounds
       footGradientLayer.colors = [UIColor.white.withAlphaComponent(0).cgColor,UIColor.white.cgColor]
        footView.layer.addSublayer(footGradientLayer)
        
        listTableView.register(UINib.init(nibName: "SentencePlayListTableViewCell", bundle: nil), forCellReuseIdentifier: "SentencePlayListTableViewCell")
        listTableView.dataSource = self
        listTableView.delegate = self
        
        listTableView.backgroundColor = ColorExtension().bottomYellow
        if self.dataSource.count > 0 {
            listTableView.scrollToRow(at: IndexPath.init(row: playRow, section: 1 ) , at: .middle, animated: false)
            animation( )
        }
       
    }
    @IBAction func leftBtnAction(_ sender: UIButton) {
        let selectedUnitView = SelectedUnitView.init(frame: UIScreen.main.bounds) as SelectedUnitView
        UIApplication.shared.keyWindow?.addSubview(selectedUnitView)
    }
    
    @IBAction func rightBtnAction(_ sender: UIButton) {

        let unitSetView = Bundle.main.loadNibNamed("UnitSetView", owner: self, options: nil)?.first as! UnitSetView
        unitSetView.frame = UIScreen.main.bounds
        UIApplication.shared.keyWindow?.addSubview(unitSetView)
    }
    @IBAction func playBtnAction(_ sender: UIButton) {
        sender.isSelected  = !sender.isSelected
        if sender.isSelected {
            suspendPulse()
        } else {
            resumePulse()
        }
    }
    func animation() {
        blueLineView.layer.removeAnimation(forKey: "play")
        
        let baseAnimation = CABasicAnimation.init(keyPath: "position.x")
        baseAnimation.fromValue = NSNumber.init(value: 0)
        baseAnimation.toValue = NSNumber.init(value: NSInteger(UIScreen.main.bounds.size.width))
        baseAnimation.duration = 5
    
        baseAnimation.repeatCount = 1
        //防止动画接收后回到初始状态
        baseAnimation.isRemovedOnCompletion = false
        baseAnimation.fillMode = kCAFillModeForwards
        
        blueLineView.layer.add(baseAnimation, forKey: "play")
        
       
    }
    /// 恢复／启动动画
    func resumePulse() {
        let pausedTime = blueLineView.layer.timeOffset
        blueLineView.layer.speed = 1.0
        blueLineView.layer.timeOffset = 0.0
        blueLineView.layer.beginTime = 0.0
        let timeSincePauce = blueLineView.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        blueLineView.layer.beginTime = timeSincePauce
    }
    /// 暂停动画
    func suspendPulse() {
        let pausedTime = blueLineView.layer.convertTime(CACurrentMediaTime(), from: nil)
        blueLineView.layer.speed = 0.0
        blueLineView.layer.timeOffset = pausedTime
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
extension SentencePlayListViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section != 1  {
            return UIScreen.main.bounds.height / 2
        } else {
           return UITableViewAutomaticDimension
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // 前后有空白cel
        if section == 1 {
            return dataSource.count
        } else {
            return 1
        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section != 1 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "BLACKCELL")
            if cell == nil {
                cell = UITableViewCell.init(style: .default, reuseIdentifier:"BLACKCELL")
                cell!.backgroundColor = ColorExtension().bottomYellow
                cell?.selectionStyle = .none
            }
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SentencePlayListTableViewCell", for: indexPath) as! SentencePlayListTableViewCell
            cell.playBtn.isHidden = !(indexPath.row == playRow)
            cell.backgroundColor = ColorExtension().bottomYellow
           
            return cell
        }
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            self.playRow = indexPath.row
            tableView.reloadData()
            tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
            animation()
        }
      
    }

}
