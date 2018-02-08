//
//  ViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/06.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //データ保存ファイルのインスタンス
    let datasave = DataSave()
    
    //appderegateのインスタンス
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background image
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "illustlist/splash.jpg")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        
        fileSearch()
        csvToArray()
        datasave.getDay()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(_ segue:UIStoryboardSegue){
    }

    func fileEditor() {
        
        datasave.getDay()
        let dayArray = appDelegate.date
        let text:String = "0.0,0.0,0.0,"
        let formatFile:String = text + dayArray
        
        //作成するファイルの名前
        let csvFileName = "datasave.csv"
        let filedata:String = formatFile
        
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
    
    //csvfileがあるかの検索
    func fileSearch() {
        let csvFileName = "datasave.csv"
        
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
}

