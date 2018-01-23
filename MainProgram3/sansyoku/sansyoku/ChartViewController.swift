//
//  ChartViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/13.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController{
    
    @IBOutlet weak var dayViewController: DayViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let datasave = DataSave()
        datasave.arrayCreate()
        
        //グラフ用変数
        var i:Double = 0
        var j:Double = 0
        var k:Double = 0
        
        //var todays = String(appDelegate.toDay)
        var selectDays = String(appDelegate.selectDay)
        //日付をforで回して選んだ日を特定
        for day in 0..<32{
            //配列の日付が選んだ日と合致する場合変数に代入
            if (appDelegate.mainArray[day][3].hasSuffix(selectDays)) {
                i = Double(appDelegate.mainArray[day][0])!
                j = Double(appDelegate.mainArray[day][1])!
                k = Double(appDelegate.mainArray[day][2])!
                break
            } else {
                print("中身なし")
                break
            }
        }
        
        //グラフ設定用計算
        i = i * 20
        j = j * 40 + i
        k = k * 17.15 + j

        //グラフを設定
        var segments = [Segment]()
        segments.append(Segment(color: .red, angle: CGFloat(i)))
        segments.append(Segment(color: .green, angle: CGFloat(j)))
        segments.append(Segment(color: .yellow, angle: CGFloat(k)))
        
        //グラフが360度を超える場合切り捨て　360度以下の場合グレーゾーンを表示
        if (k <= 360) {
            segments.append(Segment(color: .gray, angle: 360.0))
        } else {
            k = 360
        }
        
        self.dayViewController.segments = segments
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
