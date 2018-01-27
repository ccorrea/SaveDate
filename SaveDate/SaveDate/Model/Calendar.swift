//
//  Calendar.swift
//  SaveDate
//
//  Created by Christian Correa on 10/5/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

struct Calendar {
    static let numberOfCells = 49
    
    let calendar: Foundation.Calendar
    let date: Date
    let headers: [Header]
    let monthName: String
    
    init(date: Date) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
        
        dateFormatter.locale = Locale.current
        self.calendar = Foundation.Calendar.current
        self.date = date
        self.headers = dateFormatter.veryShortWeekdaySymbols!.map { Header(name: $0) }
        self.monthName = dateFormatter.string(from: date)
    }
    
    private (set) lazy var cells: [Cell] = createCells()

    private func createCells() -> [Cell] {
        var cells = Array<Cell>()
        let range = calendar.range(of: .day, in: .month, for: date)!
        let firstDateComponents = DateComponents(year: date.year, month: date.month, day: 1)
        let firstDate = calendar.date(from: firstDateComponents)!
        var delta = firstDate.weekday - 1
        
        for header in headers {
            cells.append(header)
        }
        
        while delta > 0 {
            let operand = delta * -1
            let currentDate = calendar.date(byAdding: .day, value: operand, to: firstDate)!
            let currentDay = Day(date: currentDate, inMonth: false)
            
            cells.append(currentDay)
            
            delta -= 1
        }
        
        for index in 1 ... range.count {
            let currentDateComponents = DateComponents(year: date.year, month: date.month, day: index)
            let currentDate = calendar.date(from: currentDateComponents)!
            let currentDay = Day(date: currentDate)
            
            cells.append(currentDay)
        }
        
        while cells.count < Calendar.numberOfCells {
            if let lastCell = cells.last {
                if let lastDay = lastCell as? Day {
                    let lastDate = lastDay.date
                    let nextDate = calendar.date(byAdding: .day, value: 1, to: lastDate)!
                    let nextDay = Day(date: nextDate, inMonth: false)
                    
                    cells.append(nextDay)
                }
            }
        }
        
        return cells
    }
}
