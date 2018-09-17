//
//  BookModel.swift
//  PageProject
//
//  Created by tiao on 2018/9/16.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
class BookUnitModel: NSObject {
    var bookid:NSNumber?
    var course:String?
    var paragraphcount:NSNumber?
    var phrasecount:NSNumber?
    var sentencecount:NSNumber?
    var simplify:String?
    var sort:NSNumber?
    var unitid:NSNumber?
    var unitname:String?
    var wordcount:NSNumber?
}
class BookDetailModel: NSObject {
    var bookid:NSNumber?
    var course:String?
    var cover_filename:String?
    var enukus:String?
    var grade:String?
    var name:String?
    var press:NSNumber?
    var school_version:NSNumber?
    var sort:NSNumber?
    var subject:String?
    var syllable_segment:String?
    var year:String?
    
}
class BookCfgparamModel: NSObject {
    var hot:Bool?
    var name:String?
    var sort:NSNumber?
    var tag:NSNull?
    var type:String?
}
class BookModel: NSObject {
    var commit:String?
    var content_version_id:NSNumber?
    var dict_book_units:Array<BookUnitModel>?
    var dict_books:Array<BookDetailModel>?
    var dict_cfgparam:Array<BookCfgparamModel>?
    var upd_content_latestid:NSNumber?
}
