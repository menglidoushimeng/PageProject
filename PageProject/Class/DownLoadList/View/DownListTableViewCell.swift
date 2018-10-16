//
//  DownListTableViewCell.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/28.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit

enum BookState {
    case load /// 下载
    case unLoad /// 未下载
}

@objc protocol DeleteDelegate {
    @objc optional func delete(indexPath:IndexPath)
}

class DownListTableViewCell: UITableViewCell {

    @IBOutlet weak var deleteBtn: UIButton!
    var indexPath:IndexPath?
    @IBOutlet weak var stateLb: UILabel!
    
    @IBOutlet weak var wordImg: UIImageView!
    @IBOutlet weak var wordLb: UILabel!
    
    @IBOutlet weak var pressionsImg: UIImageView!
    @IBOutlet weak var pressionsLb: UILabel!
    
    @IBOutlet weak var sentencesImg: UIImageView!
    @IBOutlet weak var sentencesLb: UILabel!
    
    @IBOutlet weak var paragraphsImg: UIImageView!
    @IBOutlet weak var paragraphsLb: UILabel!
    
    
    @IBOutlet weak var bookBgImg: UIImageView!
    
    weak var delegate:DeleteDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.deleteBtn.imageView?.contentMode = .scaleAspectFit
        // Initialization code
    }
    
    var bookState:BookState = .unLoad {
        didSet {
            if bookState == .load {
                wordImg.image = UIImage.init(named: "dict_piwordlistdone")
                pressionsImg.image = UIImage.init(named: "dict_piexpressionsdone")
                sentencesImg.image = UIImage.init(named: "dict_pisentencesdone")
                paragraphsImg.image = UIImage.init(named: "dict_piparagraphsdone")
                deleteBtn.isHidden = false
                stateLb.isHidden = true
                
            } else {
                wordImg.image = UIImage.init(named: "dict_piwordlistdoing")
                pressionsImg.image = UIImage.init(named: "dict_piexpressionsdoing")
                sentencesImg.image = UIImage.init(named: "dict_pisentencesdoing")
                paragraphsImg.image = UIImage.init(named: "dict_piparagraphsdoing")
                deleteBtn.isHidden = true
                stateLb.isHidden = false
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        delegate?.delete?(indexPath: indexPath!)
    }
}
