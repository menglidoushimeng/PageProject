//
//  RootViewModel.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/21.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

@objc protocol RootViewModelDelegate {
  @objc optional  func onNextViewController()
}
class RootViewModel: NSObject {
   weak var delegate:RootViewModelDelegate?
}
