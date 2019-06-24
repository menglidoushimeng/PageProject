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
    let footerView = Bundle.main.loadNibNamed("SelectedSectencesFooter", owner: self, options: nil)?.first as! SelectedSectencesFooter
    override func viewSetting() {
        super.viewSetting()
        self.view.addSubview(footerView)
        footerView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(40)
        }
        footerView.tryAgainSender.isHidden = viewStates != .checkError
        footerView.tryAgainBlock = { ()  in
            for sourceModel in self.questionTableSource {
                sourceModel.selectedNum = nil
            }
            self.selectedIndex = 1
            self.viewStates = .selected
            self.questionTable.reloadData()
        }
        self.view.addSubview(questionTable)
        questionTable.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.safe)
            make.bottom.equalTo(footerView.snp.top)
            make.top.equalTo(self.turnBackBtn.snp.bottom)
        }
        questionTable.register(UINib.init(nibName: String(describing: type(of:SelectedSectencesTableViewCell())), bundle: nil), forCellReuseIdentifier:  String(describing: type(of:SelectedSectencesTableViewCell())))
        questionTable.delegate = self
        questionTable.dataSource = self
        questionTable.bounces = false
        

        questionTable.sectionHeaderHeight = UIScreen.main.bounds.size.height - 424 - 50

        questionTable.separatorStyle  = .none
        questionTable.showsHorizontalScrollIndicator = false
        questionTable.showsVerticalScrollIndicator = false
        
        headerView.backgroundColor = UIColor.white
        headerView.addSubview(question)
        question.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
          
        }
        question.text  = "事实上，提高情商是可能的，这意味着学校需要确保，他们的学生正接受者他们真正的教育，并指导他们的未来不是完全取决于他们的智商"
        question.textAlignment = .center
        question.numberOfLines = 0
        
        self.forExampleSource()
       
       
        
    }
    func forExampleSource() {
        let model1 =  SelectedSectencesModel()
        model1.answerString = "And the fact"
        model1.rightNum = 1
        model1.answerStringColor = ColorExtension().questionSnowBlue
        questionTableSource.append(model1)
        
        let model2 =  SelectedSectencesModel()
        model2.answerString = "and know"
        model2.rightNum = 7
        model2.answerStringColor = ColorExtension().questionSkyBlue
        questionTableSource.append(model2)
        
        let model3 =  SelectedSectencesModel()
        model3.answerString = "means"
        model3.rightNum = 3
        model3.answerStringColor = ColorExtension().questionOrange
        questionTableSource.append(model3)
        
        let model4 =  SelectedSectencesModel()
        model4.answerString = "that schools need to make sure"
        model4.rightNum = 4
        model4.answerStringColor = ColorExtension().questionBlue
        questionTableSource.append(model4)
        
        let model5 =  SelectedSectencesModel()
        model5.answerString = "that is might be possible to raise EQs.,"
        model5.rightNum = 2
        model5.answerStringColor = ColorExtension().questionGreen
        questionTableSource.append(model5)
        
        let model6 =  SelectedSectencesModel()
        model6.answerString = "that their sudents are receiving the education"
        model6.rightNum = 5
        model6.answerStringColor = ColorExtension().questionRed
        questionTableSource.append(model6)
        
        let model7 =  SelectedSectencesModel()
        model7.answerString = "that their futures are not entirely determined by their IQs"
        model7.rightNum = 8
        model7.answerStringColor = ColorExtension().questionWitheredGreen
        questionTableSource.append(model7)
        
        let model8 =  SelectedSectencesModel()
        model8.answerString = "they really need"
        model8.rightNum = 6
        model8.answerStringColor = ColorExtension().questionGemostenBlue
        questionTableSource.append(model8)
        
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

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row >= questionTableSource.count {
            return 40
        } else {
            return 48
        }
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
        } else {
            selectedIndex = selectedModel.selectedNum!
            for sourceModel in questionTableSource {
                if sourceModel.selectedNum ?? 0 >= selectedIndex {
                    sourceModel.selectedNum = nil
                }
            }
            tableView.reloadData()
          
           
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
        footerView.tryAgainSender.isHidden = viewStates != .checkError
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
