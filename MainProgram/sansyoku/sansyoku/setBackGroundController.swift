//
//  setBackGroundController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2018/01/23.
//  Copyright © 2018年 Hiroaki Ota. All rights reserved.
//

import UIKit

class setBackGroundController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background image
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "illustlist/background.jpg")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)

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
