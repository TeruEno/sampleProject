//
//  extendDateClass.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 2019/07/19.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import Foundation

/// Date拡張(文字列)
public extension Date {
    
    // MARK: Public Methods
    
    /// 日付→文字列に変換する
    ///
    /// - Parameter format: フォーマット
    /// - Returns: 変換後の文字列
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: format, options: 0,
                                                        locale: Locale(identifier: "ja_JP"))
        return formatter.string(from: self)
    }
    
}
