//
//  WordHeaderView.swift
//  PageProject
//
//  Created by tiao on 2018/9/15.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
import Accelerate
@objc protocol HeaderViewDelegate {
    @objc optional func turnBackAction();
    @objc optional func shareAction()
    @objc optional func listText()
    @objc optional func wordsCard()
    @objc optional func sentenceCard()
}

class WordHeaderView: RootView {
    
    let bgImg = UIImageView.init(image: UIImage.init(named: "czrjbgoforit_01_05"))
    
    let titleLb = UILabel()
    
    
    var listenView = ImageTitleView()
    var wordView = ImageTitleView()
    var phraseView = ImageTitleView()
    
    var contentView = UIView()
    var bottomLineView = UIView()
    
    var turnBackBtn = UIButton()
    var shareBtn = UIButton()
    
    weak var delegate:HeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        createView()
    }
    
    func createView(){
        
        
        self.backgroundColor = UIColor.white
        let screenW = UIScreen.main.bounds.width
        
        self.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
            self.bgImg.contentMode = .scaleAspectFit
            self.contentView.addSubview(self.bgImg)
            self.bgImg.snp.makeConstraints { (make) in
                make.top.left.right.equalTo(self.safe)
                make.width.equalTo(self.bgImg.snp.height).multipliedBy(720/132.00)
            }
        let blurImage = self.blurry(UIImage.init(named: "czrjbgoforit_01_05")!, level: 0.1)
            self.bgImg.image = blurImage

        
        let view = UIView()
        contentView.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self.bgImg)
        }
        view.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        
        titleLb.text = "人教版新课标必修1 高一上\nMIUI.SectionA";
        titleLb.font = UIFont.systemFont(ofSize: 12)
        titleLb.textAlignment = .center
        titleLb.numberOfLines = 0
        titleLb.textColor = ColorExtension().largeGray
        self.contentView.addSubview(titleLb)
        titleLb.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.bgImg.snp.top).offset(20)
        }
        
        contentView.addSubview(turnBackBtn)
        turnBackBtn.setImage(UIImage.init(named: "dict_grayroundreturn"), for: .normal)
        turnBackBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(self.safe).offset(10)
            make.height.width.equalTo(36)
        }
        turnBackBtn.addTarget(self, action: #selector(backAction(_:)), for: .touchUpInside)
        
        contentView.addSubview(shareBtn)
        shareBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(turnBackBtn.snp.top)
            make.width.equalTo(57)
            make.height.equalTo(36)
        }
        shareBtn.setImage(UIImage.init(named: "dict_grayroundshare"), for: .normal)
        shareBtn.setTitleColor(UIColor.black, for: .normal)
        shareBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        shareBtn.addTarget(self, action:#selector(shareAction(_:)), for:.touchUpInside)
        
        
 
        contentView.addSubview(listenView)
        contentView.backgroundColor = UIColor.white
        listenView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalTo(bgImg.snp.bottom).offset(10)
            make.bottom.equalTo(contentView.snp.bottom)
            make.width.equalTo(screenW/3)
        }
        listenView.showImage = UIImage.init(named: "dict_playtext")!
        listenView.titleText = "听课文"
        listenView.descText = "04:37"
        listenView.proportion = 1
        listenView.btnAction = { [weak self] tag in
            self?.delegate?.listText?()
        }
        
        contentView.addSubview(wordView)
        wordView.snp.makeConstraints { (make) in
            make.left.equalTo(listenView.snp.right)
            make.top.equalTo(listenView.snp.top)
            make.bottom.equalToSuperview()
            make.width.equalTo(listenView.snp.width)
            make.height.equalTo(listenView.snp.height)
        }
        wordView.showImage = UIImage.init(named: "dict_wordcard")!
        wordView.titleText = "单词卡"
        wordView.descText = "26词"
        wordView.proportion = 1
        wordView.btnAction = { [weak self] tag in
            self?.delegate?.wordsCard?()
        }
        
        contentView.addSubview(phraseView)
        phraseView.snp.makeConstraints { (make) in
            make.left.equalTo(wordView.snp.right)
            make.top.equalTo(listenView.snp.top)
            make.right.equalTo(self)
            make.bottom.equalToSuperview()
            make.width.equalTo(wordView.snp.width)
            make.height.equalTo(listenView.snp.height)
        }
        phraseView.showImage = UIImage.init(named: "dict_phrasecard")!
        phraseView.titleText = "短语卡"
        phraseView.descText = "10短语"
        phraseView.proportion = 1
        phraseView.btnAction = { [weak self] tag in
            self?.delegate?.sentenceCard?()
        }
       
        self.addSubview(bottomLineView)
        bottomLineView.backgroundColor = ColorExtension().lineGray
        bottomLineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(2)
        }
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //分享按钮点击事件
    @objc func shareAction(_ button:UIButton) {
        delegate?.shareAction?()
    }
    
    //返回按钮点击事件
    @objc func backAction(_ button:UIButton){
        delegate?.turnBackAction?()
    }
    
    // MARK:- 图片模糊效果处理
    /// 图片模糊效果处理
    /// - parameter image: 需要处理的图片
    /// - parameter level: 模糊程度（0~1）
    func blurry(_ image: UIImage, level: CGFloat) -> UIImage {
        
        // 处理模糊程度, 防止超出
        var levelValue: CGFloat = level
        if level < 0 {
            levelValue = 0.1
        } else if level > 1.0 {
            levelValue = 1.0
        }
        
        // boxSize 必须大于 0
        var boxSize = Int(levelValue * 100)
        boxSize -= (boxSize % 2) + 1
        
        let _cgImage = image.cgImage
        
        // 图像缓存: 输入缓存、输出缓存
        var inBuffer = vImage_Buffer()
        var outBuffer = vImage_Buffer()
        var error = vImage_Error()
        
        
        let inProvider = _cgImage?.dataProvider
        let inBitmapData = inProvider?.data
        
        inBuffer.width = vImagePixelCount((_cgImage?.width)!)
        inBuffer.height = vImagePixelCount((_cgImage?.height)!)
        inBuffer.rowBytes = (_cgImage?.bytesPerRow)!
        inBuffer.data = UnsafeMutableRawPointer(mutating: CFDataGetBytePtr(inBitmapData!))
        
        // 像素缓存
        let pixelBuffer = malloc((_cgImage?.bytesPerRow)! * (_cgImage?.height)!)
        outBuffer.data = pixelBuffer
        outBuffer.width = vImagePixelCount((_cgImage?.width)!)
        outBuffer.height = vImagePixelCount((_cgImage?.height)!)
        outBuffer.rowBytes = (_cgImage?.bytesPerRow)!
        
        // 中间缓存区, 抗锯齿
        let pixelBuffer2 = malloc((_cgImage?.bytesPerRow)! * (_cgImage?.height)!)
        var outBuffer2 = vImage_Buffer()
        outBuffer2.data = pixelBuffer2
        outBuffer2.width = vImagePixelCount((_cgImage?.width)!)
        outBuffer2.height = vImagePixelCount((_cgImage?.height)!)
        outBuffer2.rowBytes = (_cgImage?.bytesPerRow)!
        
        
        error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, nil, 0, 0, UInt32(boxSize), UInt32(boxSize), nil, vImage_Flags(kvImageEdgeExtend))
        error = vImageBoxConvolve_ARGB8888(&outBuffer2, &outBuffer, nil, 0, 0, UInt32(boxSize), UInt32(boxSize), nil, vImage_Flags(kvImageEdgeExtend))
        
        if error != kvImageNoError {
            debugPrint(error)
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let ctx = CGContext(data: outBuffer.data, width: Int(outBuffer.width), height: Int(outBuffer.height), bitsPerComponent: 8, bytesPerRow: outBuffer.rowBytes, space: colorSpace, bitmapInfo: (_cgImage?.bitmapInfo.rawValue)!)
        
        let finalCGImage = ctx!.makeImage()
        let finalImage = UIImage(cgImage: finalCGImage!)
        
        free(pixelBuffer!)
        free(pixelBuffer2!)
        
        return finalImage
    }
    
    
}
