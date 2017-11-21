//
//  ThirdViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/11/01.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //ボタン用変数
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var broccoliButton: UIButton!
    @IBOutlet weak var carrotButton: UIButton!
    
    //画像の準備
    let Image0:UIImage = UIImage(named:"illustlist/apple_0")!
    let Image1:UIImage = UIImage(named:"illustlist/apple_1")!
    
    let Image2:UIImage = UIImage(named:"illustlist/broccoli_0")!
    let Image3:UIImage = UIImage(named:"illustlist/broccoli_1")!
    
    let Image4:UIImage = UIImage(named:"illustlist/carrot_0")!
    let Image5:UIImage = UIImage(named:"illustlist/carrot_1")!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ボタンに関数を関係付ける
        appleButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        broccoliButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        carrotButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        
        //各ボタン、状態別に画像を指定
        appleButton.setImage(Image0, for: UIControlState.normal)
        appleButton.setImage(Image1, for: UIControlState.selected)
        
        broccoliButton.setImage(Image2, for: UIControlState.normal)
        broccoliButton.setImage(Image3, for: UIControlState.selected)
        
        carrotButton.setImage(Image4, for: UIControlState.normal)
        carrotButton.setImage(Image5, for: UIControlState.selected)
        


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
