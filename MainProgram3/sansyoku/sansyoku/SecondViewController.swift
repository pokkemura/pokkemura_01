//
//  ThirdViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/07.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //ボタン用変数
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var broccoliButton: UIButton!
    @IBOutlet weak var carrotButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var jap_radishButton: UIButton!
    @IBOutlet weak var leekButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var tomatoButton: UIButton!
    @IBOutlet weak var onionButton: UIButton!
    
    //共通変数
    var grobalGreen = 0
    
    
    //画像の準備
    let Image0:UIImage = UIImage(named:"illustlist/apple_0")!
    let Image1:UIImage = UIImage(named:"illustlist/apple_1")!
    
    let Image2:UIImage = UIImage(named:"illustlist/broccoli_0")!
    let Image3:UIImage = UIImage(named:"illustlist/broccoli_1")!
    
    let Image4:UIImage = UIImage(named:"illustlist/carrot_0")!
    let Image5:UIImage = UIImage(named:"illustlist/carrot_1")!
    
    let Image6:UIImage = UIImage(named:"illustlist/banana_0")!
    let Image7:UIImage = UIImage(named:"illustlist/banana_1")!
    
    let Image8:UIImage = UIImage(named:"illustlist/jap_radish_0")!
    let Image9:UIImage = UIImage(named:"illustlist/jap_radish_1")!
    
    let Image10:UIImage = UIImage(named:"illustlist/leek_0")!
    let Image11:UIImage = UIImage(named:"illustlist/leek_1")!
    
    let Image12:UIImage = UIImage(named:"illustlist/orange_0")!
    let Image13:UIImage = UIImage(named:"illustlist/orange_1")!
    
    let Image14:UIImage = UIImage(named:"illustlist/tomato_0")!
    let Image15:UIImage = UIImage(named:"illustlist/tomato_1")!
    
    let Image16:UIImage = UIImage(named:"illustlist/onion_0")!
    let Image17:UIImage = UIImage(named:"illustlist/onion_1")!
    
    //AppDelegateのuserDefaultsを使用するために必要
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //結果
    @IBAction func secondResultButton(_ sender: Any) {
        print(appDelegate.userDefaults.integer(forKey: "red"))
        print(appDelegate.userDefaults.integer(forKey: "green"))
        print(appDelegate.userDefaults.integer(forKey: "yellow"))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //ボタンに関数を関係付ける
        appleButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        broccoliButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        carrotButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        bananaButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        jap_radishButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        leekButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        orangeButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        tomatoButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        onionButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        
        //各ボタン、状態別に画像を指定
        
        appleButton.setImage(Image0, for: UIControlState.normal)
        appleButton.setImage(Image1, for: UIControlState.selected)
        
        broccoliButton.setImage(Image2, for: UIControlState.normal)
        broccoliButton.setImage(Image3, for: UIControlState.selected)
        
        carrotButton.setImage(Image4, for: UIControlState.normal)
        carrotButton.setImage(Image5, for: UIControlState.selected)
        
        bananaButton.setImage(Image6, for: UIControlState.normal)
        bananaButton.setImage(Image7, for: UIControlState.selected)
        
        jap_radishButton.setImage(Image8, for: UIControlState.normal)
        jap_radishButton.setImage(Image9, for: UIControlState.selected)
        
        leekButton.setImage(Image10, for: UIControlState.normal)
        leekButton.setImage(Image11, for: UIControlState.selected)
        
        orangeButton.setImage(Image12, for: UIControlState.normal)
        orangeButton.setImage(Image13, for: UIControlState.selected)
        
        tomatoButton.setImage(Image14, for: UIControlState.normal)
        tomatoButton.setImage(Image15, for: UIControlState.selected)
        
        onionButton.setImage(Image16, for: UIControlState.normal)
        onionButton.setImage(Image17, for: UIControlState.selected)
        
        //UserDefaultsの設定
        if (appDelegate.userDefaults.object(forKey: "appleButton") == nil){
            
            appDelegate.userDefaults.set(false, forKey: "appleButton")
            appDelegate.userDefaults.set(false, forKey: "broccoliButton")
            appDelegate.userDefaults.set(false, forKey: "carrotButton")
            appDelegate.userDefaults.set(false, forKey: "bananaButton")
            appDelegate.userDefaults.set(false, forKey: "jap_radishButton")
            appDelegate.userDefaults.set(false, forKey: "leekButton")
            appDelegate.userDefaults.set(false, forKey: "orangeButton")
            appDelegate.userDefaults.set(false, forKey: "tomatoButton")
            appDelegate.userDefaults.set(false, forKey: "onionButton")
            
        } else {
            print(appDelegate.userDefaults.bool(forKey: "appleButton"))
            
            appleButton.isSelected = appDelegate.userDefaults.bool(forKey: "appleButton")
            broccoliButton.isSelected = appDelegate.userDefaults.bool(forKey: "broccoliButton")
            carrotButton.isSelected = appDelegate.userDefaults.bool(forKey: "carrotButton")
            bananaButton.isSelected = appDelegate.userDefaults.bool(forKey: "bananaButton")
            jap_radishButton.isSelected = appDelegate.userDefaults.bool(forKey: "jap_radishButton")
            leekButton.isSelected = appDelegate.userDefaults.bool(forKey: "leekButton")
            orangeButton.isSelected = appDelegate.userDefaults.bool(forKey: "orangeButton")
            tomatoButton.isSelected = appDelegate.userDefaults.bool(forKey: "tomatoButton")
            onionButton.isSelected = appDelegate.userDefaults.bool(forKey: "onionButton")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //ボタンクリックイベント
    func onClick(_ sender: Any) {
        var btnres:Double = 0.0
        //該当するボタンがクリックされたら、そのボタンのon/offが切り替わる
        let button = sender as! UIButton
        button.isSelected = !button.isSelected
        
        //UserDefaultsにデータを保存：ID順注意！
        switch button.tag {
        case 20:
            appDelegate.userDefaults.set(button.isSelected, forKey: "appleButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "green")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "green")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "green") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "green")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "green")
                }
            }
        case 21:
            appDelegate.userDefaults.set(button.isSelected, forKey: "broccoliButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "green")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "green")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "green") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "green")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "green")
                }
            }
        case 22:
            appDelegate.userDefaults.set(button.isSelected, forKey:
                "carrotButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "green")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "green")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "green") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "green")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "green")
                }
            }
        case 23:
            appDelegate.userDefaults.set(button.isSelected, forKey: "bananaButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "green")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "green")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "green") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "green")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "green")
                }
            }
        case 24:
            appDelegate.userDefaults.set(button.isSelected, forKey: "jap_radishButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "green")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "green")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "green") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "green")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "green")
                }
            }
        case 25:
            appDelegate.userDefaults.set(button.isSelected, forKey: "leekButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "green")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "green")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "green") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "green")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "green")
                }
            }
        case 26:
            appDelegate.userDefaults.set(button.isSelected, forKey: "orangeButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "green")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "green")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "green") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "green")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "green")
                }
            }
        case 27:
            appDelegate.userDefaults.set(button.isSelected, forKey: "tomatoButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "green")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "green")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "green") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "green")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "green")
                }
            }
        case 28:
            appDelegate.userDefaults.set(button.isSelected, forKey: "onionButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "green")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "green")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "green") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "green")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "green")
                }
            }
        default:
            break
        }
        appDelegate.userDefaults.synchronize()
    }
}
