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
    
    func testDate() {
        let date = dateFormatter.date(from: "10/01/2017")
        let day = Day(date: date!)
        
        XCTAssertEqual(date, day.date)
    }
    
    func testInitializer() {
        let date = createDate(from: "02/01/2017")
        let dayInMonth = Day(date: date)
        let dayOutsideMonth = Day(date: date, inMonth: false)
        
        XCTAssertEqual(.weekday, dayInMonth.type)
        XCTAssertEqual(.outsideMonth, dayOutsideMonth.type)
    }
    
    func testType() {
        let mon = Day(date: createDate(from: "10/02/2017"))
        let tue = Day(date: createDate(from: "10/03/2017"))
        let wed = Day(date: createDate(from: "10/04/2017"))
        let thu = Day(date: createDate(from: "10/05/2017"))
        let fri = Day(date: createDate(from: "10/06/2017"))
        let sat = Day(date: createDate(from: "10/07/2017"))
        let sun = Day(date: createDate(from: "10/08/2017"))
        
        XCTAssertEqual(CellType.weekday, mon.type)
        XCTAssertEqual(CellType.weekday, tue.type)
        XCTAssertEqual(CellType.weekday, wed.type)
        XCTAssertEqual(CellType.weekday, thu.type)
        XCTAssertEqual(CellType.weekday, fri.type)
        XCTAssertEqual(CellType.weekend, sat.type)
        XCTAssertEqual(CellType.weekend, sun.type)
    }
    
    func testName() {
        let date = createDate(from: "10/30/2017")
        let day = Day(date: date)
        
        XCTAssertEqual("30", day.name)
    }
    
    private func createDate(from dateString: String) -> Date {
        let date = dateFormatter.date(from: dateString)
        
        return date!
    }
}
