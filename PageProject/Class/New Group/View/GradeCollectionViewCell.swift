//
//  GradeCollectionViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/3/1.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class GradeCollectionViewCell: UICollectionViewCell {
    let borderLayer = CALayer.init()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = ColorExtension().wordBlue.cgColor
        // Initialization code
    }
    @IBOutlet weak var gradeLb: UILabel!
    
    @IBOutlet weak var selectedImg: UIImageView!
    
    
    func didSelectedGrade(selected:Bool) {
        selectedImg.isHidden = !selected
        if selected {
            self.layer.borderWidth  = 1

        } else {
           self.layer.borderWidth  = 0
        }
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.backgroundColor = ColorExtension().touchGray
//       
//    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.backgroundColor = UIColor.white
//    }

}
