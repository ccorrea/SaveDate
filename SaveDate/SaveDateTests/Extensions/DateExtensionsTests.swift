//
//  DateExtensionsTests.swift
//  SaveDateTests
//
//  Created by Christian Correa on 10/11/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import XCTest
@testable import SaveDate

class DateExtensionsTests: XCTestCase {
    
    var date: Date!
    
    override func setUp() {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM/dd/yyyy"
        date = formatter.date(from: "10/30/2017")
    }
    
    func testDay() {
        XCTAssertEqual(30, date.day)
    }
    
    func testMonth() {
        XCTAssertEqual(10, date.month)
    }
    
    func testWeekday() {
        XCTAssertEqual(2, date.weekday)
    }
    
    func testYear() {
        XCTAssertEqual(2017, date.year)
    }
    
}
