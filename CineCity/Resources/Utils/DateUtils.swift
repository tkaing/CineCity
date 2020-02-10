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
    
    static func toDate(date: String) -> Date? {
        return DateUtils.formatter.date(from: date)
    }
    
    static func toString(date: Date) -> String {
        return DateUtils.formatter.string(from: date)
    }
}
