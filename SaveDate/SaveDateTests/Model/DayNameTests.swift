//
//  DayNameTests.swift
//  SaveDateTests
//
//  Created by Christian Correa on 10/4/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import XCTest
@testable import SaveDate

class DayNameTests: XCTestCase {
    
    func testInitializerSetsIsInMonthToTrue() {
        let day = DayName(name: "Monday", isInWeekend: false)
        
        XCTAssertTrue(day.isInMonth)
    }
    
}
