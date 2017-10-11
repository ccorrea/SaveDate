//
//  WeekdayTests.swift
//  SaveDateTests
//
//  Created by Christian Correa on 10/10/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import XCTest
@testable import SaveDate

class WeekdayTests: XCTestCase {
    
    func testType() {
        let weekday = Weekday(name: "Sunday")
        
        XCTAssertEqual(CellType.header, weekday.type)
    }
    
}
