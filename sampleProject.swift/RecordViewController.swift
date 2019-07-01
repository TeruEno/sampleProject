//
//  RecordViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 28/06/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    @IBOutlet weak var negativeTextField: UITextField!
    @IBOutlet weak var positiveTextField1: UITextField!
    @IBOutlet weak var positiveTextField2: UITextField!
    @IBOutlet weak var positiveTextField3: UITextField!
    @IBOutlet weak var positiveTextField4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didClickRecordBtn(_ sender: Any) {
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
