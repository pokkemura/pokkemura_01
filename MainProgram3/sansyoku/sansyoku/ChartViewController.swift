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
    @IBOutlet weak var ti: UILabel!
    @IBOutlet weak var tj: UILabel!
    
    @IBOutlet weak var tk: UILabel!
    @IBOutlet weak var tl: UILabel!
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
        
<<<<<<< HEAD
        i = i * 18
        j = j * 18 + i
        k = k * 18 + j
        /* デバッグ
         print(i)
         print(j)
         print(k)
         */
        
        
        
=======
        //グラフ設定用計算
        i = i * 20
        j = j * 40 + i
        k = k * 17.15 + j

        //グラフを設定
>>>>>>> 05b6c43885ca6def3d1b0cdeb975163d2ce4876d
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
        var si:String = String(i / 18)
        var sj:String = String((j - i) / 18)
        var sk:String = String((k - j) / 18)
        var sl:String = String((360 - k) / 18)
        ti.text = si
        tj.text = sj
        tk.text = sk
        tl.text = "あと"+sl+"点足りません＞＜。"
        
        self.dayViewController.segments = segments
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
