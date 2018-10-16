//
//  ScreenBounsConfig.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/25.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
/**
 *  设备类型
 */
enum DeviceType: Int {
    case Iphone4          // iPhone 4S
    case Iphone5          // iPhone SE
    case Iphone6         // iPhone 6
    case Iphone6P        // iPhone 6 Plus
    case IphoneX        // iPhone X   iPhone XS
    case IphoneMax     //iPhone Xs Max  iPhone XR
    
    var height: Int {
        switch self {
        case .Iphone4:        return 480
        case .Iphone5:        return 568
        case .Iphone6:        return 667
        case .Iphone6P:       return 736
        case .IphoneX:        return 812
        case .IphoneMax:      return 896
        }
    }
}
class ScreenBounsConfig: NSObject {
    
    var NAVIGATIONBAR_HEIGHT:CGFloat {
        get {
            if UIDevice.currentDeviceType() == .IphoneMax || UIDevice.currentDeviceType() == .IphoneX  {
                return 94
            } else {
                return 64
            }
        }
    }
    let TABBAR_HEIGHT:CGFloat = 49;
    let STATUSBAR_HEIGHT:CGFloat = 25;
    func isIphoneX() -> CGFloat {
        if UIDevice.currentDeviceType() == .IphoneMax || UIDevice.currentDeviceType() == .IphoneX  {
            return 30
        } else {
            return 0
        }
    }
    func isIphoneXHeight(height:CGFloat) -> CGFloat {
        if UIDevice.currentDeviceType() == .IphoneMax || UIDevice.currentDeviceType() == .IphoneX  {
            return height+30
        } else {
            return height
        }
    }
    
}
extension UIDevice {
    public func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 || UIScreen.main.bounds.height == 896{
            return true
        }
        return false
    }
    static func currentDeviceType() -> DeviceType{
        switch UIScreen.main.bounds.size.height {
        case 480:
            return .Iphone4
        case 568:
            return .Iphone5
        case 667:
            return .Iphone6
        case 736:
            return .Iphone6P
        case 812:
            return .IphoneX
        case 896:
            return .IphoneMax
        default:
            return .Iphone6
        }
    }
}

