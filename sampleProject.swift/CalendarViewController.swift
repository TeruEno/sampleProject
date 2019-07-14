//
//  CullendarViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 23/06/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    @IBOutlet weak var positivesCountLabel: UILabel!
    @IBOutlet weak var negativesCountLabel: UILabel!
    @IBOutlet weak var continueRecordDays: UILabel!
    @IBOutlet weak var totalRecordDays: UILabel!
    
    
    var positives: Positives? = nil
    var negatives: Negatives? = nil
    
    override func loadView() {
        super.loadView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        ポジティブの記録数を表示するための箱
        let positiveThings = positivesCountLabel.text
        //        ネガティブの記録数を表示するための箱
        let negativeThings = negativesCountLabel.text
        //        getPositivesメソッドを呼び出す
        getPositives(with: positiveThings!)
        //        getNegativesメソッドを呼び出す
        getNegatives(with: negativeThings!)
    }
    
    
}


extension CalendarViewController {
    
    //    // 画面遷移の処理
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if (segue.identifier == "toHistory") {
    //            let HistoryView = segue.destination as! HistoryViewController
    //            HistoryView.date = self.date
    //            }
    //        }
    
    // MARK: - FSCalendar Delegate
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //  日付選択時に履歴詳細画面に遷移する
        performSegue(withIdentifier: "toHistory", sender: date)
        
    }
}

//  Realmに関する処理
extension CalendarViewController {
    
    //    全てのポジティブデータを取得する
    //    （記録するときは必ずポジティブが入力されていないといけないので、全ての記録日数を判断するときもポジティブデータで判断できる）
    func getPositives(with positive:String) {
        //          Realmに接続する
        let realm = try! Realm()
        //        ポジティブの個数を取得する
        let resultPositives = realm.objects(Positives.self)
        print(resultPositives.count)
        positivesCountLabel.text = String(resultPositives.count)
        //        ポジティブが記録されている日数を取得する
        
    }
    
    //    全てのネガティブデータを取得する
    func getNegatives(with negatives:String) {
        //        Realmに接続する
        let realm = try! Realm()
        //        ネガティブの個数を取得する
        let resultNegatives = realm.objects(Negatives.self)
        print(resultNegatives.count)
        negativesCountLabel.text = String(resultNegatives.count)
    }
    
}
