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

// カレンダー画面
class CalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    @IBOutlet weak var positivesCountLabel: UILabel!
    @IBOutlet weak var negativesCountLabel: UILabel!
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
        //        NavigationBarのタイトル表示
        getUserName()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    // カレンダーの日付を選択したときにHistoryViewControllerに選択した日付の情報を送る
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
        let newDate = selectDate.addingTimeInterval(TimeInterval(NSTimeZone.local.secondsFromGMT()))
        //  日付選択時に履歴詳細画面に遷移する
        performSegue(withIdentifier: "toHistory", sender: newDate)
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
    
    
    //    RealmDBから日付が最初(0時）と最後(24時)の間で設定されているデータを取得し、そのデータの数を返すようにすることで任意の日付に任意の数の点マークがつけられるようになる。
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int{
        var tmpList: Results<Positives>!
        // 対象の日付が設定されているデータを取得する
        do {
            let realm = try Realm()
            let predicate = NSPredicate(format: "%@ =< date AND date < %@", getBeginingAndEndOfDay(date).begining as CVarArg, getBeginingAndEndOfDay(date).end as CVarArg)
            tmpList = realm.objects(Positives.self).filter(predicate)
        } catch {
        }
        return tmpList.count
    }
    
    // 日の始まりと終わりを取得
    private func getBeginingAndEndOfDay(_ date:Date) -> (begining: Date , end: Date) {
        let begining = Calendar(identifier: .gregorian).startOfDay(for: date)
        let end = begining + 24 * 60 * 60
        return (begining, end)
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
    
    //    ユーザー名を取得する
    func getUserName() {
        //        Realmに接続する
        let realm = try! Realm()
        //        Userクラスの全てを取得する（配列になっている）
        let UserName = realm.objects(User.self)
        //        UserName配列の一番最初のユーザー名を代入する
        self.parent?.navigationItem.title = UserName[0].name
    }
}

