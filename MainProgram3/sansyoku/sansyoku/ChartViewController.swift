//
//  ChartViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/13.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

var mainArray:[[String]] = []
class ChartViewController: UIViewController{
    
    // @IBOutlet weak var dayViewController: UIViewController!
    @IBOutlet weak var dayViewController: DayViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        hoge()
        
        var i:Double = 0
        var j:Double = 0
        var k:Double = 0
        
        var todays = String(appDelegate.toDays)
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
        
        i = i * 20
        j = j * 40 + i
        k = k * 17.15 + j
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
        
        self.dayViewController.segments = segments
    }
    
    func hoge() {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //  var test:[[String]] = []
        var rowArray = appDelegate.csvdata
        rowArray.forEach{
            let items = $0.components(separatedBy: ",")
            mainArray.append(items)
        }
        print(mainArray)
        print("count=" ,rowArray.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
