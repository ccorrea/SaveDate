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
    
    func testCellsForFebruaryOfNonLeapYear() {
        var february = createCalendar(forDate: "02/15/2017")
        let days = filterDays(fromCells: february.cells)
        
        XCTAssertEqual(28, days.count)
        
        let first = days.first!
        let last = days.last!
        
        XCTAssertEqual("1", first.name)
        XCTAssertEqual("28", last.name)
    }
    
    func testCellsForFebruaryOfLeapYear() {
        var february = createCalendar(forDate: "02/15/2020")
        let days = filterDays(fromCells: february.cells)
        
        XCTAssertEqual(29, days.count)
        
        let first = days.first!
        let last = days.last!
        
        XCTAssertEqual("1", first.name)
        XCTAssertEqual("29", last.name)
    }
    
    func testCellsForMonthWithLeadingSpaces() {
        var march = createCalendar(forDate: "03/15/2017")
        let cells = march.cells
        
        XCTAssertEqual(cells[0].name, "")
        XCTAssertEqual(cells[0].type, CellType.space)
        
        XCTAssertEqual(cells[1].name, "")
        XCTAssertEqual(cells[1].type, CellType.space)
        
        XCTAssertEqual(cells[2].name, "")
        XCTAssertEqual(cells[2].type, CellType.space)
        
        XCTAssertEqual(cells[3].name, "1")
        XCTAssertEqual(cells[3].type, CellType.weekday)
    }
    
    func testCellsForMonthWithoutLeadingSpaces() {
        var january = createCalendar(forDate: "01/15/2017")
        let cells = january.cells
        let first = cells.first!
        
        XCTAssertEqual(first.name, "1")
        XCTAssertEqual(first.type, CellType.weekend)
    }
    
    func testCellsIncludesTrailingSpacesInFiveWeekMonth() {
        var june = createCalendar(forDate: "06/15/2017")
        let cells = june.cells
        
        if cells.count < 42 {
            XCTFail("Not enough cells were returned")
            return
        }
        
        XCTAssertEqual(cells[33].type, CellType.weekday)
        XCTAssertEqual(cells[34].type, CellType.space)
        XCTAssertEqual(cells[35].type, CellType.space)
        XCTAssertEqual(cells[36].type, CellType.space)
        XCTAssertEqual(cells[37].type, CellType.space)
        XCTAssertEqual(cells[38].type, CellType.space)
        XCTAssertEqual(cells[39].type, CellType.space)
        XCTAssertEqual(cells[40].type, CellType.space)
        XCTAssertEqual(cells[41].type, CellType.space)
    }
    
    func testCellsIncludesTrailingSpacesInSixWeekMonth() {
        var july = createCalendar(forDate: "07/15/2017")
        let cells = july.cells
        
        if cells.count < 42 {
            XCTFail("Not enough cells were returned")
            return
        }
        
        XCTAssertEqual(cells[36].type, CellType.weekday)
        XCTAssertEqual(cells[37].type, CellType.space)
        XCTAssertEqual(cells[38].type, CellType.space)
        XCTAssertEqual(cells[39].type, CellType.space)
        XCTAssertEqual(cells[40].type, CellType.space)
        XCTAssertEqual(cells[41].type, CellType.space)
    }
    
    func testCellsReturnsCorrectNumberOfCellsForEveryMonth() {
        for index in 1 ... 12 {
            var dateComponents = DateComponents()
            
            dateComponents.year = 2017
            dateComponents.month = index
            dateComponents.day = 15
            
            let date = Calendar.current.date(from: dateComponents)!
            var calendar = SaveDate.Calendar(date: date)
            
            XCTAssertEqual(42, calendar.cells.count)
        }
    }
    
    func testHeaders() {
        let calendar = createCalendar(forDate: "01/15/2017")
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

    func testMonthName() {
        let calendar = createCalendar(forDate: "10/15/2017")
        
        XCTAssertEqual("October", calendar.monthName)
    }
    
    private func createCalendar(forDate dateString: String) -> SaveDate.Calendar {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let date = dateFormatter.date(from: dateString)!
        let calendar = SaveDate.Calendar(date: date)
        
        return calendar
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
