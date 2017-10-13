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
    private var date: Date
    
    var month: Int {
        return date.month
    }
    
    var name: String {
        return date.day.description
    }
    
    var type: CellType {
        let inWeekend = calendar.isDateInWeekend(date)
        
        return inWeekend ? .weekend : .weekday
    }
    
    init(date: Date) {
        self.calendar = Foundation.Calendar.current
        self.date = date
    }
}
