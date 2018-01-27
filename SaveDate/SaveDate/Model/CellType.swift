//
//  CellType.swift
//  SaveDate
//
//  Created by Christian Correa on 10/10/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

enum CellType: String {
    case header = "Header"
    case outsideMonth = "OutsideMonth"
    case space = "Space"
    case weekday = "Weekday"
    case weekend = "Weekend"
    
    static let cases = [header, outsideMonth, space, weekday, weekend]
}
