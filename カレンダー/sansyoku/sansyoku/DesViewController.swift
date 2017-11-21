//
//  DesViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/11/13.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class DesViewController: UIViewController {

    @IBOutlet weak var mTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mTextView.text = "三色商品群とは ¥n 三色食品群である"
        mTextView.isEditable = false
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
