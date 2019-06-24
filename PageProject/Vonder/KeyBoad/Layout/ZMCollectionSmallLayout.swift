//
//  ZMCollectionSmallLayout.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/3/8.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit
enum SmallKeyBoardStates {
    case once  // 普通字母键盘
    case second // 数字键盘

}


//屏幕的宽度
private let KSCREEN_WIDTH:CGFloat  = UIScreen.main.bounds.width
//按键的高宽比
private let KEYRATIO:CGFloat = 120.0  / 72.0
//按键的高
private let BTN_HEIGHT:CGFloat = 60
//按键的宽
private let BTN_WIDTH:CGFloat =  BTN_HEIGHT
// 普通按键间隙
private let KEYBOARD_SPACE:CGFloat = (KSCREEN_WIDTH - 5 * BTN_WIDTH ) / 6.0
// 数字按键间隙
private let NUM_KEYBOARD_SPACE:CGFloat = 8.0

private let SectionFirstItemIndex = 10

class ZMCollectionSmallLayout: UICollectionViewFlowLayout {
    var keyBoardStates:KeyBoardStates = .once
    
    
    
    var secondX:CGFloat {
        get {
            if self.keyBoardStates == .once {
                return 22
            } else {
                return 3
            }
        }
    }
    
    private var secondSectionItemRow:NSInteger {
        get {
            if self.keyBoardStates == .once {
                return 5
            } else {
                return 9
            }
        }
    }
    
    private var thirdSectionItemRow:NSInteger {
        get {
            if self.keyBoardStates == .once {
                return 10
            } else  {
                return 14
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
        sectionInset = UIEdgeInsetsMake(10, KEYBOARD_SPACE, 0, KEYBOARD_SPACE)
        scrollDirection = .vertical
      
        minimumLineSpacing = 0
        minimumInteritemSpacing = 6
    }
    
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let array = super.layoutAttributesForElements(in: rect)
        guard array?.count != 0 else {
            return array
        }
        attributesArray = [UICollectionViewLayoutAttributes]()

        
        for i in 0...array!.count - 1 {
            let att = array![i]
            if i >= secondSectionItemRow && i < thirdSectionItemRow {
                if i == secondSectionItemRow {
                    var frame = att.frame
                    frame.origin.x = KEYBOARD_SPACE
                    att.frame = frame
                } else {
                    let prevLayoutAttributes = array![i - 1]
                    let originX = prevLayoutAttributes.frame.origin.x + prevLayoutAttributes.frame.size.width
                    var frame = att.frame
                    frame.origin.x = originX + KEYBOARD_SPACE
                
                    att.frame = frame
                }
                
            } else if i >= thirdSectionItemRow {
                if i == thirdSectionItemRow {
                    var frame = att.frame
                    if self.keyBoardStates == .once {
                        frame.origin.x = KEYBOARD_SPACE * 2 + BTN_WIDTH
                    } else {
                          frame.origin.x = KEYBOARD_SPACE
                    }
                    
                    att.frame = frame
                } else {
                    let prevLayoutAttributes = array![i - 1]
                    let originX = prevLayoutAttributes.frame.origin.x + prevLayoutAttributes.frame.size.width
                    var frame = att.frame
                    frame.origin.x = originX + KEYBOARD_SPACE
                    att.frame = frame
                }
                
            }
           
            attributesArray.append(att)
        }
        
        return attributesArray
    }
}
