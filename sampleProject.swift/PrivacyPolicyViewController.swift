//
//  PrivacyPolicyViewController.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 2019/07/23.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

import UIKit

// 個人情報保護方針画面
class PrivacyPolicyViewController: UIViewController {
    
    @IBOutlet weak var titlePageLabel: UINavigationItem!
    var titlePage: String = ""
    // テキストを設定
    let text =
    "本プライバシーポリシーは、「Thought to Ponder」（以下、「当アプリ」とします。)の各種サービス（当サイトによる情報提供、各種お問合せの受付等）において、当アプリの訪問者（以下、「訪問者」とします。）の個人情報もしくはそれに準ずる情報を取り扱う際に、当サイトが遵守する方針を示したものです。\n\n1.基本方針\n 当サイトは、個人情報の重要性を認識し、個人情報を保護することが社会的責務であると考え、個人情報に関する法令を遵守し、当サイトで取扱う個人情報の取得、利用、管理を適正に行います。当サイトで収集した情報は、利用目的の範囲内で適切に取り扱います。\n\n2.適用範囲\n 本プライバシーポリシーは、当アプリにおいてのみ適用されます。\n\n3.個人情報の管理\n 当サイトは、訪問者からご提供いただいた情報の管理について、以下を徹底します。\n 3-1.情報の正確性の確保 訪問者からご提供いただいた情報については、常に正確かつ最新の情報となるよう努めます。\n 3-2.安全管理措置 当サイトは、個人情報の漏洩や滅失又は棄損を防止するために、適切なセキリュティ対策を実施して個人情報を保護します。\n 3-3.個人情報の廃棄 個人情報が不要となった場合には、すみやかに廃棄します。\n 3-4.訪問者ご本人からの個人情報の開示、訂正、追加、削除、利用停止のご希望の場合には、ご本人であることを確認させていただいた上、速やかに対応させていただきます。 上記を希望される場合は、以下のメールアドレスまでお問い合わせください。\n メールアドレス：tleqrv4560@yahoo.co.jp \n\n4.個人情報の第三者への提供について 当サイトは、訪問者からご提供いただいた個人情報を、訪問者本人の同意を得ることなく第三者に提供することはありません。また、今後第三者提供を行うことになった場合には、提供する情報と提供目的などを提示し、訪問者から同意を得た場合のみ第三者提供を行います。\n\n5.お問い合わせ先 当サイト、又は個人情報の取扱いに関しては、下記のメールアドレスにてお問い合わせください。\n 当アプリ運営者：榎本旭晃 メールアドレス：tleqrv4560@yahoo.co.jp\n\n6.第三者配信の広告サービスについて 当サイトは、第三者配信の広告サービス「Google Admob（グーグルアドモブ）」を利用しています。 Googleなどの第三者広告配信事業者は、訪問者の興味に応じた広告を表示するために、Cookie（当サイトの訪問者が当サイトや他のサイトにアクセスした際の情報など）を使用することがあります。 訪問者は、広告設定で訪問者に合わせた広告（以下、「パーソナライズド広告」とします。）を無効にすることが出来ます。その設定をする場合は、こちらをクリックしてください。また、www.aboutads.infoにアクセスすれば、パーソナライズド広告に使われる第三者配信事業者の Cookie を無効にできます。 第三者配信による広告掲載を無効にしていない場合は、第三者配信事業者や広告ネットワークの配信する広告がサイトに掲載されることがあります。 Googleによって広告の第三者配信が認められている広告配信事業者の詳細は、ここをクリックしてください。\n\n7.プライバシーポリシーの変更について 当サイトは、個人情報に関して適用される日本の法令を遵守するとともに、本プライバシーポリシーの内容を適宜見直しその改善に努めます。修正された最新のプライバシーポリシーは常に本ページにて開示されます。\n\n令和元年 07月22日 策定"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlePageLabel.title = titlePage
        
        self.view.backgroundColor = UIColor(hex: "#FDECB3", alpha: 1)
        
        self.view.addSubview(UneditableText(frame: self.view.frame, text: text))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}