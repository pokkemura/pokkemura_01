//
//  Calendar.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/11/28.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

//日付を表示する
class CustomUICollectionViewCell : UICollectionViewCell{
    
    var textLabel : UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UILabelを生成.
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:frame.width, height:frame.height))
        textLabel?.text = "nil"
        textLabel?.textAlignment = NSTextAlignment.center
        
        // Cellに追加.
        self.contentView.addSubview(textLabel!)
    }
    
}
