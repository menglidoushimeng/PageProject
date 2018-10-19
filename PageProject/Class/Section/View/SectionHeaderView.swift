//
//  SectionHeaderView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/29.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

@objc protocol SectionHeaderDelegate {
    @objc optional func stateFunction()
    @objc optional func challengeFunction()
    func trunBackFunction()
}

class SectionHeaderView: UITableViewHeaderFooterView {
    
    weak var delegate:SectionHeaderDelegate?
    
    @IBOutlet weak var nextStateLb: UILabel!
    @IBOutlet weak var nextDescLb: UILabel!
    
    @IBOutlet weak var stateBtn: UIButton!
    @IBOutlet weak var stateDescLb: UILabel!
    
    @IBOutlet weak var stateImg: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func turnBackAction(_ sender: UIButton) {
        delegate?.trunBackFunction()
    }
    
    @IBAction func stateAction(_ sender: UIButton) {
        delegate?.stateFunction?()
    }
    @IBAction func challengeAction(_ sender: UIButton) {
         delegate?.challengeFunction?()
    }

}
