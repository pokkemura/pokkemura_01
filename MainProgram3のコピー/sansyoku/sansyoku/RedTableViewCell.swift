//
//  RedTableViewCell.swift
//  sansyoku
//
//  Created by tsit.st2 on 2018/02/08.
//  Copyright © 2018年 Hiroaki Ota. All rights reserved.
//

import UIKit

class RedTableViewCell: UITableViewCell {
    
    //AppDelegateのuserDefaultsを使用するために必要
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //RedViewControllerのインスタンス
    let redViewController = RedViewController()
    
    @IBOutlet weak var redImage: UIImageView!
    @IBOutlet weak var redLabel: UILabel!
    @IBAction func redPlusButton(_ sender: UIButton) {
        var num = appDelegate.userDefaults.double(forKey: "red")
        num += 1.0
        appDelegate.userDefaults.set(num, forKey: "red")
    }
    @IBAction func redMinusButton(_ sender: UIButton) {
        var num = appDelegate.userDefaults.double(forKey: "red")
        num -= 1.0
        appDelegate.userDefaults.set(num, forKey: "red")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
