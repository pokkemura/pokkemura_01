//
//  TourokuViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/07.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class TourokuViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    //データ保存ファイルのインスタンス
    let datasave = DataSave()
    
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
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.preferredContentSize = CGSize(width: 200, height: 300)
        let popView = segue.destination.popoverPresentationController
        popView!.delegate = self
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }*/
    
    @IBAction func unwind(_ segue:UIStoryboardSegue){
        loadView()
        setBar()
    }
    
    func setBar() {
        //Barの太さ変更
        redBar.transform = CGAffineTransform(scaleX: 1.0, y: 9.0)
        greenBar.transform = CGAffineTransform(scaleX: 1.0, y: 9.0)
        yellowBar.transform = CGAffineTransform(scaleX: 1.0, y: 9.0)
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
