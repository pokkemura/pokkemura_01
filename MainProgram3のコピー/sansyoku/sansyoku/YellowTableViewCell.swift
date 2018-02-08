//
//  YellowTableViewCell.swift
//  sansyoku
//
//  Created by tsit.st2 on 2018/02/08.
//  Copyright © 2018年 Hiroaki Ota. All rights reserved.
//

import UIKit

class YellowTableViewCell: UITableViewCell {
    
    //AppDelegateのuserDefaultsを使用するために必要
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var yellowImage: UIImageView!
    @IBOutlet weak var yellowLabel: UILabel!
    @IBAction func yellowStepper(_ sender: UIStepper) {
        let num = sender.value
        //tensuLabel.text = "\(num)点"
        appDelegate.userDefaults.set(num, forKey: "yellow")
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
