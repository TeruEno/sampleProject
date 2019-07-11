//
//  CullendarViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 23/06/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import FSCalendar
import Realm
import RealmSwift

class CalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    @IBOutlet weak var positivesCountLabel: UILabel!
    @IBOutlet weak var negativesCountLabel: UILabel!
    @IBOutlet weak var continueDays: UILabel!
    @IBOutlet weak var recordDays: UILabel!
    
    
    var positives: [Positives] = []
    var negatives: [Negatives] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}


extension CalendarViewController {
    // MARK: - FSCalendar Delegate
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //  日付選択時に履歴詳細画面に遷移する
        performSegue(withIdentifier: "toHistory", sender: date)
        
    }
}

//  Realmに関する処理
extension CalendarViewController {
    
//    全てのポジティブデータを取得する
    func getPositives(with positive:Int) {
//          Realmに接続する
        let realm = try! Realm()
//        ポジティブの個数を取得する
        let results = realm.objects(Positives.self)
        var positives = results.count
        
    }
    
}
