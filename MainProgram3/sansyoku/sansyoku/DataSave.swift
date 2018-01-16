//
//  DataSave.swift
//  sansyoku
//
//  Created by tsit.st2 on 2018/01/16.
//  Copyright © 2018年 Hiroaki Ota. All rights reserved.
//

import UIKit

var mainArray:[[String]] = []

class DataSave: NSObject {
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func arrayCreate() {
        
        var rowArray = appDelegate.csvdata
        rowArray.forEach{
            let items = $0.components(separatedBy: ",")
            mainArray.append(items)
        }
        print(mainArray)
        print("count=" ,rowArray.count)
        appDelegate.countArray = rowArray.count
    }
    
    func getDay() {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //現在時刻を取得.
        
        let fullDate = DateFormatter()
        fullDate.dateFormat = "yyyy-MM-dd"
        let day = DateFormatter()
        day.dateFormat = "dd"
        let now = Date()
        fullDate.string(from: now)
        day.string(from: now)
        
        appDelegate.date = fullDate.string(from: now)
        appDelegate.toDay = day.string(from: now)
    }
    
    func updatecsv() {
        //ファイルの名前
        let csvFileName = "datasave.csv"
        //今日の日付
        let day = Int(appDelegate.toDay)!
        let dayArray = appDelegate.date
        //ファイルに追記する内容
        var redt:String = String(appDelegate.userDefaults.double(forKey: "red"))
        var greent:String = String(appDelegate.userDefaults.double(forKey: "green"))
        var yellowt:String = String(appDelegate.userDefaults.double(forKey: "yellow"))
        let text:String = redt + "," + greent + "," + yellowt + "," + dayArray
        
        print(text)
        print(appDelegate.toDay)
        print(appDelegate.date)
        //ドキュメントフォルダのURL取得
        if let csvPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            
            //ファイルのフルパス作成
            let csvFilePath = csvPath.appendingPathComponent(csvFileName).path
            
            //ファイルの読み込み
            do {
                let csvStr = try String(contentsOfFile:csvFilePath, encoding:String.Encoding.utf8)
                var csvArr = csvStr.components(separatedBy: .newlines)
                print(csvArr) //ファイルから読み込んだ配列の中身
                appDelegate.csvdata = csvArr //appderegateに配列一時保存
                
                
                csvArr.removeLast()
                
                //改行区切りで部活配列を連結する。
                let outputStr = csvArr.joined(separator: "\n")
                //ファイルに書き込み
                try text.write(to: csvPath, atomically: false, encoding: String.Encoding.utf8)
                appDelegate.csvdata = csvArr
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
