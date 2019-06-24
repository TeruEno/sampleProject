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
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didClickBtn(_ sender: Any) {
        let userName = userNameTextField.text
//        テキストフィールドの値が空じゃない場合は遷移する
        if userNameTextField.text != "" {
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

