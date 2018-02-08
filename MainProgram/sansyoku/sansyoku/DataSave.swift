//
//  DataSave.swift
//  sansyoku
//
//  Created by tsit.st2 on 2018/01/16.
//  Copyright © 2018年 Hiroaki Ota. All rights reserved.
//

import UIKit

class DataSave: NSObject {
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //csv配列
    var mainArray:[[String]] = []
    
    func arrayCreate() {
        
        var rowArray:Array<String> = []
        //ファイルの名前
        let csvFileName = "datasave.csv"
        //ドキュメントフォルダのURL取得
        if let csvPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            
            //ファイルのフルパス作成
            let csvFilePath = csvPath.appendingPathComponent(csvFileName).path
            
            //ファイルの読み込み
            do {
                let csvStr = try String(contentsOfFile:csvFilePath, encoding:String.Encoding.utf8)
                var csvArr = csvStr.components(separatedBy: .newlines)
                rowArray = csvArr
                appDelegate.csvdata = rowArray
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }

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
        fullDate.dateFormat = "yyyyMMdd"
        let day = DateFormatter()
        day.dateFormat = "dd"
        let now = Date()
        fullDate.string(from: now)
        day.string(from: now)
        
        appDelegate.date = fullDate.string(from: now)
        appDelegate.toDay = day.string(from: now)
    }
    
    func updatecsv() {
        arrayCreate()
        getDay()
        
        var csvArr = appDelegate.csvdata
        //ファイルの名前
        let csvFileName = "datasave.csv"
        //今日の日付
        let day = appDelegate.toDay
        let dayArray = appDelegate.date
        //ファイルの最後の番号
        let count = appDelegate.countArray
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
                print(csvArr) //ファイルから読み込んだ配列の中身
                print(count)
                let csv = csvArr[count - 1]
                if (csv.hasSuffix(day)) {
                    csvArr.removeLast()
                }
                csvArr.append(text)
                let str = csvArr.joined(separator: "\n")
                try str.write(toFile: csvFilePath, atomically: true, encoding: String.Encoding.utf8)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
