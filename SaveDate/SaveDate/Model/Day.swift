//
//  Day.swift
//  SaveDate
//
//  Created by Christian Correa on 10/4/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

struct Day: CalendarItem {
    private var calendar: Calendar
    private var date: Date
    private var dateComponents: DateComponents
    
    var isInWeekend: Bool {
        return calendar.isDateInWeekend(date)
    }
    
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
    
    init(date: Date) {
        self.init(date: date, anchor: date)
    }
    
    init(date: Date, anchor: Date) {
        let components: Set<Calendar.Component>
            
        components = [.day, .month]
        self.calendar = Calendar.current
        self.date = date
        self.dateComponents = calendar.dateComponents(components, from: date)
    }
}
