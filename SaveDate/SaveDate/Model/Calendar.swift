//
//  Calendar.swift
//  SaveDate
//
//  Created by Christian Correa on 10/5/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

struct Calendar {
    let calendar: Foundation.Calendar
    let date: Date
    let dateComponents: DateComponents
    let dateFormatter: DateFormatter
    
    init(date: Date) {
        self.calendar = Foundation.Calendar.current
        self.date = date
        self.dateComponents = self.calendar.dateComponents([.month, .year], from: date)
        self.dateFormatter = DateFormatter()
        self.dateFormatter.locale = Locale.current
    }
    
    var dayNames: [DayName] {
        var dayNames: Array<DayName>
        var weekdaySymbols = dateFormatter.shortWeekdaySymbols!
        let firstSymbol = weekdaySymbols.removeFirst()
        let lastSymbol = weekdaySymbols.removeLast()
        
        dayNames = weekdaySymbols.map { DayName(name: $0, isInWeekend: false) }
        
        dayNames.insert(DayName(name: firstSymbol, isInWeekend: true), at: 0)
        dayNames.append(DayName(name: lastSymbol, isInWeekend: true))
        
        return dayNames
    }
    
    var monthName: String {
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
        
        return dateFormatter.string(from: date)
    }
}
