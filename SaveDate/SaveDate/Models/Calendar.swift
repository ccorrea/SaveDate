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
    let monthName: String
    
    private (set) lazy var cells: [Cell] = createCells()
    
    init(date: Date) {
        let dateFormatter = Calendar.createLocalizedDateFormatter()
        
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
        
        self.calendar = Foundation.Calendar.current
        self.date = date
        self.monthName = dateFormatter.string(from: date)
    }
    
    private func createCells() -> [Cell] {
        var cells = Array<Cell>()
        let dateFormatter = Calendar.createLocalizedDateFormatter()
        let range = calendar.range(of: .day, in: .month, for: date)!
        let firstDateComponents = DateComponents(year: date.year, month: date.month, day: 1)
        let firstDate = calendar.date(from: firstDateComponents)!
        let weekdaySymbols = dateFormatter.veryShortWeekdaySymbols!
        var delta = firstDate.weekday - 1
        
        for weekdaySymbol in weekdaySymbols {
            let symbolCell = SymbolCell(name: weekdaySymbol)
            
            cells.append(symbolCell)
        }
        
        while delta > 0 {
            let operand = delta * -1
            let currentDate = calendar.date(byAdding: .day, value: operand, to: firstDate)!
            let currentDay = DayCell(date: currentDate, inMonth: false)
            
            cells.append(currentDay)
            
            delta -= 1
        }
        
        for index in 1 ... range.count {
            let currentDateComponents = DateComponents(year: date.year, month: date.month, day: index)
            let currentDate = calendar.date(from: currentDateComponents)!
            let currentDay = DayCell(date: currentDate)
            
            cells.append(currentDay)
        }
        
        while cells.count < Calendar.numberOfCells {
            if let lastCell = cells.last {
                if let lastDayCell = lastCell as? DayCell {
                    let lastDate = lastDayCell.date
                    let nextDate = calendar.date(byAdding: .day, value: 1, to: lastDate)!
                    let nextDayCell = DayCell(date: nextDate, inMonth: false)
                    
                    cells.append(nextDayCell)
                }
            }
        }
        
        return cells
    }
    
    private static func createLocalizedDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale.current
        
        return dateFormatter
    }
}
