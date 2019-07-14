//
//  Negative.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 05/07/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

// Realmではテーブル定義をオブジェクト定義を行う
// 必ずObjectクラスを継承すること
class Negatives: Object {
    
    static let realm = try! Realm()
    
    //    カラムの定義　兼　メンバ変数の定義
    @objc dynamic var id: Int = Int()
    @objc dynamic var negativeText:String = String()
    @objc dynamic var date:Date = Date()
}
