//
//  HistoryViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 23/06/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import RealmSwift
import QuartzCore

// 過去記録詳細画面
class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel: UINavigationItem!
    @IBOutlet weak var eventTableView: UITableView!
    
    
    //    テーブルで使用するSectionのタイトルの配列
    let sections:NSArray = ["ポジティブ", "ネガティブ"]
    //    ポジティブセクションのセルに表示する内容
    var positiveEvents:[Positives] = []
    //    ネガティブセクションのセルに表示する内容
    var negativeEvents:[Negatives] = []
    //    カレンダーで選択した日付をDatet型で受け取る
    var targetDate: Date!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        メソッドを呼び出す
        getNegatives()
        getPositives()
        //        日付表示
        dateLabel.title = targetDate.toString(format: "yyyy/MM/dd")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //    セクションの表示数を設定
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    //    各セクションのセルの表示数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return positiveEvents.count
        } else if section == 1 {
            return negativeEvents.count
        } else {
            return 0
        }
    }
    
    //    セクションのヘッダーにタイトルを設定
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //        sectionsの中身を表示する
        return sections[section] as? String
    }
    
    //    セルの表示数と内容を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 {
            print(positiveEvents)
            cell.textLabel?.text = "\(positiveEvents[indexPath.row].positiveText)"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(negativeEvents[indexPath.row].negativeText)"
        }
        return cell
    }
    
    
    //    メソッドを定義するときに引数を必要とするのは、引数の値によって結果を変えたいとき。
    //    メソッドは仕組みを作るだけで、決まった値を入れるものではない。
    //    dateは日付、formatは日付の表示形式をメソッドを呼び出すときに決めて使う
    func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
//    cellを選択した時の動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        セルの選択を解除
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}

//  Realmに関する処理
extension HistoryViewController {
    //    ポジティブを取得するためのメソッドを定義
    func getPositives() {
        //        Realmに接続する
        let realm = try!Realm()
        
//        日付取得
        let calendar = Calendar(identifier: .gregorian)
        let todayStart = calendar.startOfDay(for: targetDate)
        let todayEnd: Date = {
            let components = DateComponents(day: 1, second: -1)
            return calendar.date(byAdding: components, to: todayStart)!
        }()
        
        //        Positivesを日付指定した分だけ取得する
        let resultPoives = realm.objects(Positives.self).filter("date BETWEEN %@", [todayStart, todayEnd])
//        print(resultPoives)
        return positiveEvents = resultPoives.reversed()
        
    }
    //    ネガティブを取得するためのメソッドを定義
    func getNegatives() {
        //        Realmに接続する
        let realm = try!Realm()
        let calendar = Calendar(identifier: .gregorian)
        let todayStart = calendar.startOfDay(for: targetDate)
        
        let todayEnd: Date = {
            let components = DateComponents(day: 1, second: -1)
            return calendar.date(byAdding: components, to: todayStart)!
        }()
        //        Negativesを日付指定した分だけ取得する
        let resultNegatives = realm.objects(Negatives.self).filter("date BETWEEN %@", [todayStart, todayEnd])
//        print(resultNegatives[0].negativeText)
        return negativeEvents = resultNegatives.reversed()
    }
    
    
}
