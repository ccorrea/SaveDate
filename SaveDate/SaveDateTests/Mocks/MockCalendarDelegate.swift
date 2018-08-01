//
//  MockCalendarDelegate.swift
//  SaveDateTests
//
//  Created by Christian Correa on 7/29/18.
//  Copyright © 2018 Twelfth Station Software. All rights reserved.
//

import Foundation
import SaveDate

class MockCalendarDelegate: CalendarDelegate {
    public var dataWasSelected:  Bool
    public var selectionWasCanceled: Bool
    
    init() {
        dataWasSelected =  false
        selectionWasCanceled = false
    }
    
    func didCancelSelectionFromCalendar() {
        selectionWasCanceled = true
    }
    
    func didSelectDateFromCalendar(date: Date) {
        dataWasSelected = true
    }
    
    
}
