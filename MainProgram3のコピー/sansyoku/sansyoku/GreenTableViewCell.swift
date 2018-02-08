//
//  GreenTableViewCell.swift
//  sansyoku
//
//  Created by tsit.st2 on 2018/02/08.
//  Copyright © 2018年 Hiroaki Ota. All rights reserved.
//

import UIKit

class GreenTableViewCell: UITableViewCell {
    
    //AppDelegateのuserDefaultsを使用するために必要
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var greenImage: UIImageView!
    @IBOutlet weak var greenLabel: UILabel!
    @IBAction func greenStepper(_ sender: UIStepper) {
        let num = sender.value
        //tensuLabel.text = "\(num)点"
        appDelegate.userDefaults.set(num, forKey: "green")
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
