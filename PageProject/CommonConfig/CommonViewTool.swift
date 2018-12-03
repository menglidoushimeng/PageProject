//
//  CommonViewTool.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/11/22.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class CommonViewTool: NSObject {
    class func addPriceView(_ bottomView:UIView,_ superView:UIView,_ disposeBag:DisposeBag) {
        let priceLb = UILabel();
        priceLb.text = "+5"
        priceLb.minimumScaleFactor = 5
        priceLb.textAlignment = .center
        priceLb.textColor = ColorExtension().starGold
        priceLb.frame = CGRect.init(x: bottomView.frame.origin.x + bottomView.frame.size.width / 2 - 30, y: bottomView.frame.origin.y + 10, width: 60, height: 0)
        superView.addSubview(priceLb)
        //Observable序列（每隔0.5秒钟发出一个索引数）
        let observable = Observable<Int>.interval(0.05, scheduler: MainScheduler.instance)
        
        observable.takeWhile{$0 < 30}.subscribe(onNext: { (time) in
            if time < 25 {
                priceLb.font = UIFont.systemFont(ofSize: CGFloat(time))
                var frame = priceLb.frame;
                frame.origin.y -= 2;
                frame.size.height = CGFloat(time)
                priceLb.frame = frame
            }
        }, onCompleted: {
            UIView.animate(withDuration: 1, animations: {
                priceLb.alpha = 0
            }, completion: { (bool) in
                priceLb.removeFromSuperview()
            })
            
        }).disposed(by: disposeBag)
    }
    
    class func addPriceViewToTable(_ bottomView:UIView,_ superView:UIView,_ disposeBag:DisposeBag) {
        let priceLb = UILabel();
        priceLb.text = "+5"
        priceLb.minimumScaleFactor = 5
        priceLb.textAlignment = .center
        priceLb.textColor = ColorExtension().starGold
        priceLb.frame = CGRect.init(x: bottomView.frame.origin.x + bottomView.frame.size.width / 2 - 30, y: superView.frame.size.height + 10, width: 60, height: 0)
        superView.addSubview(priceLb)
        //Observable序列（每隔0.5秒钟发出一个索引数）
        let observable = Observable<Int>.interval(0.05, scheduler: MainScheduler.instance)
        
        observable.takeWhile{$0 < 30}.subscribe(onNext: { (time) in
            if time < 25 {
                priceLb.font = UIFont.systemFont(ofSize: CGFloat(time))
                var frame = priceLb.frame;
                frame.origin.y -= 2;
                frame.size.height = CGFloat(time)
                priceLb.frame = frame
            }
        }, onCompleted: {
            UIView.animate(withDuration: 1, animations: {
                priceLb.alpha = 0
            }, completion: { (bool) in
                priceLb.removeFromSuperview()
            })
            
        }).disposed(by: disposeBag)
    }
}
