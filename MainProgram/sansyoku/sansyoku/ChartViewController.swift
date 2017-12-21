//
//  ChartViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/13.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

var test:[[String]] = []
class ChartViewController: UIViewController{
    
   // @IBOutlet weak var dayViewController: UIViewController!
    @IBOutlet weak var dayViewController: DayViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        hoge()
        
        var l:Double = Double(test[0][0])!
        var m:Double = Double(test[0][1])!
        var n:Double = Double(test[0][2])!
        
        print(l)
        print(m)
        print(n)
        l = l * 20
        m = m * 40 + l
        n = n * 17.15 + m
        print(l)
        print(m)
        print(n)
        
        var segments = [Segment]()
        segments.append(Segment(color: .red, angle: CGFloat(l)))
        segments.append(Segment(color: .green, angle: CGFloat(m)))
        segments.append(Segment(color: .yellow, angle: CGFloat(n)))
//        segments.append(Segment(color: .magenta, angle: 320.0))
//        segments.append(Segment(color: .blue, angle: 345.0))
        if (n <= 360) {
            segments.append(Segment(color: .gray, angle: 360.0))
        } else {
            n = 360
        }

        
        self.dayViewController.segments = segments
    }
    
    func hoge() {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
      //  var test:[[String]] = []
        var rowArray = appDelegate.csvData
        rowArray.forEach{
            let items = $0.components(separatedBy: ",")
            test.append(items)
        }
        print(test)
        print("count=" ,rowArray.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
