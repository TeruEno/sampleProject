//
//  Positive.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 05/07/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

//  Realmではテーブル定義をオブジェクト定義で行う
class Positives: Object {
    
    static let realm = try! Realm()
    //    カラムの定義　兼　メンバ変数の定義
    @objc dynamic var id: Int = Int()
    @objc dynamic var positiveText: String = String()
    @objc dynamic var date: Date = Date()
    @objc dynamic var continueRecordDays: Int = Int()
    @objc dynamic var totalRecordDays: Int = Int()
}
