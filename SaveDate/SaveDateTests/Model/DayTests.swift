//
//  DayTests.swift
//  SaveDateTests
//
//  Created by Christian Correa on 10/4/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import XCTest
@testable import SaveDate

class DayTests: XCTestCase {
    
    var dateFormatter: DateFormatter!
    
    override func setUp() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }
    
    func testInitializerSetsIsInMonthToTrue() {
        let day = createDay(from: "10/30/2017")
        
        XCTAssertTrue(day.isInMonth)
    }
    
    func testIsInMonthReturnsTrueWhenDayIsInsideAnchor() {
        let date = dateFormatter.date(from: "10/30/2017")
        let anchorDate = dateFormatter.date(from: "10/01/2017")
        let day = Day(date: date!, anchor: anchorDate!)
        
        XCTAssertTrue(day.isInMonth)
    }
    
    func testIsInMonthReturnsFalseWhenDayIsOutsideAnchor() {
        let date = dateFormatter.date(from: "11/01/2017")
        let anchorDate = dateFormatter.date(from: "10/01/2017")
        let day = Day(date: date!, anchor: anchorDate!)
        
        XCTAssertFalse(day.isInMonth)
    }
    
    func testIsWeekendReturnsFalseWhenDayIsNotInWeekend() {
        let mon = createDay(from: "10/02/2017")
        let tue = createDay(from: "10/03/2017")
        let wed = createDay(from: "10/04/2017")
        let thu = createDay(from: "10/05/2017")
        let fri = createDay(from: "10/06/2017")
        
        XCTAssertFalse(mon.isInWeekend)
        XCTAssertFalse(tue.isInWeekend)
        XCTAssertFalse(wed.isInWeekend)
        XCTAssertFalse(thu.isInWeekend)
        XCTAssertFalse(fri.isInWeekend)
    }
    
    func testIsWeekendReturnsTrueWhenDayIsInWeekend() {
        let sat = createDay(from: "10/07/2017")
        let sun = createDay(from: "10/08/2017")
        
        XCTAssertTrue(sat.isInWeekend)
        XCTAssertTrue(sun.isInWeekend)
    }
    
    func testNameReturnsCorrectValue() {
        let day = createDay(from: "10/30/2017")
        
        XCTAssertEqual("30", day.name)
    }
    
    func createDay(from dateString: String) -> Day {
        let date = dateFormatter.date(from: dateString)
        let day = Day(date: date!)
        
        return day
    }
}
