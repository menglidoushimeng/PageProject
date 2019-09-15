//
//  ReadingViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/6/15.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit
import Accelerate

enum ReadingStatus {
    case browse // 浏览
    case listen // 听写
    case sleep // 睡前
    case read // 早读
    case bySelf // 自测
}

@available(iOS 10.0, *)
class ReadingViewController: RootViewController {
    
    @IBOutlet weak var coverImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
       
    }
    var selectedSender :UIButton?
    var readStatus = ReadingStatus.browse
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.navigationController?.navigationBar.barTintColor = UIColor.hex(hexString: "#F4F5F6")
        self.hiddenNavigationBarLine()
        self.navigationItem.title = "单词卡"
        let rightItem = UIBarButtonItem.init(image: UIImage.init(named: "dict_icontextshare")!.withRenderingMode(.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightBarItemAction(rightItem:)))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    override func viewSetting() {
        super.viewSetting()
        self.view.backgroundColor = UIColor.hex(hexString: "#F4F5F6")
        self.selectedSender = browseSender
        self.selectedSender?.isSelected = true
       
     
    }
    @objc  func rightBarItemAction(rightItem:UIButton)  {
        
    }
    
    lazy var blurView:UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        //创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        self.coverImgView.addSubview(blurView)
        return blurView
    }()
    
    lazy var context: CIContext = {
        return CIContext(options: nil)
    }()
    
    @IBOutlet weak var coverView: UIView!
    
    
    @IBOutlet weak var backGroundView: UIView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
        
        self.layerSetting()

        
  
        
    }
    var topleftGradientLayer:CAGradientLayer?
    var toprightGradientLayer:CAGradientLayer?
    var bottomleftGradientLayer:CAGradientLayer?
    var bottomrightGradientLayer:CAGradientLayer?
    func layerSetting() {
                self.backGroundView.layer.cornerRadius = 10;
                //定义渐变的颜色（从黄色渐变到橙色）
                let topColor = UIColor.black.withAlphaComponent(0.3)
                let buttomColor = UIColor.clear
                let gradientColors = [topColor.cgColor, buttomColor.cgColor]
        
                //定义每种颜色所在的位置
        
                //创建CAGradientLayer对象并设置参数
                topleftGradientLayer?.removeFromSuperlayer()
                topleftGradientLayer = CAGradientLayer()
                topleftGradientLayer!.colors = gradientColors
        //        gradientLayer.locations = gradientLocations
                topleftGradientLayer!.startPoint = CGPoint.init(x: 0, y: 0)
                topleftGradientLayer!.endPoint = CGPoint.init(x: 0.3, y: 0.3)
        
                //设置其CAGradientLayer对象的frame，并插入view的layer
                topleftGradientLayer!.frame = self.coverImgView.frame
                self.coverImgView.layer.insertSublayer(topleftGradientLayer!, at: 0)
        
        
                //创建CAGradientLayer对象并设置参数
                toprightGradientLayer?.removeFromSuperlayer()
                toprightGradientLayer = CAGradientLayer()
                toprightGradientLayer!.colors = gradientColors
                //        gradientLayer.locations = gradientLocations
                toprightGradientLayer!.startPoint = CGPoint.init(x: 1, y: 0)
                toprightGradientLayer!.endPoint = CGPoint.init(x: 0.7, y: 0.3)
        
                //设置其CAGradientLayer对象的frame，并插入view的layer
                toprightGradientLayer!.frame = self.coverImgView.frame
                self.coverImgView.layer.insertSublayer(toprightGradientLayer!, at: 0)
        
        
                bottomleftGradientLayer?.removeFromSuperlayer()
                bottomleftGradientLayer = CAGradientLayer()
                bottomleftGradientLayer!.colors = gradientColors
                //        gradientLayer.locations = gradientLocations
                bottomleftGradientLayer!.startPoint = CGPoint.init(x: 0, y: 1)
                bottomleftGradientLayer!.endPoint = CGPoint.init(x: 0.3, y: 0.7)
        
                //设置其CAGradientLayer对象的frame，并插入view的layer
                bottomleftGradientLayer!.frame = self.coverImgView.frame
                self.coverImgView.layer.insertSublayer(bottomleftGradientLayer!,at: 0)
        
        
                bottomrightGradientLayer?.removeFromSuperlayer()
                bottomrightGradientLayer = CAGradientLayer()
                bottomrightGradientLayer!.colors = gradientColors
                //        gradientLayer.locations = gradientLocations
                bottomrightGradientLayer!.startPoint = CGPoint.init(x: 1, y: 1)
                bottomrightGradientLayer!.endPoint = CGPoint.init(x: 0.7, y: 0.7)
        
                //设置其CAGradientLayer对象的frame，并插入view的layer
                bottomrightGradientLayer!.frame = self.coverImgView.frame
                self.coverImgView.layer.insertSublayer(bottomrightGradientLayer!, at: 0)
        
//                let image = self.coverImgView.image!
        
//                let parameters: [String: Any] = [kCIInputRadiusKey: 10, kCIInputImageKey: image]
//                guard let filter = CIFilter(name: "CIGaussianBlur", withInputParameters: parameters) else { fatalError() }
//                guard let outputImage = filter.outputImage else { fatalError() }
//
//                self.coverImgView.image = UIImage.init(ciImage: outputImage )
//                let ciImage = (image.ciImage != nil) ? image.ciImage : CIImage(image: image)


//                self.coverImgView.image = UIImage(ciImage: gaussianBlur(radius: 1)(ciImage!))
//                self.coverImgView.contentMode = .scaleAspectFill
                blurView.frame = self.coverImgView.bounds;
    }
    @IBOutlet weak var browseSender: UIButton!
    
    @IBAction func browseAction(_ sender: UIButton) {
        self.readStatus = .browse
        self.senderSelected(sender);
    }
    
    @IBOutlet weak var listenSender: UIButton!
    
    @IBAction func listenAction(_ sender: UIButton) {
        self.readStatus =  .listen
        self.senderSelected(sender);
    }
    
    @IBOutlet weak var sleepSender: UIButton!
    
    @IBAction func sleepAction(_ sender: UIButton) {
        self.readStatus = .sleep
        self.senderSelected(sender)
    }
    
    @IBOutlet weak var readSender: UIButton!
    
    @IBAction func readAction(_ sender: UIButton) {
        self.readStatus = .read
        self.senderSelected(sender)
    }
    
    @IBOutlet weak var selfSender: UIButton!
    
    @IBAction func selfAction(_ sender: UIButton) {
        self.readStatus = .bySelf
        self.senderSelected(sender)
    }
    func senderSelected(_ sender:UIButton)  {
        selectedSender?.isSelected = false
        selectedSender?.backgroundColor = UIColor.white
        sender.isSelected = true
        sender.backgroundColor = UIColor.hex(hexString: "#f4f5f6")
        selectedSender = sender
    }
    @IBAction func readSetAction(_ sender: UIButton) {
        switch self.readStatus {
        case .browse:
            do {
                let readSetView = Bundle.main.loadNibNamed("ReadBrowseSetView", owner: self, options: nil)?.first as! ReadBrowseSetView
                UIApplication.shared.keyWindow?.addSubview(readSetView)
                readSetView.snp.makeConstraints { (make) in
                    make.left.right.top.equalToSuperview()
                    make.bottom.equalTo(self.browseSender.snp.top)
                }
                break
        }
        case .listen:
            do {
                let readSetView = Bundle.main.loadNibNamed("ReadListenSetView", owner: self, options: nil)?.first as! ReadListenSetView
                UIApplication.shared.keyWindow?.addSubview(readSetView)
                readSetView.snp.makeConstraints { (make) in
                    make.left.right.top.equalToSuperview()
                    make.bottom.equalTo(self.browseSender.snp.top)
                }
                break
            }
        case .sleep:
            do {
                let sleepSetView = Bundle.main.loadNibNamed("ReadSetView", owner: self, options: nil)?.first as! ReadSetView
                UIApplication.shared.keyWindow?.addSubview(sleepSetView)
                sleepSetView.snp.makeConstraints { (make) in
                    make.left.right.top.equalToSuperview()
                    make.bottom.equalTo(self.browseSender.snp.top)
                }
                break
            }
        case .read:
            do {
                let readSetView = Bundle.main.loadNibNamed("ReadMorningSetView", owner: self, options: nil)?.first as! ReadMorningSetView
                UIApplication.shared.keyWindow?.addSubview(readSetView)
                readSetView.snp.makeConstraints { (make) in
                    make.left.right.top.equalToSuperview()
                    make.bottom.equalTo(self.browseSender.snp.top)
                }
                break
            }
        case .bySelf:
            do {
                let readSetView = Bundle.main.loadNibNamed("ReadSelfSetView", owner: self, options: nil)?.first as! ReadSelfSetView
                UIApplication.shared.keyWindow?.addSubview(readSetView)
                readSetView.snp.makeConstraints { (make) in
                    make.left.right.top.equalToSuperview()
                    make.bottom.equalTo(self.browseSender.snp.top)
                }
                break
            }
        }
    }
    @IBAction func beginAction(_ sender: UIButton) {
        switch self.readStatus {
        case .browse:
            do {
             let browseView = WordModelLightViewController()
                browseView.viewStates = .browse
             self.navigationController?.pushViewController(browseView, animated: true)
            }
             break;
        case .listen:
            do {
                let lsitenView = WordModeListenViewController()
                self.navigationController?.pushViewController(lsitenView, animated: true)
            }
             break;
        case .sleep:
            do {
                let sleepView = WordModeViewController()
                self.navigationController?.pushViewController(sleepView, animated: true)
            }
             break;
        case .read:
            do {
                let readView = WordModelLightViewController()
                readView.viewStates = .read
                self.navigationController?.pushViewController(readView, animated: true)
            }
             break;
        case .bySelf:
            do {
                let bySelfView = WordModelLightViewController()
                bySelfView.viewStates = .bySelf
                self.navigationController?.pushViewController(bySelfView, animated: true)
//                let bySelfView = WordModeListViewController()
//                self.navigationController?.pushViewController(bySelfView, animated: true)
            }
             break;
        }
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



