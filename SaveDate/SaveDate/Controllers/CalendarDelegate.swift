//
//  CalendarDelegate.swift
//  SaveDate
//
//  Created by Christian Correa on 1/30/18.
//  Copyright © 2018 Twelfth Station Software. All rights reserved.
//

import Foundation

public protocol CalendarDelegate {
    func didCancelSelectionFromCalendar()
    func didSelectDateFromCalendar(date: Date)
}
