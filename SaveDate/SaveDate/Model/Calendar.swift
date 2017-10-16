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
    let headers: [Header]
    let monthName: String
    
    init(date: Date) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
        
        dateFormatter.locale = Locale.current
        self.calendar = Foundation.Calendar.current
        self.date = date
        self.headers = dateFormatter.shortWeekdaySymbols!.map { Header(name: $0) }
        self.monthName = dateFormatter.string(from: date)
    }
    
    private (set) lazy var cells: [Cell] = createCells()

    private func createCells() -> [Cell] {
        var cells = Array<Cell>()
        let range = calendar.range(of: .day, in: .month, for: date)!
        let firstDateComponents = DateComponents(year: date.year, month: date.month, day: 1)
        let firstDate = calendar.date(from: firstDateComponents)!
        var delta = firstDate.weekday - 1
        
        while delta > 0 {
            let operand = delta * -1
            let currentDate = calendar.date(byAdding: .day, value: operand, to: firstDate)!
            let currentDay = Day(date: currentDate)
            
            cells.append(currentDay)
            
            delta -= 1
        }
        
        for index in 1 ... range.count {
            let currentDateComponents = DateComponents(year: date.year, month: date.month, day: index)
            let currentDate = calendar.date(from: currentDateComponents)!
            let currentDay = Day(date: currentDate)
            
            cells.append(currentDay)
        }
        
        let cellsCreated = cells.count
        let nextIndex = cellsCreated + 1
        
        for _ in nextIndex ... Calendar.numberOfCells {
            let space = Space()
            
            cells.append(space)
        }
        
        return cells
    }
}
