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
    @IBOutlet weak var beefButton: UIButton!
    @IBOutlet weak var chickenButton: UIButton!
    @IBOutlet weak var pigButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //ボタンに関数を関係付ける
        beefButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        chickenButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)
        pigButton.addTarget(self, action: #selector(self.onClick(_:)), for:
            .touchUpInside)


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
