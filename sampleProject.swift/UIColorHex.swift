//
//  UIColorHex.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 2019/07/23.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit

// UIColorの共通クラス
extension UIColor {
    // hexで色を指定できるようにする処理
    class func hex(string: String, alpha : CGFloat) -> UIColor {
        
        let string_ = string.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: string_ as String)
        var color: UInt32 = 0
        
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        } else {
            return UIColor.white
        }
    }
}
