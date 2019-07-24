//
//  RecordDetailViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 2019/07/24.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit

class RecordDetailViewController: UIViewController {

    var recordDetail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.hex(string: "FDECB3", alpha: 1)
        
        self.view.addSubview(UneditableText(frame: self.view.frame, text: recordDetail))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
