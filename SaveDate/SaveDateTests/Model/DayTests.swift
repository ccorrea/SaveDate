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
    
    func testType() {
        let mon = createDay(from: "10/02/2017")
        let tue = createDay(from: "10/03/2017")
        let wed = createDay(from: "10/04/2017")
        let thu = createDay(from: "10/05/2017")
        let fri = createDay(from: "10/06/2017")
        let sat = createDay(from: "10/07/2017")
        let sun = createDay(from: "10/08/2017")
        
        XCTAssertEqual(CellType.weekday, mon.type)
        XCTAssertEqual(CellType.weekday, tue.type)
        XCTAssertEqual(CellType.weekday, wed.type)
        XCTAssertEqual(CellType.weekday, thu.type)
        XCTAssertEqual(CellType.weekday, fri.type)
        XCTAssertEqual(CellType.weekend, sat.type)
        XCTAssertEqual(CellType.weekend, sun.type)
    }
        
    func testMonth() {
        let day = createDay(from: "10/01/2017")
        
        XCTAssertEqual(10, day.month)
    }
    
    func testName() {
        let day = createDay(from: "10/30/2017")
        
        XCTAssertEqual("30", day.name)
    }
    
    func createDay(from dateString: String) -> Day {
        let date = dateFormatter.date(from: dateString)
        let day = Day(date: date!)
        
        return day
    }
}
