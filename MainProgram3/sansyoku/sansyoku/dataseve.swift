//
//  dataseve.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/12/12.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

//現在時刻を取得.
let myDate: Date = Date()

//カレンダーを取得.
let myCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!

//取得するコンポーネントを決める.
let myComponetns = myCalendar.components(
    [
        NSCalendar.Unit.year,
        NSCalendar.Unit.month,
        NSCalendar.Unit.day,
        NSCalendar.Unit.hour,
        NSCalendar.Unit.minute,
        NSCalendar.Unit.second,
        NSCalendar.Unit.weekday
    ],from: myDate)
