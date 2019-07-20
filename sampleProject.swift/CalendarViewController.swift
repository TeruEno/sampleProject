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
    @IBOutlet weak var statusCalendar: FSCalendar!
    
    
    //    positivesに入るのはPositivesクラスの値、もしくはnil
    //    positives: Positives = ~ と書いたらnilも入らない
    var positives: Positives? = nil
    var negatives: Negatives? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        //        getPositivesメソッドを呼び出す
        getPositives()
        //        getNegativesメソッドを呼び出す
        getNegatives()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        /*
        //        記録した日付を取得
        let calendar = Calendar.current
        let selectDate = calendar.date(from: DateComponents(year: 2018, month: 6, day: 19))
        statusCalendar.select(selectDate)
        */
    }
    
    
    
    // カレンダーの日付を選択したときの画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHistory" {
            let historyViewController = segue.destination as! HistoryViewController
            //            historyViewController.targetStringDate = sender as! String
            historyViewController.targetDate = sender as? Date
            
        }
    }
    
}

//  FSCalendarの日付に関する処理
extension CalendarViewController {
    
    // 選択した日付の取得
    func calendar(_ calendar: FSCalendar, didSelect selectDate: Date, at monthPosition: FSCalendarMonthPosition) {
        //  日付選択時に履歴詳細画面に遷移する
        performSegue(withIdentifier: "toHistory", sender: selectDate)
    }
    
}



//  Realmに関する処理
extension CalendarViewController {
    
    //    全てのポジティブデータを取得するためのメソッドを定義
    //    （記録するときは必ずポジティブが入力されていないといけないので、全ての記録日数を判断するときもポジティブデータで判断できる）
    func getPositives() {
        //          Realmに接続する
        let realm = try! Realm()
        //        Positivesの全てを並び替えて取得する
        let resultPositives = realm.objects(Positives.self).sorted(byKeyPath: "date", ascending: true)
        //        取得したPositivesの数をカウントして代入
        positivesCountLabel.text = String(resultPositives.count)
        
        
        //        日付の形を定義するための定数を定義する
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)!
        //        "yyyy/MM/dd"の形にするための宣言
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd", options: 0, locale: Locale(identifier: "ja_JP"))
        //        記録されているPositivesの日付を取得して変数に入れる
        //        変数定義
        var recordDays: [String] = []
        //        同じ日付が変数に入っていなければ、入れない
        for positive in resultPositives {
            if !recordDays.contains(formatter.string(from: positive.date))  {
                recordDays.append(formatter.string(from: positive.date))
            }
        }
        //        合計記録日数を代入
        totalRecordDays.text = String(recordDays.count)
        
    }
    
    //    全てのネガティブデータを取得するためのメソッド定義
    func getNegatives() {
        //        Realmに接続する
        let realm = try! Realm()
        //        Negativesクラスの全てを取得する
        let resultNegatives = realm.objects(Negatives.self)
        //        Negativesのラベルにネガティブの数をカウントして代入
        negativesCountLabel.text = String(resultNegatives.count)
    }
    
}
