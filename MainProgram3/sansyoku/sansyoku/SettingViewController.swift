//
//  SettingViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2018/01/23.
//  Copyright © 2018年 Hiroaki Ota. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBAction func topButton(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "topPage")
        present(nextView, animated: true, completion: nil)
    }
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func manButton(_ sender: Any) {
        appDelegate.tensu = 25
    }
    @IBAction func womanButton(_ sender: Any) {
        appDelegate.tensu = 20
    }
    //データ保存ファイルのインスタンス
    let datasave = DataSave()

    @IBAction func fileReset(_ sender: Any) {
        fileEditor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            let csvFilePathString = documentDirectoryFileURL.appendingPathComponent(csvFileName).path
            
            print("書き込むファイルのパス：\(csvFilePath)")
            
            // 削除処理
            do {
                try FileManager.default.removeItem(atPath: csvFilePathString)
            } catch {
                print("削除に失敗")
            }
            
            //書き込み
            do {
                try filedata.write(to: csvFilePath, atomically: true, encoding: String.Encoding.utf8)
            } catch let error as NSError {
                print("failed to write:\(error)")
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
