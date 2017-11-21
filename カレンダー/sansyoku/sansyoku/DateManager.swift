//
//  DateManager.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/11/16.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

var currentMonthOfDates = [NSDate]() //表記する月の配列
var selectedDate = NSDate()
let daysPerWeek: Int = 7
var numberOfItems: Int!

//月ごとのセルの数を返すメソッド
func daysAcquisition() -> Int {
    let rangeOfWeeks = NSCalendar.currentCalendar().rangeOfUnit(NSCalendarUnit.WeekOfMonth, inUnit: NSCalendarUnit.Month, forDate: firstDateOfMonth())
    let numberOfWeeks = rangeOfWeeks.length //月が持つ週の数
    numberOfItems = numberOfWeeks * daysPerWeek //週の数×列の数
    return numberOfItems
}
//月の初日を取得
func firstDateOfMonth() -> NSDate {
    let components = NSCalendar.currentCalendar().components([.Year, .Month, .Day],
                                                             fromDate: selectedDate)
    components.day = 1
    let firstDateMonth = NSCalendar.currentCalendar().dateFromComponents(components)!
    return firstDateMonth
}

// ⑴表記する日にちの取得
func dateForCellAtIndexPath(numberOfItems: Int) {
    // ①「月の初日が週の何日目か」を計算する
    let ordinalityOfFirstDay = NSCalendar.currentCalendar().ordinalityOfUnit(NSCalendarUnit.Day, inUnit: NSCalendarUnit.WeekOfMonth, forDate: firstDateOfMonth())
    for (var i = 0; i < numberOfItems; i++) {
        // ②「月の初日」と「indexPath.item番目のセルに表示する日」の差を計算する
        let dateComponents = NSDateComponents()
        dateComponents.day = i - (ordinalityOfFirstDay - 1)
        // ③ 表示する月の初日から②で計算した差を引いた日付を取得
        let date = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: firstDateOfMonth(), options: NSCalendar.Options(rawValue: 0))!
        // ④配列に追加
        currentMonthOfDates.append(date)
    }
}

// ⑵表記の変更
func conversionDateFormat(indexPath: NSIndexPath) -> String {
    dateForCellAtIndexPath(numberOfItems)
    let formatter: NSDateFormatter = NSDateFormatter()
    formatter.dateFormat = "d"
    return formatter.stringFromDate(currentMonthOfDates[indexPath.row])
}


