//
//  CullenderViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 23/06/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit

class CullenderViewController: UIViewController {
    @IBOutlet weak var positiveCount: UILabel!
    @IBOutlet weak var negariveCount: UILabel!
    @IBOutlet weak var continueDays: UILabel!
    @IBOutlet weak var recordDays: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showHistoryBtn(_ sender: Any) {
        performSegue(withIdentifier: "toHistory", sender: nil)
    }
    
    @IBAction func showHistoryListBtn(_ sender: Any) {
        performSegue(withIdentifier: "toHistoryList", sender: nil)
    }
    
//    カレンダーをスワイプする処理
    @IBAction func swipeCalendar(_ sender: Any) {
        
    }
}
