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
    class func jointImges(_ imageSize:CGSize,_ bgImg:UIImage ,_ subImg:UIImage ,_ subImgRect:CGRect) -> UIImage{
        UIGraphicsBeginImageContext(imageSize)
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
            UIGraphicsBeginImageContextWithOptions(CGSize.init(width: size.width , height: size.height ), true, 0)
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
            let returnImg = resultImage?.imageByRemoveWhiteBg()
            return returnImg ?? UIImage()
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
    
    
    /// 制作分享图
    class func addUserInfo(_ image:UIImage,_ headImg:UIImage,_ nickName:NSString,_ completionHandler: @escaping (_ capturedImage: UIImage?) -> Void)   {
        
        let codeImg = UIImage.init(named: "dict_qr")
        let megreImg = self.mergeImges(image, codeImg!, CGRect.init(x: image.size.width - 70, y: 0, width: 70, height: 70))
        
            let headImage = self.cornerImage(headImg, CGSize.init(width: 40, height: 40), 20)
            
            let megreHeadImg = self.mergeImges(megreImg, headImage, CGRect.init(x: 10, y: 10, width: 40, height: 40))
            
            let megreStringImg = self.mergeImges(megreHeadImg, nickName , CGPoint.init(x: 55, y: 18), ColorExtension().middenGray, UIFont.systemFont(ofSize: 23, weight: UIFont.Weight(rawValue: -1)))
            
            completionHandler(megreStringImg)
            
       
        
    }
    
    /// 制作分享图
   class func shareImgCustion(_ tableView:UITableView,_ headImg:UIImage,_ nickName:NSString,_ completionHandler: @escaping (_ capturedImage: UIImage?) -> Void)   {
        
        
    tableView.swContentScrollCapture({ (image) in
            
            let codeImg = UIImage.init(named: "dict_qr")
            
            let megreImg = self.mergeImges(image!, codeImg!, CGRect.init(x: image!.size.width - 70, y: 0, width: 70, height: 70))
            
            let headImage = self.cornerImage(headImg, CGSize.init(width: 40, height: 40), 20)
           
            let megreHeadImg = self.mergeImges(megreImg, headImage, CGRect.init(x: 10, y: 10, width: 40, height: 40))
            
            let megreStringImg = self.mergeImges(megreHeadImg, nickName , CGPoint.init(x: 55, y: 15), ColorExtension().middenGray, UIFont.systemFont(ofSize: 17, weight: UIFont.Weight(rawValue: -1)))
            
            completionHandler(megreStringImg)
            
        })
        
    }
    
   
}
extension UITableView {
    public func wwhContentScrollCapture (_ completionHandler: @escaping (_ capturedImage: UIImage?) -> Void) {
        
        self.isCapturing = true
        
        // Put a fake Cover of View
        let snapShotView = self.snapshotView(afterScreenUpdates: true)
        snapShotView?.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: (snapShotView?.frame.size.width)!, height: (snapShotView?.frame.size.height)!)
        self.superview?.addSubview(snapShotView!)
        
        // Backup
        let bakOffset    = self.contentOffset
        
        // Divide
        let page  = floorf(Float(self.contentSize.height / (self.bounds.height - self.sectionHeaderHeight)))
        
        UIGraphicsBeginImageContextWithOptions(self.contentSize, false, UIScreen.main.scale)
        
        self.swContentScrollPageDraw(0, maxIndex: Int(page), drawCallback: { [weak self] () -> Void in
            let strongSelf = self
            
            let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            // Recover
            strongSelf?.setContentOffset(bakOffset, animated: false)
            snapShotView?.removeFromSuperview()
            
            strongSelf?.isCapturing = false
            
            completionHandler(capturedImage)
        })
        
    }
    
    fileprivate func swContentScrollPageDraw (_ index: Int, maxIndex: Int, drawCallback: @escaping () -> Void) {
        
        self.setContentOffset(CGPoint(x: 0, y: CGFloat(index) * self.frame.size.height), animated: false)
        
        let splitFrame = CGRect(x: 0, y: CGFloat(index) * self.frame.size.height, width: bounds.size.width, height: bounds.size.height)
       
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) { () -> Void in
            self.drawHierarchy(in: splitFrame, afterScreenUpdates: true)
            
            if index < maxIndex {
                self.swContentScrollPageDraw(index + 1, maxIndex: maxIndex, drawCallback: drawCallback)
            }else{
                drawCallback()
            }
        }
    }
}


extension UIImage {
    
    /// EZSE: Returns base64 string
    public var base64: String {
        return UIImageJPEGRepresentation(self, 1.0)!.base64EncodedString()
    }
    
    /// EZSE: Returns compressed image to rate from 0 to 1
    public func compressImage(rate: CGFloat) -> Data? {
        return UIImageJPEGRepresentation(self, rate)
    }
    
    /// EZSE: Returns Image size in Bytes
    public func getSizeAsBytes() -> Int {
        return UIImageJPEGRepresentation(self, 1)?.count ?? 0
    }
    
    /// EZSE: Returns Image size in Kylobites
    public func getSizeAsKilobytes() -> Int {
        let sizeAsBytes = getSizeAsBytes()
        return sizeAsBytes != 0 ? sizeAsBytes / 1024 : 0
    }
    
    /// EZSE: scales image
    public class func scaleTo(image: UIImage, w: CGFloat, h: CGFloat) -> UIImage {
        let newSize = CGSize(width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// EZSE Returns resized image with width. Might return low quality
    public func resizeWithWidth(_ width: CGFloat) -> UIImage {
        let aspectSize = CGSize (width: width, height: aspectHeightForWidth(width))
        
        UIGraphicsBeginImageContext(aspectSize)
        self.draw(in: CGRect(origin: CGPoint.zero, size: aspectSize))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img!
    }
    
    /// EZSE Returns resized image with height. Might return low quality
    public func resizeWithHeight(_ height: CGFloat) -> UIImage {
        let aspectSize = CGSize (width: aspectWidthForHeight(height), height: height)
        
        UIGraphicsBeginImageContext(aspectSize)
        self.draw(in: CGRect(origin: CGPoint.zero, size: aspectSize))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img!
    }
    
    /// EZSE:
    public func aspectHeightForWidth(_ width: CGFloat) -> CGFloat {
        return (width * self.size.height) / self.size.width
    }
    
    /// EZSE:
    public func aspectWidthForHeight(_ height: CGFloat) -> CGFloat {
        return (height * self.size.width) / self.size.height
    }
    
    /// EZSE: Returns cropped image from CGRect
    public func croppedImage(_ bound: CGRect) -> UIImage? {
        guard self.size.width > bound.origin.x else {
            print("EZSE: Your cropping X coordinate is larger than the image width")
            return nil
        }
        guard self.size.height > bound.origin.y else {
            print("EZSE: Your cropping Y coordinate is larger than the image height")
            return nil
        }
        let scaledBounds: CGRect = CGRect(x: bound.origin.x * self.scale, y: bound.origin.y * self.scale, width: bound.width * self.scale, height: bound.height * self.scale)
        let imageRef = self.cgImage?.cropping(to: scaledBounds)
        let croppedImage: UIImage = UIImage(cgImage: imageRef!, scale: self.scale, orientation: UIImageOrientation.up)
        return croppedImage
    }
    
    /// EZSE: Use current image for pattern of color
    public func withColor(_ tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
        context?.clip(to: rect, mask: self.cgImage!)
        tintColor.setFill()
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// 颜色image
    public static func image(color: UIColor) -> UIImage? {
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    ///EZSE: Returns the image associated with the URL
    public convenience init?(urlString: String) {
        guard let url = URL(string: urlString) else {
            self.init(data: Data())
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            print("EZSE: No image in URL \(urlString)")
            self.init(data: Data())
            return
        }
        self.init(data: data)
    }
    
    ///EZSE: Returns an empty image //TODO: Add to readme
    public class func blankImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0.0)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

    //返回一个将白色背景变透明的UIImage
    func imageByRemoveWhiteBg() -> UIImage? {
        let colorMasking: [CGFloat] = [222, 255, 222, 255, 222, 255]
        return transparentColor(colorMasking: colorMasking)
    }
    
    //返回一个将黑色背景变透明的UIImage
    func imageByRemoveBlackBg() -> UIImage? {
        let colorMasking: [CGFloat] = [0, 32, 0, 32, 0, 32]
        return transparentColor(colorMasking: colorMasking)
    }
    func transparentColor(colorMasking:[CGFloat]) -> UIImage? {
        if let rawImageRef = self.cgImage {
            UIGraphicsBeginImageContext(self.size)
            if let maskedImageRef = rawImageRef.copy(maskingColorComponents: colorMasking) {
                let context: CGContext = UIGraphicsGetCurrentContext()!
                context.translateBy(x: 0.0, y: self.size.height)
                context.scaleBy(x: 1.0, y: -1.0)
                context.draw(maskedImageRef, in: CGRect(x:0, y:0, width:self.size.width,
                                                        height:self.size.height))
                let result = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return result
            }
        }
        return nil
    }
}
