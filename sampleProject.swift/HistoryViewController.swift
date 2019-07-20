//
//  HistoryViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 23/06/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import RealmSwift

// 過去記録詳細画面
class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel: UINavigationItem!
    @IBOutlet weak var eventTableView: UITableView!
    
    //    テーブルで使用するSectionのタイトルの配列
    let sections:NSArray = ["ポジティブ", "ネガティブ"]
    //    カレンダーで選択した日付をDatet型で受け取る
    var targetDate: Date!
    
    //    セクションの表示数
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    //    セクションごとのセルの内容を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    //    セクションのヘッダーにタイトルを設定する
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //        sectionsの中身を表示する
        return sections[section] as? String
    }
    
    //    セルの表示数と内容を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //        if indexPath.section == 0 {
        //            cell.textLabel?.text = "\(users[indexPath.row])"
        //        } else if indexPath.section == 1 {
        //            cell.textLabel?.text = "\(others[indexPath.row])"
        //        }
        return cell
    }
    
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
    
    //    メソッドを定義するときに引数を必要とするのは、引数の値によって結果を変えたいとき。
    //    メソッドは仕組みを作るだけで、決まった値を入れるものではない。
    //    dateは日付、formatは日付の表示形式をメソッドを呼び出すときに決めて使う
    func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

//  Realmに関する処理
extension HistoryViewController {
    //    全てのポジティブを取得するためのメソッドを定義
    func getPositives() {
        //        Realmに接続する
        let realm = try!Realm()
        let calendar = Calendar(identifier: .gregorian)
        let todayStart = calendar.startOfDay(for: targetDate)
        
        let todayEnd: Date = {
            let components = DateComponents(day: 1, second: -1)
            return calendar.date(byAdding: components, to: todayStart)!
        }()
        
        //        Positivesの全てを取得する
        let resultPoives = realm.objects(Positives.self).filter("date BETWEEN %@", [todayStart, todayEnd])
        print(realm.objects(Positives.self).reversed())
        
    }
    //    全てのネガティブを取得するためのメソッドを定義
    func getNegatives() {
        //        Realmに接続する
        let realm = try!Realm()
        //        Positivesの全てを取得する
        let resultNegatives = realm.objects(Negatives.self)
        
    }
}
