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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fileEditor() {
        //作成するファイルの名前
        let csvFileName = "datasave.csv"
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
}

