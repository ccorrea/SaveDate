//
//  Calendar.swift
//  SaveDate
//
//  Created by Christian Correa on 10/5/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

struct Calendar {
    static let numberOfCells = 42
    
    let calendar: Foundation.Calendar
    let date: Date
    
    init(date: Date) {
        self.calendar = Foundation.Calendar.current
        self.date = date
    }
    
    var cells: [Cell] {
        var cells = Array<Cell>()
        let range = calendar.range(of: .day, in: .month, for: date)!
        let firstOfMonth = createDate(year: date.year, month: date.month, day: 1)
        
        for _ in 1 ..< firstOfMonth.weekday {
            let space = Space()
            
            cells.append(space)
        }
        
        for index in 1 ... range.count {
            let dayDate = createDate(year: date.year, month: date.month, day: index)
            let day = Day(date: dayDate)
            
            cells.append(day)
        }
        
        let cellsCreated = cells.count
        let nextIndex = cellsCreated + 1
        
        for _ in nextIndex ... Calendar.numberOfCells {
            let space = Space()
            
            cells.append(space)
        }
        
        return cells
    }
    
    var headers: [Header] {
        var headers: Array<Header>
        let formatter = createFormatter()
        let weekdaySymbols = formatter.shortWeekdaySymbols!
        
        headers = weekdaySymbols.map { Header(name: $0) }
        
        return headers
    }
    
    var monthName: String {
        let formatter = createFormatter();
        
        formatter.setLocalizedDateFormatFromTemplate("MMMM")
        
        return formatter.string(from: date)
    }
    
    private func createDate(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        let date = calendar.date(from: components)!

        return date
    }
    
    private func createFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale.current
        
        return dateFormatter
    }
}
