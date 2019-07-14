//
//  User.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 04/07/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

// Realmではテーブル定義をオブジェクト定義を行う
// 必ずObjectクラスを継承すること
class User: Object {
//    カラムの定義　兼　メンバ変数の定義
    @objc dynamic var id: Int = Int()
    @objc dynamic var name: String = String()
    @objc dynamic var date: Date = Date()
    
    
    
}
