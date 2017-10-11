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
    let dateFormatter: DateFormatter
    
    init(date: Date) {
        self.calendar = Foundation.Calendar.current
        self.date = date
        self.dateFormatter = DateFormatter()
        self.dateFormatter.locale = Locale.current
    }
    
    var dayNames: [DayName] {
        var dayNames: Array<DayName>
        let weekdaySymbols = dateFormatter.shortWeekdaySymbols!
        let firstIndex = weekdaySymbols.startIndex
        let lastIndex = weekdaySymbols.endIndex - 1
        
        dayNames = weekdaySymbols.map {
            let index = weekdaySymbols.index(of: $0)!
            let isInWeekend = (index == firstIndex || index == lastIndex)
            
            return DayName(name: $0, isInWeekend: isInWeekend)
        }
        
        return dayNames
    }
    
    var days: [Day] {
        var days = Array<Day>()
        let range = calendar.range(of: .day, in: .month, for: date)!
        
        for index in 1...range.count {
            let dayDate = createDate(forDayOfMonth: index)
            let day = Day(date: dayDate)
            
            days.append(day)
        }
        
        return days
    }
    
    var monthName: String {
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
        
        return dateFormatter.string(from: date)
    }
    
    private func createDate(forDayOfMonth day: Int) -> Date {
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        
        return createDate(year: year, month: month, day: day)
    }
    
    private func createDate(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        let date = calendar.date(from: components)!

        return date
    }
}
