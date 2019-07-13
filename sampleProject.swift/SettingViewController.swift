//
//  SettingViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 01/07/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var settingTableView: UITableView!
    
    let settings: [String] = ["設定", "その他"]
    let users = ["user's name", "passcode"]
    
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
    }
    
    //    テーブル内のセクション数を決めるメソッド
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //   セクション内のセル数を決めるメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    //    セルに表示する内容を設定（セルのインスタンスを生成するメソッド）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        対象のセルを取り出す
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //        セルのラベルに配列の値を取り出して代入
        cell.textLabel?.text = users[indexPath.row]
        return cell
    }
    
    //    //        セクションのタイトルを設定するメソッド
    //    func tableView(_tableView: UITableView, titleForHeaderInSection: Int) -> String? {
    //        return "\(settings[0])"
    //    }
    
    //        画面遷移処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(users[indexPath.row])
        //        セルの選択を解除
        settingTableView.deselectRow(at: indexPath as IndexPath, animated: true)
        if users[indexPath.row] == "user's name" {
            performSegue(withIdentifier: "toUser'sName", sender: nil)
        } else {
            
        }
    }
}
