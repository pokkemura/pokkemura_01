//
//  AppDelegate.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/06.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //let touroku = TourokuViewController()
    
    //日付
    var toDay = 0
    var toDays = 0
    var selectDay = 0
    
    //データ受け渡し用
    let userDefaults = UserDefaults.standard
    
    //ゲージ設定用
    //var globalRed = 0
    //var globalGreen = 0
    //var globalYellow = 0
    
    var csvdata:Array<String> = []

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        //アプリ終了直前に呼ばれる
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        //アプリ終了時に呼ばれる
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        //アプリ起動直前に呼ばれる
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        //アプリが開いた時に呼ばれる
    //    touroku.hoge()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        //フリックしてアプリを終了した時に呼ばれる
        

    }

    

}

