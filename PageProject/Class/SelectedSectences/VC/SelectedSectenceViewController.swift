//
//  SelectedSectenceViewController.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/11/24.
//  Copyright © 2018 梦里都是梦. All rights reserved.
//

import UIKit

enum ViewStates {
    case selected
    case checkRight
    case checkError
}

class SelectedSectenceViewController: RootUnNaviProgressBarViewController {
    let questionTable = UITableView()
    var questionTableSource = Array<SelectedSectencesModel>()
    var viewStates:ViewStates = .selected
    
    var selectedIndex = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let question = UILabel()
    let headerView = UIView()
    let tryAgainBtn = UIButton()
    let footerView = UIView()
    override func viewSetting() {
        super.viewSetting()
        self.view.addSubview(questionTable)
        questionTable.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.safe)
            make.top.equalTo(self.turnBackBtn.snp.bottom)
        }
        questionTable.register(UINib.init(nibName: String(describing: type(of:SelectedSectencesTableViewCell())), bundle: nil), forCellReuseIdentifier:  String(describing: type(of:SelectedSectencesTableViewCell())))
        questionTable.delegate = self
        questionTable.dataSource = self
        questionTable.rowHeight = 58
        questionTable.estimatedSectionFooterHeight = 36
        questionTable.sectionFooterHeight = UITableViewAutomaticDimension
        questionTable.estimatedSectionHeaderHeight = 200
        questionTable.sectionHeaderHeight = UITableViewAutomaticDimension
        questionTable.separatorStyle  = .none
        
        headerView.backgroundColor = UIColor.white
        headerView.addSubview(question)
        question.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        question.text  = "问题"
        question.textAlignment = .center
        
        tryAgainBtn.setImage(UIImage.init(named: "dict_retry"), for: .normal)
        footerView.addSubview(tryAgainBtn)
        tryAgainBtn.snp.makeConstraints { (make) in
            make.right.equalTo(footerView.snp.right)
            make.top.equalTo(footerView.snp.top)
            make.bottom.equalTo(footerView.snp.bottom)
        }
        tryAgainBtn.isHidden = false
        tryAgainBtn.addTarget(self, action: #selector(tryAgainAction(_:)), for: .touchDown)
        
       let model1 =  SelectedSectencesModel()
        model1.answerString = "选项A"
        model1.rightNum = 2
        model1.answerStringColor = ColorExtension().questionBlue
        questionTableSource.append(model1)
        
        let model2 =  SelectedSectencesModel()
        model2.answerString = "选项B"
        model2.rightNum = 3
        model2.answerStringColor = ColorExtension().questionRed
        questionTableSource.append(model2)
        
        let model3 =  SelectedSectencesModel()
        model3.answerString = "选项C"
        model3.rightNum = 1
        model3.answerStringColor = ColorExtension().questionOrange
        questionTableSource.append(model3)
        
        questionTable.reloadData()
        
    }

    @objc func tryAgainAction(_ sender:UIButton) {
        for sourceModel in questionTableSource {
           sourceModel.selectedNum = nil
        }
        selectedIndex = 1
        viewStates = .selected
        questionTable.reloadData()
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
extension SelectedSectenceViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView;
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
       tryAgainBtn.isHidden = viewStates == .selected
        return footerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewStates != .selected {
            return
        }
        let selectedModel = questionTableSource[indexPath.row]
        if (selectedModel.selectedNum == nil) {
            selectedModel.selectedNum = selectedIndex
            selectedIndex += 1
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        if selectedIndex > questionTableSource.count {
            var allRight = true
            for sourceModel in questionTableSource {
                if sourceModel.rightNum != sourceModel.selectedNum {
                    allRight = false
                    break
                }
            }
            if allRight {
                viewStates = .checkRight
                tableView.reloadData()
            } else {
                viewStates = .checkError
                tableView.reloadData()
            }
        }
    }
}
extension SelectedSectenceViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionTableSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  String(describing: type(of:SelectedSectencesTableViewCell())), for: indexPath) as! SelectedSectencesTableViewCell
        let selectedModel = questionTableSource[indexPath.row]
        cell.answerLb.text = selectedModel.answerString ?? ""
        if selectedModel.selectedNum != nil {
            cell.nuberButton.setTitle("\(selectedModel.selectedNum!)", for: .normal)
        } else {
               cell.nuberButton.setTitle("", for: .normal)
        }
        cell.answerLb.textColor = selectedModel.answerStringColor ?? ColorExtension().largeGray
        cell.checkImage.isHidden = true
        switch viewStates {
        case .selected:
            do {
                cell.nuberButton.layer.borderColor = ColorExtension().lineGray.cgColor
                cell.nuberButton.setBackground(color: UIColor.white, state: .normal)
                cell.rightLb.isHidden = true
            }
            break
        case .checkRight:
            do {
                if indexPath.row == 0 {
                    cell.checkImage.isHidden = false
                    cell.checkImage.image = UIImage.init(named: "dict_tickgreen")
                    CommonViewTool.addPriceViewToTable(cell.checkImage, headerView, disposeBag)
                }
                cell.nuberButton.layer.borderColor = UIColor.clear.cgColor
                cell.nuberButton.setBackground(color: ColorExtension().rightGreen, state: .normal)
                cell.rightLb.isHidden = true
            }
            break
        case .checkError:
            do {
                if indexPath.row == 0 {
                    cell.checkImage.isHidden = false
                    cell.checkImage.image = UIImage.init(named: "dict_crossred")
                }
                if selectedModel.selectedNum == selectedModel.rightNum {
                     cell.nuberButton.setBackground(color: UIColor.white, state: .normal)
                     cell.nuberButton.layer.borderColor = ColorExtension().lineGray.cgColor
                    cell.rightLb.isHidden = true
                } else {
                     cell.nuberButton.setBackground(color: ColorExtension().errorOrange, state: .normal)
                    cell.nuberButton.layer.borderColor = UIColor.clear.cgColor
                    cell.rightLb.isHidden = false
                    cell.rightLb.text = "\(selectedModel.rightNum ?? 0)"
                }
            }
            break
        }
        return cell
    }
    
    
}
