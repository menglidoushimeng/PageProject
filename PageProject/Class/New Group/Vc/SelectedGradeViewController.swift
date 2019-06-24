//
//  SelectedGradeViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2019/3/1.
//  Copyright © 2019 梦里都是梦. All rights reserved.
//

import UIKit

class SelectedGradeViewController: RootViewController {
    lazy var cover:Cover = { () -> Cover in
        let coverView = Cover.init(frame: UIScreen.main.bounds, block: {
            
        }, color: UIColor.black.withAlphaComponent(0.7), removeSelf: true)
        
        return coverView
    }()
    
    lazy var gradeView:SelectedGradeView = { () -> SelectedGradeView in
        let gardeView = SelectedGradeView.init(frame: CGRect.init(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: 244))
        return gardeView
    }()
    
    lazy var shareView:ShareCommonView = {() -> ShareCommonView in
        let lazyShareView = Bundle.main.loadNibNamed("ShareCommonView", owner: self, options: nil)?.first as! ShareCommonView
        lazyShareView.shareActionStyle = { [weak self](style:ShareActionStyle) in
            if style != .cancel {

            }
            self?.cover.removeFromSuperview()
            lazyShareView.removeFromSuperview()
            
        }
        return lazyShareView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func navigationBarSetting() {
        super.navigationBarSetting()
        self.hiddenNavigationBarLine();
     
        let naviBar = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 42))
        let naviBarItem = Bundle.main.loadNibNamed("NavigationItemView", owner: self, options: nil)?.last as! NavigationItemView
        naviBar.addSubview(naviBarItem)
        naviBarItem.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(15)
        }

        naviBar.addTarget(self, action: #selector(barItemAction(barItem:)), for: .touchDown)

     
        self.navigationItem.titleView = naviBar
     
        self.navigationItem.titleView?.isUserInteractionEnabled = true
        let rightItem = UIBarButtonItem.init(image: UIImage.init(named: "dict_icontextshare")!.withRenderingMode(.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightBarItemAction(rightItem:)))
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
        let flowLayout = UICollectionViewFlowLayout.init()
        var gradeCollectionView:UICollectionView?

    override func viewSetting() {
        super.viewSetting()
        gradeCollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        gradeCollectionView?.showsHorizontalScrollIndicator = false
        self.view.addSubview(gradeCollectionView!)
        gradeCollectionView!.snp.makeConstraints { (make) in
            make.top.equalTo(self.safe)
            make.left.right.bottom.equalToSuperview()
        }
        gradeCollectionView?.bounces = false
        gradeCollectionView?.backgroundColor = UIColor.white
     
        flowLayout.itemSize = CGSize.init(width: (UIScreen.main.bounds.size.width - 20) / 3, height: 172)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)

        
        gradeCollectionView!.setCollectionViewLayout(flowLayout, animated: true)
        gradeCollectionView?.showsVerticalScrollIndicator  = false
        gradeCollectionView?.showsHorizontalScrollIndicator = false
        gradeCollectionView!.delegate = self
        gradeCollectionView!.dataSource = self
        gradeCollectionView!.register(UINib.init(nibName: "SelectedGradeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectedGradeCollectionViewCell")


    }
    @objc  func barItemAction(barItem:UIButton)  {
         UIApplication.shared.keyWindow?.addSubview(self.cover)
        UIApplication.shared.keyWindow?.addSubview(self.gradeView)

        self.cover.coverTouch = {() in
            self.gradeView.removeFromSuperview()
        }
    }
    @objc  func rightBarItemAction(rightItem:UIButton)  {
         UIApplication.shared.keyWindow?.addSubview(self.cover)
       
       self.cover.addSubview(self.shareView)
        self.cover.coverTouch = {() in
            self.shareView.removeFromSuperview()
        }
        self.shareView.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.size.width / 2)
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SelectedGradeViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
extension SelectedGradeViewController:UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedGradeCollectionViewCell", for: indexPath) as! SelectedGradeCollectionViewCell
        return cell
    }
    
    
}
