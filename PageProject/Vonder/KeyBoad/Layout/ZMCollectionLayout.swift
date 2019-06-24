//
//  ZMCollectionLayout.swift
//  SwiftProject
//
//  Created by 牛新怀 on 2018/7/6.
//  Copyright © 2018年 牛新怀. All rights reserved.
//

enum KeyBoardStates {
    case once  // 普通字母键盘
    case second // 数字键盘
    case third //
}

import UIKit
//屏幕的宽度
private let KSCREEN_WIDTH:CGFloat  = UIScreen.main.bounds.width
//按键的高宽比
private let KEYRATIO:CGFloat = 120.0  / 72.0
//按键的宽
private let BTN_WIDTH:CGFloat = KSCREEN_WIDTH / 10.0 - 6.0

//按键的高
private let BTN_HEIGHT:CGFloat = 60


private let SectionFirstItemIndex = 10



class ZMCollectionLayout: UICollectionViewFlowLayout {

    var keyBoardStates:KeyBoardStates = .once
    var secondX:CGFloat {
        get {
            if self.keyBoardStates == .once {
                return 6 + BTN_WIDTH / 2
            } else  if self.keyBoardStates == .second{
                return 3
            } else {
                return 6 + BTN_WIDTH / 2
            }
        }
    }
    
    var btnHeight:CGFloat {
        get {
           return BTN_HEIGHT
        }
    }
    var btnWidth:CGFloat {
        get {
            if self.keyBoardStates == .once {
                return KSCREEN_WIDTH / 10.0 - 6.0
            } else  if self.keyBoardStates == .second{
                return KSCREEN_WIDTH / 6.0 - 6.0
            } else {
                return KSCREEN_WIDTH / 10.0 - 6.0
            }
        }
    }
    
    var secondRation:CGFloat {
        get {
            if self.keyBoardStates == .once {
                return 120.0  / 72.0
            } else  if self.keyBoardStates == .second{
                return 1
            } else {
                return 120.0  / 72.0
            }
        }
    }
    
    private var thirdSectionItemRow:NSInteger {
        get {
            if self.keyBoardStates == .once {
                return 19
            } else  if self.keyBoardStates == .second{
                return 16
            } else {
                return 19
            }
        }
    }
    
    var attributesArray = [UICollectionViewLayoutAttributes]()
    override init() {
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        sectionInset = UIEdgeInsetsMake(10, 3, 0, 3)
        scrollDirection = .vertical
        itemSize = CGSize.init(width: BTN_WIDTH, height: BTN_HEIGHT)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 6
    }
    
    
   
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let array = super.layoutAttributesForElements(in: rect)
        guard array?.count != 0 else {
            return array
        }
      attributesArray = [UICollectionViewLayoutAttributes]()
        var sectionItemSecondX = CGFloat(0)
        
        for i in 0...array!.count - 1 {
            let att = array![i]
            if i >= SectionFirstItemIndex && i < thirdSectionItemRow {
                if i == SectionFirstItemIndex {
                    var frame = att.frame
                    frame.origin.x = secondX
                    att.frame = frame
                } else {
                    let prevLayoutAttributes = array![i - 1]
                    let originX = prevLayoutAttributes.frame.origin.x + prevLayoutAttributes.frame.size.width
                    var frame = att.frame
                    frame.origin.x = originX + CGFloat(6)
                    if i == SectionFirstItemIndex + 1 {
                        sectionItemSecondX = originX + CGFloat(6)
                    }
                    att.frame = frame
                }
                
            } else if i >= thirdSectionItemRow {
                if i == thirdSectionItemRow {
                    var frame = att.frame
                    frame.origin.x = sectionItemSecondX
                    att.frame = frame
                    print("1    %@ ",frame.origin.x)
                } else {
                    let prevLayoutAttributes = array![i - 1]
                    let originX = prevLayoutAttributes.frame.origin.x + prevLayoutAttributes.frame.size.width
                    var frame = att.frame
                    frame.origin.x = originX + CGFloat(6)
                    att.frame = frame
                    
                    print("2   %@ ",UIScreen.main.bounds.size.width - frame.origin.x - frame.size.width)
                }
                
            }
            
            attributesArray.append(att)
        }
        
        return attributesArray
    }
    
    
}
