//
//  RootViewModel.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/21.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
@objc protocol RootViewModelDelegate {
    func onNextViewController()
}
class RootViewModel: NSObject {
    weak var delegate:RootViewModelDelegate?
}
