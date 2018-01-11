//
//  TourokuViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/07.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class TourokuViewController: UIViewController {
    //食品登録進捗Bar
    @IBOutlet weak var redBar: UIProgressView!
    @IBOutlet weak var greenBar: UIProgressView!
    @IBOutlet weak var yellowBar: UIProgressView!
    
    //AppDelegateのuserDefaultsを使用するために必要
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(_ segue:UIStoryboardSegue){
        loadView()
        setBar()
        updatecsv()
    }
    
    func setBar() {
        //Barの太さ変更
        redBar.transform = CGAffineTransform(scaleX: 1.0, y: 6.0)
        greenBar.transform = CGAffineTransform(scaleX: 1.0, y: 6.0)
        yellowBar.transform = CGAffineTransform(scaleX: 1.0, y: 6.0)
        
        let red:Double = Double(appDelegate.userDefaults.integer(forKey: "red"))
        let i:Double = red * 1.7
        redBar.progress = Float(i) / 10
        
        let green:Double = Double(appDelegate.userDefaults.integer(forKey: "green"))
        let j:Double = green * 3.4
        greenBar.progress = Float(j) / 10
        
        let yellow:Double = Double(appDelegate.userDefaults.integer(forKey: "yellow"))
        let k:Double = yellow * 1.4
        yellowBar.progress = Float(k) / 10
        
        print(appDelegate.userDefaults.integer(forKey: "red"))
        print(appDelegate.userDefaults.integer(forKey: "green"))
        print(appDelegate.userDefaults.integer(forKey: "yellow"))
        
    }
    
    func updatecsv() {
        //ファイルの名前
        let csvFileName = "datasave.csv"
        //今日の日付
        let dayArray = appDelegate.toDay
        let text = ""
        
        //ドキュメントフォルダのURL取得
        if let csvPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            
            //ファイルのフルパス作成
            let csvFilePath = csvPath.appendingPathComponent(csvFileName).path
            
            //ファイルの読み込み
            do {
                let csvStr = try String(contentsOfFile:csvFilePath, encoding:String.Encoding.utf8)
                var csvArr = csvStr.components(separatedBy: .newlines)
                print(csvArr) //ファイルから読み込んだ配列の中身
                appDelegate.csvdata = csvArr
                csvArr.removeLast()
                /*for day in 0..<32{
                    if ([day][3].hasSuffix(today)) {
                        result = day
                        break
                    }
                }*/
                //改行区切りで部活配列を連結する。
                let outputStr = csvArr.joined(separator: "\n")
                try outputStr.write(to: csvPath, atomically: false, encoding: String.Encoding.utf8)
                appDelegate.csvdata = csvArr
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
