//
//  SecondViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/11/01.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //ボタン用変数
    
    @IBOutlet weak var potatoButton: UIButton!
    @IBOutlet weak var mayoButton: UIButton!
    
    //画像の準備
    let Image0:UIImage = UIImage(named:"illustlist/egg_0")!
    let Image1:UIImage = UIImage(named:"illustlist/egg_1")!
    
    let Image2:UIImage = UIImage(named:"illustlist/potato_0")!
    let Image3:UIImage = UIImage(named:"illustlist/potato_1")!
    
    let Image4:UIImage = UIImage(named:"illustlist/mayo_0")!
    let Image5:UIImage = UIImage(named:"illustlist/mayo_1")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ボタンに関数を関係付ける
        potatoButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        mayoButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        
        //各ボタン、状態別に画像を指定
        
        potatoButton.setImage(Image2, for: UIControlState.normal)
        potatoButton.setImage(Image3, for: UIControlState.selected)
        
        mayoButton.setImage(Image4, for: UIControlState.normal)
        mayoButton.setImage(Image5, for: UIControlState.selected)
        
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
