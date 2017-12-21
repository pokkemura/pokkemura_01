//
//  ViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/06.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fileSearch()
        csvToArray()
        getDay()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fileEditor() {
        //作成するファイルの名前
        let csvFileName = "datasave.csb"
        let filedata:String = ""
        
        //DocmentディレクトリのfileURLを取得
        if let documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            
            //ディレクトリのパスにファイル名を繋げてフルパス作成
            let csvFilePath = documentDirectoryFileURL.appendingPathComponent(csvFileName)
            
            print("書き込むファイルのパス：\(csvFilePath)")
            
            //書き込み
            do {
                try filedata.write(to: csvFilePath, atomically: true, encoding: String.Encoding.utf8)
            } catch let error as NSError {
                print("failed to write:\(error)")
            }
        }
    }
    
    func fileSearch() {
        let csvFileName = "datasave.csb"
        
        //DocmentディレクトリのfileURLを取得
        if let documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            
            //ディレクトリのパスにファイル名を繋げてフルパス作成
            let csvFilePath = documentDirectoryFileURL.appendingPathComponent(csvFileName).path
            
            let checkValidation = FileManager()
            
            if (checkValidation.fileExists(atPath: csvFilePath)) {
                print("ファイルあり")
            } else {
                print("ファイルなし")
                fileEditor()
            }
        }
    }
    
    func csvToArray() {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //ファイルの名前
        let csvFileName = "datasave.csv"
        
        //ドキュメントフォルダのURL取得
        if let csvPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            
            //ファイルのフルパス作成
            let csvFilePath = csvPath.appendingPathComponent(csvFileName).path
            
            //ファイルの読み込み
            do {
                let csvStr = try String(contentsOfFile:csvFilePath, encoding:String.Encoding.utf8)
                let csvArr = csvStr.components(separatedBy: .newlines)
                print(csvArr)
                appDelegate.csvdata = csvArr
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    func getDay() {
        //現在時刻を取得.
        let myDate: Date = Date()
        
        //カレンダーを取得.
        let myCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        //取得するコンポーネントを決める.
        let myComponetns = myCalendar.components(
            [
                NSCalendar.Unit.year,
                NSCalendar.Unit.month,
                NSCalendar.Unit.day,
                NSCalendar.Unit.hour,
                NSCalendar.Unit.minute,
                NSCalendar.Unit.second,
                NSCalendar.Unit.weekday
            ],from: myDate)
    }
}

