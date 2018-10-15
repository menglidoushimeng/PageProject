//
//  ImageTool.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/10/15.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

class ImageTool: NSObject {

    class func mergeImges(_ bgImg:UIImage ,_ subImg:UIImage ,_ subImgRect:CGRect) -> UIImage{
        UIGraphicsBeginImageContext(bgImg.size)
        bgImg.draw(in: CGRect.init(x: 0, y: 0, width: bgImg.size.width, height: bgImg.size.height))
        subImg.draw(in: subImgRect)
        let resultingImage = UIGraphicsGetImageFromCurrentImageContext()
        return resultingImage!
    }
    class func mergeImges(_ bgImg:UIImage ,_ subString:NSString,_ startPoint:CGPoint ,_ textColor:UIColor,_ textFont:UIFont) -> UIImage{
        let textAttributes = [NSAttributedStringKey.foregroundColor:textColor, NSAttributedStringKey.font:textFont]
        let textSize = NSString(string: subString).size(withAttributes: textAttributes)
        let textFrame = CGRect.init(x: startPoint.x, y: startPoint.y, width: textSize.width, height: textSize.height)
        
        UIGraphicsBeginImageContext(bgImg.size)
        bgImg.draw(in: CGRect.init(x: 0, y: 0, width: bgImg.size.width, height: bgImg.size.height))
        NSString(string: subString).draw(in: textFrame, withAttributes: textAttributes)
        let resultingImage = UIGraphicsGetImageFromCurrentImageContext()
        return resultingImage!
    }
    
    class func cornerImage(_ image:UIImage,size:CGSize, radius:CGFloat, fillColor: UIColor, completion:@escaping ((_ image: UIImage)->())) -> Void {
        
        //异步绘制裁切
        DispatchQueue.global().async {
            //利用绘图建立上下文
            UIGraphicsBeginImageContextWithOptions(size, true, 0)
            
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            
            //设置填充颜色
            fillColor.setFill()
            UIRectFill(rect)
            
            //利用贝塞尔路径裁切
            let path = UIBezierPath.init(roundedRect: rect, cornerRadius: radius)
            path.addClip()
            
            image.draw(in: rect)
            
            //获取结果
            let resultImage = UIGraphicsGetImageFromCurrentImageContext()
            
            //关闭上下文
            UIGraphicsEndImageContext()
            
            //主队列回调
            DispatchQueue.main.async {
                completion(resultImage!)
            }
        }
    }

    class func cornerImage(_ image:UIImage,_ size:CGSize,_ radius:CGFloat) -> UIImage {
        
            //利用绘图建立上下文
            UIGraphicsBeginImageContextWithOptions(size, true, 0)
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            UIColor.white.setFill()
            UIRectFill(rect)
        
            //利用贝塞尔路径裁切
            let path = UIBezierPath.init(roundedRect: rect, cornerRadius: radius)
            path.addClip()
            image.draw(in: rect)
            //获取结果
            let resultImage = UIGraphicsGetImageFromCurrentImageContext()
            //关闭上下文
            UIGraphicsEndImageContext()
            //主队列回调
            return resultImage ?? UIImage()
    }
    class func colorImg(_ color: UIColor,_ rect:CGRect) -> UIImage {
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    
}
