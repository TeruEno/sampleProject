//
//  RecordDays.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 2019/07/13.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class RecordDays: Object {
    
    static let realm = try! Realm()
    
//    同じ日付の数を取得する
//      記録するときに日付を判別 -> 日付が同じデータがあればカウントしない
//    let getRecordDays = realm.objects(Positives.self)
    
    func getContinueRecordDays(with number: Int) {
    }
    func getTotalRecordDays(with number:Int) {
//        getRecordDaysのデータの数をカウントする
    }
}
