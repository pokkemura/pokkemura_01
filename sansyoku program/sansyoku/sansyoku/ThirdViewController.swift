//
//  SecondViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/07.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let datasave = DataSave()
    
    //ボタン用変数
    @IBOutlet weak var potatoButton: UIButton!
    @IBOutlet weak var mayoButton: UIButton!
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var sweet_potatoButton: UIButton!
    @IBOutlet weak var riceButton2: UIButton!
    @IBOutlet weak var menButton: UIButton!
    
    //画像の準備
    let Image0:UIImage = UIImage(named:"illustlist/potato_0")!
    let Image1:UIImage = UIImage(named:"illustlist/potato_1")!
    
    let Image2:UIImage = UIImage(named:"illustlist/mayo_0")!
    let Image3:UIImage = UIImage(named:"illustlist/mayo_1")!
    
    let Image4:UIImage = UIImage(named:"illustlist/rice_0")!
    let Image5:UIImage = UIImage(named:"illustlist/rice_1")!
    
    let Image6:UIImage = UIImage(named:"illustlist/sweet_potato_0")!
    let Image7:UIImage = UIImage(named:"illustlist/sweet_potato_1")!
    
    let Image8:UIImage = UIImage(named:"illustlist/rice_0")!
    let Image9:UIImage = UIImage(named:"illustlist/rice_1")!
    
    let Image10:UIImage = UIImage(named:"illustlist/men_0")!
    let Image11:UIImage = UIImage(named:"illustlist/men_1")!
    
    //AppDelegateのuserDefaultsを使用するために必要
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //結果
    @IBAction func thirdResultButton(_ sender: Any) {
        print(appDelegate.userDefaults.integer(forKey: "red"))
        print(appDelegate.userDefaults.integer(forKey: "green"))
        print(appDelegate.userDefaults.integer(forKey: "yellow"))
        datasave.updatecsv()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ボタンに関数を関係付ける
        potatoButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        mayoButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        riceButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        sweet_potatoButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        riceButton2.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        menButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        
        //各ボタン、状態別に画像を指定
        potatoButton.setImage(Image0, for: UIControlState.normal)
        potatoButton.setImage(Image1, for: UIControlState.selected)
        
        mayoButton.setImage(Image2, for: UIControlState.normal)
        mayoButton.setImage(Image3, for: UIControlState.selected)
        
        riceButton.setImage(Image4, for: UIControlState.normal)
        riceButton.setImage(Image5, for: UIControlState.selected)
        
        sweet_potatoButton.setImage(Image6, for: UIControlState.normal)
        sweet_potatoButton.setImage(Image7, for: UIControlState.selected)
        
        riceButton2.setImage(Image8, for: UIControlState.normal)
        riceButton2.setImage(Image9, for: UIControlState.selected)
        
        menButton.setImage(Image10, for: UIControlState.normal)
        menButton.setImage(Image11, for: UIControlState.selected)
        
        //UserDefaultsの設定
        if (appDelegate.userDefaults.object(forKey: "potatoButton") == nil){
            
            appDelegate.userDefaults.set(false, forKey: "potatoButton")
            appDelegate.userDefaults.set(false, forKey: "mayoButton")
            appDelegate.userDefaults.set(false, forKey: "riceButton")
            appDelegate.userDefaults.set(false, forKey: "sweet_potatoButton")
            appDelegate.userDefaults.set(false, forKey: "riceButton2")
            appDelegate.userDefaults.set(false, forKey: "menButton")
            
        } else {
            print(appDelegate.userDefaults.bool(forKey: "potatoButton"))
            
            potatoButton.isSelected = appDelegate.userDefaults.bool(forKey: "potatoButton")
            mayoButton.isSelected = appDelegate.userDefaults.bool(forKey: "mayoButton")
            riceButton.isSelected = appDelegate.userDefaults.bool(forKey: "riceButton")
            sweet_potatoButton.isSelected = appDelegate.userDefaults.bool(forKey: "sweet_potatoButton")
            riceButton2.isSelected = appDelegate.userDefaults.bool(forKey: "riceButton2")
            menButton.isSelected = appDelegate.userDefaults.bool(forKey: "menButton")
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
        case 40:
            appDelegate.userDefaults.set(button.isSelected, forKey: "potatoButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "yellow")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "yellow")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "yellow") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "yellow")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "yellow")
                }
            }
        case 41:
            appDelegate.userDefaults.set(button.isSelected, forKey: "mayoButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "yellow")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "yellow")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "yellow") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "yellow")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "yellow")
                }
            }
        case 42:
            appDelegate.userDefaults.set(button.isSelected, forKey:
                "riceButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "yellow")
                btnres += 2.0
                appDelegate.userDefaults.set(btnres, forKey: "yellow")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "yellow") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "yellow")
                    btnres -= 2.0
                    appDelegate.userDefaults.set(btnres, forKey: "yellow")
                }
            }
        case 43:
            appDelegate.userDefaults.set(button.isSelected, forKey: "sweet_potatoButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "yellow")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "yellow")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "yellow") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "yellow")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "yellow")
                }
            }
        case 44:
            appDelegate.userDefaults.set(button.isSelected, forKey:
                "riceButton2")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "yellow")
                btnres += 6.0
                appDelegate.userDefaults.set(btnres, forKey: "yellow")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "yellow") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "yellow")
                    btnres -= 6.0
                    appDelegate.userDefaults.set(btnres, forKey: "yellow")
                }
            }
        case 45:
            appDelegate.userDefaults.set(button.isSelected, forKey:
                "menButton")
            if (button.isSelected == true){
                btnres += appDelegate.userDefaults.double(forKey: "yellow")
                btnres += 1.0
                appDelegate.userDefaults.set(btnres, forKey: "yellow")
            } else {
                if (appDelegate.userDefaults.integer(forKey: "yellow") > 0) {
                    btnres += appDelegate.userDefaults.double(forKey: "yellow")
                    btnres -= 1.0
                    appDelegate.userDefaults.set(btnres, forKey: "yellow")
                }
            }
        default:
            break
        }
        appDelegate.userDefaults.synchronize()
    }
}
