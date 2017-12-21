//
//  ChartViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/13.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController{
    
   // @IBOutlet weak var dayViewController: UIViewController!
    @IBOutlet weak var dayViewController: DayViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var segments = [Segment]()
        segments.append(Segment(color: .red, angle: 100.0))
        segments.append(Segment(color: .cyan, angle: 190.0))
        segments.append(Segment(color: .green, angle: 280.0))
        segments.append(Segment(color: .magenta, angle: 320.0))
        segments.append(Segment(color: .blue, angle: 345.0))
        segments.append(Segment(color: .yellow, angle: 360.0))
        
        self.dayViewController.segments = segments
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
