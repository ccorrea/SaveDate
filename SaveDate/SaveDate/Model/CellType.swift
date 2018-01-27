//
//  CellType.swift
//  SaveDate
//
//  Created by Christian Correa on 10/10/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

enum CellType: String {
    case dayOutsideBoundaries = "DayOutsideBoundaries"
    case symbol = "Symbol"
    case weekday = "Weekday"
    case weekendDay = "WeekendDay"
    
    static let cases = [dayOutsideBoundaries, symbol, weekday, weekendDay]
}
