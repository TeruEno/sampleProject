//
//  SettingsTableViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 2019/07/14.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//
import UIKit
import RealmSwift

// 設定画面
class SettingsTableViewController: UITableViewController {
    
    //    テーブルで使用するSectionのタイトルの配列
    var sections: NSArray = ["ユーザー設定", "その他"]
    //    各Sectionで使用するセルの配列
    let users: NSArray = ["ユーザー名"]
    let others: NSArray = ["このアプリを評価する", "ご意見はこちら", "プライバシーポリシー"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    //    セクションの表示数を決める
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return users.count
        } else if section == 1 {
            return others.count
        } else {
            return 0
        }
    }
    
    //    セクションのヘッダーにタイトルを設定する
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //        sectionsの中身を表示する
        return sections[section] as? String
    }
    
    //    セルに表示する内容を設定（セルのインスタンスを生成するメソッド）
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        対象のセルを取り出す
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsTableViewCell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(users[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(others[indexPath.row])"
        }
        return cell
    }
    
    //        画面遷移処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        セルの選択を解除
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        if indexPath.section == 0 {
            performSegue(withIdentifier: "toDiarySettings", sender: nil)
        } else if indexPath.section == 1 {
            print("Value: \(others[indexPath.row])")
        }
    }
}


