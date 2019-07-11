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
    
    
    var positives: Positives? = nil
    var negatives: Negatives? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let positiveThings = positivesCountLabel.text
        getPositives(with: positiveThings!)
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
    func getPositives(with positive:String) {
//          Realmに接続する
        let realm = try! Realm()
//        ポジティブの個数を取得する
        let resultPositives = realm.objects(Positives.self)
        print(resultPositives.count)
        positivesCountLabel.text = String(resultPositives.count)
    }
    
}
