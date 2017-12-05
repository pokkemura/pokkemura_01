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
    
    //画像の準備
    let Image0:UIImage = UIImage(named:"illustlist/pig_0")!
    let Image1:UIImage = UIImage(named:"illustlist/pig_1")!
    
    let Image2:UIImage = UIImage(named:"illustlist/chicken_0")!
    let Image3:UIImage = UIImage(named:"illustlist/chicken_1")!
    
    let Image4:UIImage = UIImage(named:"illustlist/cow_0")!
    let Image5:UIImage = UIImage(named:"illustlist/cow_1")!

    //AppDelegateのuserDefaultsを使用するために必要
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デバッグ
//        print("通過1")
        
        //ボタンに関数を関係付ける
        pigButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        chickenButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        cowButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)

        //各ボタン、状態別に画像を指定
        pigButton.setImage(Image0, for: UIControlState.normal)
        pigButton.setImage(Image1, for: UIControlState.selected)
        
        chickenButton.setImage(Image2, for: UIControlState.normal)
        chickenButton.setImage(Image3, for: UIControlState.selected)
        
        cowButton.setImage(Image4, for: UIControlState.normal)
        cowButton.setImage(Image5, for: UIControlState.selected)
        

        //UserDefaultsの設定
        if (appDelegate.userDefaults.object(forKey: "pigButton") == nil){
            //デバッグ
//            print("通過2")
            appDelegate.userDefaults.set(false, forKey: "pigButton")
            appDelegate.userDefaults.set(false, forKey: "chickenButton")
            appDelegate.userDefaults.set(false, forKey: "cowButton")
//            print(appDelegate.userDefaults.bool(forKey: "pigButton"))
//            print(appDelegate.userDefaults.bool(forKey: "chickenButton"))
//            print(appDelegate.userDefaults.bool(forKey: "cowButton"))
            //appDelegate.userDefaults.synchronize()
        } else {
            //デバッグ
//            print("通過3")
//            print(appDelegate.userDefaults.bool(forKey: "pigButton"))
//            print(appDelegate.userDefaults.bool(forKey: "chickenButton"))
//            print(appDelegate.userDefaults.bool(forKey: "cowButton"))

            pigButton.isSelected = appDelegate.userDefaults.bool(forKey: "pigButton")
            chickenButton.isSelected = appDelegate.userDefaults.bool(forKey: "chickenButton")
            cowButton.isSelected = appDelegate.userDefaults.bool(forKey: "cowButton")
        }
        
        //デバッグ
//        print("pigButton State: \(pigButton.isSelected)")


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
//            print("switch0") //debug
        case 1:
            appDelegate.userDefaults.set(button.isSelected, forKey: "cowButton")
//            print("switch1") //debug
        case 2:
            appDelegate.userDefaults.set(button.isSelected, forKey: "chickenButton")
//            print("switch2") //debug
        default: // defaultは必須
//            print("switch_d") //debug
            break
        }
        appDelegate.userDefaults.synchronize()
        
        //デバッグ
//        print("Button State: \(button.isSelected)","Button Tag: \(button.tag)")
//        print(appDelegate.userDefaults.bool(forKey: "pigButton"))
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
