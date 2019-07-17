//
//  HistoryViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 23/06/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var eventTableView: UITableView!
    
    //    テーブルで使用するSectionのタイトルの配列
    let sections:NSArray = ["ポジティブ", "ネガティブ"]
    //    セクションの表示数と内容を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    //    セルの表示数と内容を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
    /*
     var date: String! // 受け皿の用意
     
     
     override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
     //        dateLabel.text = date // Labelに日付を表示
     }
     override func viewDidLoad() {
     super.viewDidLoad()
     
     // Do any additional setup after loading the view.
     }
     */
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//  Realmに関する処理
extension HistoryViewController {
    //    全てのポジティブを取得するためのメソッドを定義
    func getPositives() {
        //        Realmに接続する
        let realm = try!Realm()
        //        Positivesの全てを取得する
        let resultPositives = realm.objects(Positives.self)
        
    }
    //    全てのネガティブを取得するためのメソッドを定義
    func getNegatives() {
        //        Realmに接続する
        let realm = try!Realm()
        //        Positivesの全てを取得する
        let resultPositives = realm.objects(Positives.self)
        
    }
}
