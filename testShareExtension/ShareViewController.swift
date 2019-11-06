//
//  ShareViewController.swift
//  testShareExtension
//
//  Created by TeruakiEnomoto on 2019/10/25.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

//    文字が入力されていないとPostを無効にする
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        // ここでcontentTextまたはNSExtensionContext添付ファイルの検証を行います

        return true
    }

//    Postを押したあとの処理
    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.

        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

//    追加項目のリスト管理
    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
