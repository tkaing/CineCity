//
//  DateUtils.swift
//  CineCity
//
//  Created by Thierry Kg on 10/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

class DateUtils {
    
    static var formatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter
    }
    
    static func map(date: String) -> Date? {
        return DateUtils.formatter.date(from: date)
    }
    
    static func toString(date: Date) -> String {
        return DateUtils.formatter.string(from: date)
    }
    
    static func mapCustom(custom: String, date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = custom
        return dateFormatter.date(from: date)
    }
    
    static func toStringCustom(custom: String, date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = custom
        return dateFormatter.string(from: date)
    }
}
