//
//  DayCellTests.swift
//  SaveDateTests
//
//  Created by Christian Correa on 10/4/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import XCTest
@testable import SaveDate

class DayCellTests: XCTestCase {
    
    var dateFormatter: DateFormatter!
    
    override func setUp() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }
    
    func testDate() {
        let date = dateFormatter.date(from: "10/01/2017")
        let day = DayCell(date: date!)
        
        XCTAssertEqual(date, day.date)
    }
    
    func testInitializer() {
        let date = createDate(from: "02/01/2017")
        let dayInMonth = DayCell(date: date)
        let dayOutsideMonth = DayCell(date: date, inMonth: false)
        
        XCTAssertEqual(.weekday, dayInMonth.type)
        XCTAssertEqual(.dimmed, dayOutsideMonth.type)
    }
    
    func testType() {
        let mon = DayCell(date: createDate(from: "10/02/2017"))
        let tue = DayCell(date: createDate(from: "10/03/2017"))
        let wed = DayCell(date: createDate(from: "10/04/2017"))
        let thu = DayCell(date: createDate(from: "10/05/2017"))
        let fri = DayCell(date: createDate(from: "10/06/2017"))
        let sat = DayCell(date: createDate(from: "10/07/2017"))
        let sun = DayCell(date: createDate(from: "10/08/2017"))
        
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
        let day = DayCell(date: date)
        
        XCTAssertEqual("30", day.name)
    }
    
    private func createDate(from dateString: String) -> Date {
        let date = dateFormatter.date(from: dateString)
        
        return date!
    }
}
