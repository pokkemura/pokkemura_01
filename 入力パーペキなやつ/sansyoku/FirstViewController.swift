//
//  FirstViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/11/01.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

   //ボタン用変数

    @IBOutlet weak var pigButton: UIButton!
    @IBOutlet weak var chickenButton: UIButton!
    @IBOutlet weak var cowButton: UIButton!
    @IBOutlet weak var eggButton: UIButton!
    @IBOutlet weak var shrimpButton: UIButton!
    @IBOutlet weak var fishButton: UIButton!
    @IBOutlet weak var octopusButton: UIButton!
    @IBOutlet weak var squidButton: UIButton!
    
    //画像の準備
    let Image0:UIImage = UIImage(named:"illustlist/pig_0")!
    let Image1:UIImage = UIImage(named:"illustlist/pig_1")!
    
    let Image2:UIImage = UIImage(named:"illustlist/chicken_0")!
    let Image3:UIImage = UIImage(named:"illustlist/chicken_1")!
    
    let Image4:UIImage = UIImage(named:"illustlist/cow_0")!
    let Image5:UIImage = UIImage(named:"illustlist/cow_1")!
    
    let Image6:UIImage = UIImage(named:"illustlist/egg_0")!
    let Image7:UIImage = UIImage(named:"illustlist/egg_1")!

    let Image8:UIImage = UIImage(named:"illustlist/shrimp_0")!
    let Image9:UIImage = UIImage(named:"illustlist/shrimp_1")!

    let Image10:UIImage = UIImage(named:"illustlist/fish_0")!
    let Image11:UIImage = UIImage(named:"illustlist/fish_1")!

    let Image12:UIImage = UIImage(named:"illustlist/octopus_0")!
    let Image13:UIImage = UIImage(named:"illustlist/octopus_1")!

    let Image14:UIImage = UIImage(named:"illustlist/squid_0")!
    let Image15:UIImage = UIImage(named:"illustlist/squid_1")!



    //AppDelegateのuserDefaultsを使用するために必要
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        pigButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        chickenButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        cowButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        eggButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        shrimpButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        fishButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        octopusButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        squidButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)

        //各ボタン、状態別に画像を指定
        pigButton.setImage(Image0, for: UIControlState.normal)
        pigButton.setImage(Image1, for: UIControlState.selected)
        
        chickenButton.setImage(Image2, for: UIControlState.normal)
        chickenButton.setImage(Image3, for: UIControlState.selected)
        
        cowButton.setImage(Image4, for: UIControlState.normal)
        cowButton.setImage(Image5, for: UIControlState.selected)
        
        eggButton.setImage(Image6, for: UIControlState.normal)
        eggButton.setImage(Image7, for: UIControlState.selected)

        shrimpButton.setImage(Image8, for: UIControlState.normal)
        shrimpButton.setImage(Image9, for: UIControlState.selected)

        fishButton.setImage(Image10, for: UIControlState.normal)
        fishButton.setImage(Image11, for: UIControlState.selected)

        octopusButton.setImage(Image12, for: UIControlState.normal)
        octopusButton.setImage(Image13, for: UIControlState.selected)

        squidButton.setImage(Image14, for: UIControlState.normal)
        squidButton.setImage(Image15, for: UIControlState.selected)

        

        //UserDefaultsの設定
        if (appDelegate.userDefaults.object(forKey: "pigButton") == nil){
            
            appDelegate.userDefaults.set(false, forKey: "pigButton")
            appDelegate.userDefaults.set(false, forKey: "chickenButton")
            appDelegate.userDefaults.set(false, forKey: "cowButton")
            appDelegate.userDefaults.set(false, forKey: "eggButton")
            appDelegate.userDefaults.set(false, forKey: "shrimpButton")
            appDelegate.userDefaults.set(false, forKey: "fishButton")
            appDelegate.userDefaults.set(false, forKey: "octopusButton")
            appDelegate.userDefaults.set(false, forKey: "squidButton")

        } else {
            print(appDelegate.userDefaults.bool(forKey: "cowButton"))

            pigButton.isSelected = appDelegate.userDefaults.bool(forKey: "pigButton")
            chickenButton.isSelected = appDelegate.userDefaults.bool(forKey: "chickenButton")
            cowButton.isSelected = appDelegate.userDefaults.bool(forKey: "cowButton")
            eggButton.isSelected = appDelegate.userDefaults.bool(forKey: "eggButton")
            shrimpButton.isSelected = appDelegate.userDefaults.bool(forKey: "shrimpButton")
            fishButton.isSelected = appDelegate.userDefaults.bool(forKey: "fishButton")
            octopusButton.isSelected = appDelegate.userDefaults.bool(forKey: "octopusButton")
            squidButton.isSelected = appDelegate.userDefaults.bool(forKey: "squidButton")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //ボタンクリックイベント
    func onClick(_ sender: Any) {
        //該当するボタンがクリックされたら、そのボタンのon/offが切り替わる
        let button = sender as! UIButton
        button.isSelected = !button.isSelected
        
        //UserDefaultsにデータを保存：ID順注意！
        switch button.tag {
        case 0:
            appDelegate.userDefaults.set(button.isSelected, forKey: "pigButton")
        case 1:
            appDelegate.userDefaults.set(button.isSelected, forKey: "cowButton")
        case 2:
            appDelegate.userDefaults.set(button.isSelected, forKey:
                "chickenButton")
        case 3:
            appDelegate.userDefaults.set(button.isSelected, forKey: "eggButton")
        case 4:
            appDelegate.userDefaults.set(button.isSelected, forKey: "shrimpButton")
        case 5:
            appDelegate.userDefaults.set(button.isSelected, forKey: "fishButton")
        case 6:
            appDelegate.userDefaults.set(button.isSelected, forKey: "octopusButton")
        case 7:
            appDelegate.userDefaults.set(button.isSelected, forKey: "squidButton")


        default:
            break
        }
        appDelegate.userDefaults.synchronize()
    }
}
