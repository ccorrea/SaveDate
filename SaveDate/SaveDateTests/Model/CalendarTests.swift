//
//  CalendarTests.swift
//  SaveDateTests
//
//  Created by Christian Correa on 10/6/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import XCTest
@testable import SaveDate

class CalendarTests: XCTestCase {
    
    var calendar: SaveDate.Calendar!
    var dateFormatter: DateFormatter!
    
    override func setUp() {
        let date: Date!
        
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        date = dateFormatter.date(from: "10/15/2017")
        calendar = SaveDate.Calendar(date: date)
    }
    
    func testMonthName() {
        XCTAssertEqual("October", calendar.monthName)
    }
    
    func testDaysInJanuary() {
        let januaryDate = dateFormatter.date(from: "01/15/2017")!
        let january = SaveDate.Calendar(date: januaryDate)
        let days = january.days
        
        XCTAssertEqual(31, days.count)
        
        let first = days.first!
        let last = days.last!
        
        XCTAssertEqual("1", first.name)
        XCTAssertEqual("31", last.name)
    }
    
    func testDaysInFebruaryOfNonLeapYear() {
        let februaryDate = dateFormatter.date(from: "02/15/2017")!
        let february = SaveDate.Calendar(date: februaryDate)
        let days = february.days
        
        XCTAssertEqual(28, days.count)
        
        let first = days.first!
        let last = days.last!
        
        XCTAssertEqual("1", first.name)
        XCTAssertEqual("28", last.name)
    }
    
    func testDaysInFebruaryOfLeapYear() {
        let februaryDate = dateFormatter.date(from: "02/15/2020")!
        let february = SaveDate.Calendar(date: februaryDate)
        let days = february.days
        
        XCTAssertEqual(29, days.count)
        
        let first = days.first!
        let last = days.last!
        
        XCTAssertEqual("1", first.name)
        XCTAssertEqual("29", last.name)
    }
    
    func testWeekdays() {
        let weekdays = calendar.weekdays
        
        XCTAssertNotNil(weekdays)
        XCTAssertEqual(7, weekdays.count)
        
        let sun = weekdays[0]
        let mon = weekdays[1]
        let tue = weekdays[2]
        let wed = weekdays[3]
        let thu = weekdays[4]
        let fri = weekdays[5]
        let sat = weekdays[6]
        
        XCTAssertEqual("Sun", sun.name)
        XCTAssertEqual("Mon", mon.name)
        XCTAssertEqual("Tue", tue.name)
        XCTAssertEqual("Wed", wed.name)
        XCTAssertEqual("Thu", thu.name)
        XCTAssertEqual("Fri", fri.name)
        XCTAssertEqual("Sat", sat.name)
    }

}
