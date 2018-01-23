//
//  ChartViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/13.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

//var mainArray:[[String]] = []
class ChartViewController: UIViewController{
    
    // @IBOutlet weak var dayViewController: UIViewController!
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
        
        var i:Double = 0
        var j:Double = 0
        var k:Double = 0
        
        var todays = String(appDelegate.toDay)
        var selectDays = String(appDelegate.selectDay)
        var result = 0
        for day in 0..<32{
            if (mainArray[day][3].hasSuffix(selectDays)) {
                result = day
                i = Double(mainArray[result][0])!
                j = Double(mainArray[result][1])!
                k = Double(mainArray[result][2])!
                break
            } else {
                print("中身なし")
                break
            }
        }
        
        i = i * 18
        j = j * 18 + i
        k = k * 18 + j
        /* デバッグ
         print(i)
         print(j)
         print(k)
         */
        
        
        
        var segments = [Segment]()
        segments.append(Segment(color: .red, angle: CGFloat(i)))
        segments.append(Segment(color: .green, angle: CGFloat(j)))
        segments.append(Segment(color: .yellow, angle: CGFloat(k)))
        
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
