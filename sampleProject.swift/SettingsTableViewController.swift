//
//  SettingsTableViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 2019/07/14.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//
import UIKit
import RealmSwift

class SettingsTableViewController: UITableViewController {
    
    //    各設定のタイトル
    let settings: [String] = ["設定","プッシュ通知", "その他"]
    //    各タイトルの中のセル
    let users:[String] = ["日記名"]
    let others:[String] = ["このアプリを評価する", "お問い合わせ", "プライバシーポリシー"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return settings.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }
    
    //    セルに表示する内容を設定（セルのインスタンスを生成するメソッド）
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        対象のセルを取り出す
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsTableViewCell", for: indexPath)
        //        セルのラベルに配列の値を取り出して代入
        cell.textLabel?.text = users[indexPath.row]
        return cell
    }
    
    //    //        セクションのタイトルを設定するメソッド
    //    func tableView(_tableView: UITableView, titleForHeaderInSection: Int) -> String? {
    //        return "\(settings[0])"
    //    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
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
    
    //        画面遷移処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(users[indexPath.row])
        //        セルの選択を解除
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
//        Switch文でsettingsの中身によって変更
    }
}
