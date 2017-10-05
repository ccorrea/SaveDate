//
//  DayName.swift
//  SaveDate
//
//  Created by Christian Correa on 10/4/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

struct DayName: CalendarItem {
    let isInMonth: Bool
    let isInWeekend: Bool
    let name: String
    
    init(name: String, isInWeekend: Bool) {
        self.isInMonth = true
        self.isInWeekend = isInWeekend
        self.name = name
    }
}
