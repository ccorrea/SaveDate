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
    
    func testCellsInFebruaryOfNonLeapYear() {
        let februaryDate = dateFormatter.date(from: "02/15/2017")!
        let february = SaveDate.Calendar(date: februaryDate)
        let days = filterDays(fromCells: february.cells)
        
        XCTAssertEqual(28, days.count)
        
        let first = days.first!
        let last = days.last!
        
        XCTAssertEqual("1", first.name)
        XCTAssertEqual("28", last.name)
    }
    
    func testCellsInFebruaryOfLeapYear() {
        let februaryDate = dateFormatter.date(from: "02/15/2020")!
        let february = SaveDate.Calendar(date: februaryDate)
        let days = filterDays(fromCells: february.cells)
        
        XCTAssertEqual(29, days.count)
        
        let first = days.first!
        let last = days.last!
        
        XCTAssertEqual("1", first.name)
        XCTAssertEqual("29", last.name)
    }
    
    func testCellsInMonthWithLeadingSpaces() {
        let marchDate = dateFormatter.date(from: "03/15/2017")!
        let march = SaveDate.Calendar(date: marchDate)
        let cells = march.cells
        
        XCTAssertEqual(34, cells.count)
        
        XCTAssertEqual(cells[0].type, CellType.space)
        XCTAssertEqual(cells[1].type, CellType.space)
        XCTAssertEqual(cells[2].type, CellType.space)
        XCTAssertEqual(cells[3].type, CellType.weekday)
    }
    
    func testCellsInMonthWithoutLeadingSpaces() {
        let januaryDate = dateFormatter.date(from: "01/15/2017")!
        let january = SaveDate.Calendar(date: januaryDate)
        let cells = january.cells
        
        XCTAssertEqual(31, cells.count)
        
        let first = cells.first!
        let last = cells.last!
        
        XCTAssertEqual("1", first.name)
        XCTAssertEqual("31", last.name)
    }
    
    func testHeaders() {
        let headers = calendar.headers
        
        XCTAssertNotNil(headers)
        XCTAssertEqual(7, headers.count)
        
        let sun = headers[0]
        let mon = headers[1]
        let tue = headers[2]
        let wed = headers[3]
        let thu = headers[4]
        let fri = headers[5]
        let sat = headers[6]
        
        XCTAssertEqual("Sun", sun.name)
        XCTAssertEqual("Mon", mon.name)
        XCTAssertEqual("Tue", tue.name)
        XCTAssertEqual("Wed", wed.name)
        XCTAssertEqual("Thu", thu.name)
        XCTAssertEqual("Fri", fri.name)
        XCTAssertEqual("Sat", sat.name)
    }

    private func filterDays(fromCells cells: [Cell]) -> [Cell] {
        return cells.filter {
            guard $0 is Day else {
                return false
            }
            
            return true
        }
    }
    
}
