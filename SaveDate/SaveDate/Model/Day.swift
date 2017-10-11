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
    private var dateComponents: DateComponents
    
    var month: Int {
        guard let month = dateComponents.month else {
            return -1
        }
        
        return month
    }
    
    var name: String {
        guard let day = dateComponents.day else {
            return ""
        }
        
        return day.description
    }
    
    var type: CellType {
        let inWeekend = calendar.isDateInWeekend(date)
        
        return inWeekend ? .weekend : .weekday
    }
    
    init(date: Date) {
        let components: Set<Foundation.Calendar.Component>
        
        components = [.day, .month]
        self.calendar = Foundation.Calendar.current
        self.date = date
        self.dateComponents = calendar.dateComponents(components, from: date)
    }
}
