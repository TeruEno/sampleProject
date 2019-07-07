//
//  RegistViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 12/06/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import RealmSwift

class RegistViewController: UIViewController {
    
//    対象となるuserをnilで定義
    var user: User? = nil
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didClickBtn(_ sender: Any) {
        let userName = userNameTextField.text
//        テキストフィールドの値が空じゃない場合は遷移する
        if userNameTextField.text != "" {
            
            registUser(with: userName!)
            performSegue(withIdentifier: "toStart", sender: userName)
        } else { // 値が空の場合はアラートを表示する
            let alert = UIAlertController(title: "未入力", message: "ユーザー名が入力されていません", preferredStyle: .alert)
//            選択肢
            let yesAction = UIAlertAction(title: "OK", style: .default) {
                (UIAlertAction) in print("OK")
            }
//            選択肢の追加
            alert.addAction(yesAction)
            //        アラートを表示する
            present(alert, animated: true, completion: nil)
            
        }
    }
}

//  Realmに関する処理
extension RegistViewController {
//    UserクラスはUser.swiftで定義
//    User作成
    func registUser(with name:String) {
//        Realmに接続
        let realm = try! Realm()
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
//        登録処理
//        USERの初期化
        user = User()
        user?.id = getMaxId()
        user?.name = name
        user?.date = Date()
        
//        Realmに書き込み
        try! realm.write{   // Realmの書き込みモード
            realm.add(user!)    // DBに追加
        }
    }
    
//    getMaxId
    func getMaxId() -> Int {
        let realm = try! Realm()
        return (realm.objects(User.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    

    //    ログインページをスキップ
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        もしユーザー名が保存されているなら
        let realm = try! Realm()
        let users = realm.objects(User.self)
//        if users == Realm  {
//            performSegue(withIdentifier: "toStart", sender: nil)
//        }
    }
    
}
