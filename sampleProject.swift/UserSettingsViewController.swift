//
//  UserSettingsViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 2019/07/14.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import RealmSwift

// ユーザ名編集画面
class DiarySettingsViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getUserName()
    }
    
    @IBAction func didClickBtn(_ sender: Any) {
        //        updateUserNameメソッドを呼び出す
        let realm = try! Realm()
        //        Userクラスの全てを取得する（配列になっている）
        let user = realm.objects(User.self)[0]
        updateUserName(with: userNameTextField.text!, for: user)
        //               NavigationControllerの履歴から前の画面に遷移
        navigationController?.popViewController(animated: true)
    }
}

//  Relamに関する処理
extension DiarySettingsViewController {
    //    ユーザーの情報を取得するためのメソッドを定義
    func getUserName() {
        //        Realmに接続する
        let realm = try! Realm()
        //        Userクラスの全てを取得する（配列になっている）
        let UserName = realm.objects(User.self)
        //        UserName配列の一番最初のユーザー名を代入する
        userNameTextField.text = UserName[0].name
    }
    //    ユーザー名の更新処理
    func updateUserName(with name:String, for targetUserName: User) {
        //               Realmに接続
        let realm = try! Realm()
        //               更新処理 UPDATE
        try! realm.write {
            targetUserName.name = name
        }
    }
}
