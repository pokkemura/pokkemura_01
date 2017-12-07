//
//  ViewController.swift
//  Button
//
//  Created by tsit.st2 on 2017/11/20.
//  Copyright © 2017年 Asahi Yamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //ボタン用変数
    @IBOutlet weak var appleButton: UIButton!
   // @IBOutlet weak var appleButton1: UIButton!
    
    
    //画像の準備
    let Image0:UIImage = UIImage(named:"illustlist/apple_0")!
    let Image1:UIImage = UIImage(named:"illustlist/apple_1")!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ボタンに関数を関係づける
        appleButton.addTarget(self, action: #selector(self.onClick(_:)), for: .touchUpInside)
        
        //各ボタン、状態別に画像を指定
        appleButton.setImage(Image0, for: UIControlState.normal)
        appleButton.setImage(Image1, for: UIControlState.selected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ボタンクリックイベント
    func onClick(_ sender: Any) {
    //該当するボタンがクリックされたら、そのボタンをオンオフする
    let button = sender as! UIButton
    button.isSelected = !button.isSelected
    
    }


}

