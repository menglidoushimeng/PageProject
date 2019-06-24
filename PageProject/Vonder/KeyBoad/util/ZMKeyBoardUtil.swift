//
//  ZMKeyBoardUtil.swift
//  SwiftProject
//
//  Created by 牛新怀 on 2018/7/6.
//  Copyright © 2018年 牛新怀. All rights reserved.
//

import UIKit

class ZMKeyBoardUtil: NSObject {

    
    
    static var dataSource = [["Q","W","E","R","T","Y","U","I","O","P"],
                      ["A","S","D","F","G","H","J","K","L"],
                      ["Z","X","C","V","B","N","M"]]
    
    static var secondSource = [["1","2","3","4","5","6","7","8","9","0"],
                               ["sb.","sth.","...","-",":","’"],
                               ["!",",",".","?"]]
    
    static var thirdSource = [["[","]","{","}","#","%","^","*","+","="],
                             ["_","\\","|","~","<",">","≈","≠","||"],
                             ["“","”",".","...","?","!","’"]]
    
    static var fourSource = [["A","E","I","O","U"],
                              ["B","F","H","J","L"],
                              ["N","P","R"]]
    
    static var fiveSource = [["1","2","3","4","5","6","7","8","9"],
                               ["0","...","-",":","’"],
                               ["!",",",".","?"]]
}

extension ZMKeyBoardUtil {
    
    static func getDataSourceBy() -> [[ZMKeyBoadModel]] {
        var array = [[ZMKeyBoadModel]]()
        for i in 0...ZMKeyBoardUtil.dataSource.count - 1 {
            var sourceArray = [ZMKeyBoadModel]()
            let mSource = ZMKeyBoardUtil.dataSource[i]
            for m in 0...mSource.count - 1 {
                let str = mSource[m]
                let model = ZMKeyBoadModel.init(str: str, flag: false)
                if str.lowercased() == "e" {
                    model.backgroundColor = UIColor.init(red: 254/255.0, green: 212/255.0, blue: 135/255.0, alpha: 1)
                } else if  str.lowercased() == "u" {
                    model.backgroundColor = UIColor.init(red: 136/255.0, green: 214/255.0, blue: 253/255.0, alpha: 1)
                } else if  str.lowercased() == "i" {
                    model.backgroundColor = UIColor.init(red: 255/255.0, green: 254/255.0, blue: 159/255.0, alpha: 1)
                } else if  str.lowercased() == "o" {
                   model.backgroundColor = UIColor.init(red: 172/255.0, green: 217/255.0, blue: 125/255.0, alpha: 1)
                } else if  str.lowercased() == "a" {
                    model.backgroundColor = UIColor.init(red: 253/255.0, green: 154/255.0, blue: 155/255.0, alpha: 1)
                }
                sourceArray.append(model)
            }
            array.append(sourceArray)
        }
        return array
    }
    
    static func getSecondDataSourceBy() -> [[ZMKeyBoadModel]] {
        var array = [[ZMKeyBoadModel]]()
        for i in 0...ZMKeyBoardUtil.secondSource.count - 1 {
            var sourceArray = [ZMKeyBoadModel]()
            let mSource = ZMKeyBoardUtil.secondSource[i]
            for m in 0...mSource.count - 1 {
                let str = mSource[m]
                let model = ZMKeyBoadModel.init(str: str, flag: false)
                sourceArray.append(model)
            }
            array.append(sourceArray)
        }
        return array
    }
    
    static func getThirdDataSourceBy() -> [[ZMKeyBoadModel]] {
        var array = [[ZMKeyBoadModel]]()
        for i in 0...ZMKeyBoardUtil.thirdSource.count - 1 {
            var sourceArray = [ZMKeyBoadModel]()
            let mSource = ZMKeyBoardUtil.thirdSource[i]
            for m in 0...mSource.count - 1 {
                let str = mSource[m]
                let model = ZMKeyBoadModel.init(str: str, flag: false)
                sourceArray.append(model)
            }
            array.append(sourceArray)
        }
        return array
    }
    
    static func getFourDataSourceBy() -> [[ZMKeyBoadModel]] {
        var array = [[ZMKeyBoadModel]]()
        for i in 0...ZMKeyBoardUtil.fourSource.count - 1 {
            var sourceArray = [ZMKeyBoadModel]()
            let mSource = ZMKeyBoardUtil.fourSource[i]
            for m in 0...mSource.count - 1 {
                let str = mSource[m]
                let model = ZMKeyBoadModel.init(str: str, flag: false)
                if str.lowercased() == "e" {
                    model.backgroundColor = UIColor.init(red: 254/255.0, green: 212/255.0, blue: 135/255.0, alpha: 1)
                } else if  str.lowercased() == "u" {
                    model.backgroundColor = UIColor.init(red: 136/255.0, green: 214/255.0, blue: 253/255.0, alpha: 1)
                } else if  str.lowercased() == "i" {
                    model.backgroundColor = UIColor.init(red: 255/255.0, green: 254/255.0, blue: 159/255.0, alpha: 1)
                } else if  str.lowercased() == "o" {
                    model.backgroundColor = UIColor.init(red: 172/255.0, green: 217/255.0, blue: 125/255.0, alpha: 1)
                } else if  str.lowercased() == "a" {
                    model.backgroundColor = UIColor.init(red: 253/255.0, green: 154/255.0, blue: 155/255.0, alpha: 1)
                }
                sourceArray.append(model)
            }
            array.append(sourceArray)
        }
        return array
    }
    
    static func getFiveDataSourceBy() -> [[ZMKeyBoadModel]] {
        var array = [[ZMKeyBoadModel]]()
        for i in 0...ZMKeyBoardUtil.fiveSource.count - 1 {
            var sourceArray = [ZMKeyBoadModel]()
            let mSource = ZMKeyBoardUtil.fiveSource[i]
            for m in 0...mSource.count - 1 {
                let str = mSource[m]
                let model = ZMKeyBoadModel.init(str: str, flag: false)
                sourceArray.append(model)
            }
            array.append(sourceArray)
        }
        return array
    }
}
