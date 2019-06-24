//
//  SoundsViewHeader.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/11/27.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class SoundsViewHeader: UIView {

    @IBOutlet weak var recordingImageView: UIImageView!
    @IBOutlet weak var recordStatesLb: UILabel!
    @IBOutlet weak var myPirceLb: UILabel!
    @IBOutlet weak var playRecordBtn: UIButton!
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var soloBtn: UIButton!
    @IBOutlet weak var priceLb: UILabel!
    @IBOutlet weak var tagImageView: UIImageView!
    @IBOutlet weak var chineseLb: UILabel!
    @IBOutlet weak var englishLb: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
         super.awakeFromNib()
        recordBtn.layer.cornerRadius = recordBtn.frame.size.height / 2
        playRecordBtn.layer.cornerRadius = playRecordBtn.frame.size.height / 2
    }
    @IBAction func soloAction(_ sender: UIButton) {
    }
    @IBAction func recordTouchDown(_ sender: UIButton) {
        print("点击按钮")
        self.recordingImageView.isHidden = false
        self.recordStatesLb.text = "录音中..."
    }
    let disposeBag = DisposeBag()
    @IBAction func recordTouchUp(_ sender: UIButton) {
        print("离开按钮")
        self.recordingImageView.isHidden = true
        let activity = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        let x = (sender.frame.size.width - sender.frame.size.height) / 2
        activity.frame = CGRect.init(x: x, y: 0, width: sender.frame.size.height, height: sender.frame.size.height)
        sender.addSubview(activity)
        activity.startAnimating()
        sender.setImage(nil, for: .normal)
        sender.isUserInteractionEnabled = false
        self.recordStatesLb.text = "打分..."
         let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        observable.takeWhile{$0 < 4}.subscribe(onNext: { (time) in
           
        }, onCompleted: {
            activity.removeFromSuperview()
            sender.setImage(UIImage.init(named: "dict_passagespeak"), for: .normal)
            sender.isUserInteractionEnabled = true
            self.recordStatesLb.text = "按住录音"
        }).disposed(by: self.disposeBag)
        
        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: 3)) {
//            activity.removeFromSuperview()
//            sender.setImage(UIImage.init(named: "dict_passagespeak"), for: .normal)
//            sender.isUserInteractionEnabled = true
//        }

    }
    @IBAction func playRecordAction(_ sender: UIButton) {
    }
    
}
