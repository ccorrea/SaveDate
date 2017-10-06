//
//  CalendarItem.swift
//  SaveDate
//
//  Created by Christian Correa on 10/4/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

protocol CalendarItem {
    var isInWeekend: Bool { get }
    var name: String { get }
}
