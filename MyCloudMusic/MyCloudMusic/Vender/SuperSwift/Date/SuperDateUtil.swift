//
//  SuperDateUtil.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/4.
//

import Foundation

/// 获取当前年
class SuperDateUtil {
    static func currentYear() -> Int {
        // 获取当前日期
        let date = Date()
        let calender = Calendar.current
        let d = calender.dateComponents([Calendar.Component.year, Calendar.Component.month], from: date)
        return d.year!
    }
}
