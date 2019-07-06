//
//  RecordViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 28/06/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import RealmSwift

class RecordViewController: UIViewController {
    @IBOutlet weak var negativeLabel: UILabel!
    @IBOutlet weak var positiveLabel: UILabel!
    @IBOutlet weak var negativeTextField: UITextField!
    @IBOutlet weak var positiveTextField1: UITextField!
    @IBOutlet weak var positiveTextField2: UITextField!
    @IBOutlet weak var positiveTextField3: UITextField!
    @IBOutlet weak var positiveTextField4: UITextField!
    
//    対象となるnegativeをnilで定義
    var negative: Negative? = nil
//    対象となるpositiveをnilで定義
    var positive: Positive? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didClickRecordBtn(_ sender: Any) {
//        negativeが入力されていてpositiveが空欄の場合
//        または、
//        negativeとpositiveの両方が空欄の場合
        if negativeTextField.text != "" && positiveTextField1.text == "" && positiveTextField2.text == "" && positiveTextField3.text == "" && positiveTextField4.text == "" || negativeTextField.text == "" && positiveTextField1.text == "" && positiveTextField2.text == ""  && positiveTextField3.text == "" && positiveTextField4.text == "" {
            let alert = UIAlertController(title: "入力不足", message: "ポジティブランが入力されていません。入力してください。", preferredStyle: .alert)
//            選択肢
            let yesAction = UIAlertAction(title: "OK", style: .default) {
                (UIAlertAction) in print("OK")
            }
//                選択肢の追加
            alert.addAction(yesAction)
//                アラートを表示する
            present(alert, animated: true, completion: nil)
        } else {    //  Realmにデータを保存する
        }
    }

}

//  Realmに関する処理
extension RecordViewController {
//    NegativeクラスはNegative.swiftで定義済み
//    Negative作成
    func recordNegative(with text: String) {
//        Realmに接続
        let realm = try! Realm()
//        登録処理
//        Negativeの初期化
        negative = Negative()
        negative?.id = getNegativeMaxId()
        negative?.negativeText = text
        negative?.date = Date()
        
//        Realmに書き込み
        try! realm.write {      //  Realmに書き込みモード
            realm.add(negative!)        //  DBに追加
        }
    }
//        getNegativeMaxId
    func getNegativeMaxId() -> Int {
        let realm = try! Realm()
        return (realm.objects(Negative.self).max(ofProperty:"id")as Int? ?? 0) + 1
    }
    
    
//    Positive作成
//    PositiveクラスはPositive.swiftで定義済み
    func recordPositive(with text: String){
//        Realmに接続
        let realm = try! Realm()
//        登録処理
//        Positiveの初期化
        positive = Positive()
        positive?.id = getPositiveMaxId()
        positive?.positiveText = text
        positive?.date = Date()
//        Realmに書き込み
        try! realm.write{       //  Realmの書き込みモード
            realm.add(positive!)        //  DBに追加
        }
    }
//    getPositiveMaxId
    func getPositiveMaxId() -> Int {
        let realm = try! Realm()
        return (realm.objects(Positive.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}
