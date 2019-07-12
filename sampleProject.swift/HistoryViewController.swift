//
//  HistoryViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 23/06/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var textFieldPositive1: UITextField!
    @IBOutlet weak var textFieldPositive2: UITextField!
    @IBOutlet weak var textFieldPositive3: UITextField!
    @IBOutlet weak var textFieldNegative: UITextField!
    
    
    var date: String! // 受け皿の用意
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        dateLabel.text = date // Labelに日付を表示
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didClickEditBtn(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
