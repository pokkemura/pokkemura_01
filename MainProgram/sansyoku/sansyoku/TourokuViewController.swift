//
//  TourokuViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/07.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class TourokuViewController: UIViewController {
    //食品登録進捗Bar
    @IBOutlet weak var redBar: UIProgressView!
    @IBOutlet weak var greenBar: UIProgressView!
    @IBOutlet weak var yellowBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Barの太さ変更
        redBar.transform = CGAffineTransform(scaleX: 1.0, y: 4.0)
        greenBar.transform = CGAffineTransform(scaleX: 1.0, y: 4.0)
        yellowBar.transform = CGAffineTransform(scaleX: 1.0, y: 4.0)
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
