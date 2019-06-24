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
        self.animation(bottomView, superView, disposeBag, bottomView.frame.origin.y + 10)
       
    }
    
    class func addPriceViewToTable(_ bottomView:UIView,_ superView:UIView,_ disposeBag:DisposeBag) {
        self.animation(bottomView, superView, disposeBag, superView.frame.size.height + 10)
    }
    class func animation(_ bottomView:UIView,_ superView:UIView,_ disposeBag:DisposeBag,_ y:CGFloat) {
        self.priceAnimation(bottomView, superView, disposeBag,y,completion: {
            self.statesAnimation(bottomView, superView, disposeBag,y,completion: {
                self.gradeAnimation(bottomView, superView, disposeBag,y)
            })
        })
    }
    class func priceAnimation(_ bottomView:UIView,_ superView:UIView,_ disposeBag:DisposeBag,_ y:CGFloat,completion: (() -> Void)? = nil) {
        let priceLb = UILabel();
        priceLb.text = "+5"
        priceLb.minimumScaleFactor = 5
        priceLb.textAlignment = .center
        priceLb.textColor = ColorExtension().starGold
        priceLb.frame = CGRect.init(x: bottomView.frame.origin.x + bottomView.frame.size.width / 2 - 30, y: y, width: 60, height: 0)
        superView.addSubview(priceLb)
        //Observable序列（每隔0.5秒钟发出一个索引数）
        let observable = Observable<Int>.interval(0.02, scheduler: MainScheduler.instance)
        
        observable.takeWhile{$0 < 20}.subscribe(onNext: { (time) in
            if time < 20 {
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
                completion?()
            })
            
        }).disposed(by: disposeBag)
    }
    
    class func statesAnimation(_ bottomView:UIView,_ superView:UIView,_ disposeBag:DisposeBag,_ y:CGFloat, completion: (() -> Void)? = nil) {
        let statesLb = UILabel();
        statesLb.text = "掌握级"
        statesLb.minimumScaleFactor = 5
        statesLb.textAlignment = .center
        statesLb.textColor = ColorExtension().masteryGold
        statesLb.frame = CGRect.init(x: bottomView.frame.origin.x + bottomView.frame.size.width / 2 - 30, y: y, width: 60, height: 0)
        superView.addSubview(statesLb)
        //Observable序列（每隔0.5秒钟发出一个索引数）
        let observable = Observable<Int>.interval(0.02, scheduler: MainScheduler.instance)
        
        observable.takeWhile{$0 < 20}.subscribe(onNext: { (time) in
            if time < 15 {
                statesLb.font = UIFont.systemFont(ofSize: CGFloat(time))
                var frame = statesLb.frame;
                frame.origin.y -= 2;
                frame.size.height = CGFloat(time)
                statesLb.frame = frame
            }
        }, onCompleted: {
            UIView.animate(withDuration: 1, animations: {
                statesLb.alpha = 0
            }, completion: { (bool) in
                statesLb.removeFromSuperview()
                completion?()
            })
            
        }).disposed(by: disposeBag)
    }
    
    class func gradeAnimation(_ bottomView:UIView,_ superView:UIView,_ disposeBag:DisposeBag,_ y:CGFloat, completion: (() -> Void)? = nil) {
        let gradeImg = UIImageView();
        gradeImg.image = UIImage.init(named: "dict_sprout")
        gradeImg.frame = CGRect.init(x: bottomView.frame.origin.x + bottomView.frame.size.width / 2, y: y, width: 0, height: 0)
        superView.addSubview(gradeImg)
        //Observable序列（每隔0.5秒钟发出一个索引数）
        let observable = Observable<Int>.interval(0.02, scheduler: MainScheduler.instance)
        
        observable.takeWhile{$0 < 20}.subscribe(onNext: { (time) in
            if time < 20 {
                var frame =  gradeImg.frame;
                frame.origin.y -= 2;
                frame.origin.x -= 0.75
                frame.size.height = CGFloat(time)
                frame.size.width = CGFloat(time)*1.5
                gradeImg.frame = frame
            }
        }, onCompleted: {
            UIView.animate(withDuration: 1, animations: {
                gradeImg.alpha = 0
            }, completion: { (bool) in
                gradeImg.removeFromSuperview()
                completion?()
            })
            
        }).disposed(by: disposeBag)
    }
}
