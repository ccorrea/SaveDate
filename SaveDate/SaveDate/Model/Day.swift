//
//  Day.swift
//  SaveDate
//
//  Created by Christian Correa on 10/4/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

struct Day: Cell {
    private var calendar: Foundation.Calendar
    private (set) var date: Date
    private (set) var type: CellType
    
    var name: String {
        return date.day.description
    }
    
    init(date: Date, inMonth: Bool = true) {
        self.calendar = Foundation.Calendar.current
        self.date = date
        
        if inMonth {
            self.type = calendar.isDateInWeekend(date) ? .weekend : .weekday
        }
        else {
            self.type = .outsideMonth
        }
    }
}
