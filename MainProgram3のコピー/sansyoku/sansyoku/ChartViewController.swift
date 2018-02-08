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
    @IBOutlet weak var setTitle: UILabel!
    @IBOutlet weak var goukei: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let datasave = DataSave()
        datasave.arrayCreate()
        datasave.getDay()
        
        datasave.mainArray.append(appDelegate.csvdata)
        
        var selectDays = ""
        if (appDelegate.selectDay < 10) {
            selectDays = "0" + String(appDelegate.selectDay)
        } else {
            selectDays = String(appDelegate.selectDay)
        }

        
        print(selectDays)

        var i:Double = 0
        var j:Double = 0
        var k:Double = 0
        
        setTitle.text = "\(selectDays)日の摂取記録"

        for day in 0..<appDelegate.countArray where datasave.mainArray[day][3].hasSuffix(selectDays){
                if (datasave.mainArray[day][3].isEmpty == false) {
                    i = Double(datasave.mainArray[day][0])!
                    j = Double(datasave.mainArray[day][1])!
                    k = Double(datasave.mainArray[day][2])!
                    break
                } else {
                    print("中身なし")
                }
        }
        
        if (i > 6) {
            i = 6
        }
        if (j > 3) {
            j = 3
        }
        if (k > 11) {
            k = 11 
        }
        var si:String = String(Int(i))
        var sj:String = String(Int(j))
        var sk:String = String(Int(k))
        var res = Int(i + j + k)
        let sl:String = String((appDelegate.tensu - res))

        i = i * 18
        j = j * 18 + i
        k = k * 18 + j
        
        var segments = [Segment]()
        segments.append(Segment(color: .red, angle: CGFloat(i)))
        segments.append(Segment(color: .green, angle: CGFloat(j)))
        segments.append(Segment(color: .yellow, angle: CGFloat(k)))
        
        if (k <= 360) {
            segments.append(Segment(color: .gray, angle: 360.0))
        } else {
            k = 360
        }
        
        ti.text = "赤の栄養素 \(si) / 6 点"
        tj.text = "緑の栄養素 \(sj) / 3 点"
        if (appDelegate.tensu == 25) {
            tk.text = "黄の栄養素 \(sk) / 16 点"
        } else {
            tk.text = "黄の栄養素 \(sk) / 11 点"
        }
        tl.text = "あと\(sl)点足りません＞＜。"
        goukei.text = "合計\(appDelegate.tensu)点"
        
        self.dayViewController.segments = segments
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
