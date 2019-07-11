//
//  AppDelegate.swift
//  sampleProject
//
//  Created by TeruakiEnomoto on 12/06/2019.
//  Copyright © 2019 TeruakiEnomoto. All rights reserved.
//

//
//  AppDelegate.swiftはProject作成時に自動的に作成されるファイルの一つ。
//    アプリ全体のライフタイムイベントを管理するためのクラス
//    各メソッドが各メソッド名を元にどんな時に呼ばれるのかを予想して記述する
//

import UIKit
import Realm
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
//
//        初回起動画面を動的に切り替える
//

//        Realmに接続
        let realm = try! Realm()
//        Realm内に登録してある一番最初のユーザー情報を取得
        let user = realm.objects(User.self).first
//        .realmファイルが保存されている場所を表示する
        print(Realm.Configuration.defaultConfiguration.fileURL!)
//        どのstoryboardを使うか指定する
        let storybord:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        表示する画面を選択するための箱を作る
        var  viewController:UIViewController

//        ユーザーがいない場合サインイン画面に移動
        if (user == nil) {
//            サインアップしていない場合
            viewController = storybord.instantiateViewController(withIdentifier: "signUp") as UIViewController
        } else {
//            サインアップ済みの場合
            viewController = storybord.instantiateViewController(withIdentifier: "navigation") as UIViewController

        }
        
//        一番最初に表示する画面を選択
        window?.rootViewController = viewController
        
//        何秒表示するか
        sleep(3)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

