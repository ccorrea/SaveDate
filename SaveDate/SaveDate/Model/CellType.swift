//
//  CellType.swift
//  SaveDate
//
//  Created by Christian Correa on 10/10/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

enum CellType: String {
    case dimmed = "Dimmed"
    case selected = "Selected"
    case symbol = "Symbol"
    case today = "Today"
    case weekday = "Weekday"
    case weekend = "Weekend"
    
    static let cases = [dimmed, selected, symbol, today, weekday, weekend]
}
