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
        let cells = february.cells
        
        XCTAssertEqual(42, cells.count)

        if cells.count < 42 {
            XCTFail("Not enough cells were returned")
            return
        }
        
        // Fifth week
        XCTAssertEqual(cells[30].name, "28")
        XCTAssertEqual(cells[31].name, "1")
        
        XCTAssertEqual(cells[30].type, .weekday)
        XCTAssertEqual(cells[31].type, .outsideMonth)
    }
    
    func testCellsForFebruaryOfLeapYear() {
        var february = createCalendar(forDate: "02/15/2020")
        let cells = february.cells
        
        XCTAssertEqual(42, cells.count)
        
        if cells.count < 42 {
            XCTFail("Not enough cells were returned")
            return
        }
        
        // Fifth week
        XCTAssertEqual(cells[34].name, "29")
        XCTAssertEqual(cells[34].type, .weekend)
        
        // Sixth week
        XCTAssertEqual(cells[35].name, "1")
        XCTAssertEqual(cells[35].type, .outsideMonth)
    }
    
    func testCellsForMonthWithLeadingSpaces() {
        var march = createCalendar(forDate: "03/15/2017")
        let cells = march.cells
        
        // First week
        XCTAssertEqual(cells[0].name, "26")
        XCTAssertEqual(cells[1].name, "27")
        XCTAssertEqual(cells[2].name, "28")
        XCTAssertEqual(cells[3].name, "1")
        
        XCTAssertEqual(cells[0].type, .outsideMonth)
        XCTAssertEqual(cells[1].type, .outsideMonth)
        XCTAssertEqual(cells[2].type, .outsideMonth)
        XCTAssertEqual(cells[3].type, .weekday)
    }
    
    func testCellsForMonthWithoutLeadingSpaces() {
        var january = createCalendar(forDate: "01/15/2017")
        let cells = january.cells
        
        // First week
        XCTAssertEqual(cells[0].name, "1")
        XCTAssertEqual(cells[0].type, .weekend)
    }
    
    func testCellsIncludesDaysOutsideMonthInFiveWeekMonth() {
        var june = createCalendar(forDate: "06/15/2017")
        let cells = june.cells
        
        if cells.count < 42 {
            XCTFail("Not enough cells were returned")
            return
        }
        
        // Fifth week
        XCTAssertEqual(cells[33].name, "30")
        XCTAssertEqual(cells[34].name, "1")
        
        XCTAssertEqual(cells[33].type, .weekday)
        XCTAssertEqual(cells[34].type, .outsideMonth)
        
        for index in 35 ... 41 {
            XCTAssertEqual(cells[index].type, .outsideMonth)
        }
    }
    
    func testCellsIncludesDaysOutsideMonthInSixWeekMonth() {
        var july = createCalendar(forDate: "07/15/2017")
        let cells = july.cells
        
        if cells.count < 42 {
            XCTFail("Not enough cells were returned")
            return
        }
        
        // Sixth week
        XCTAssertEqual(cells[36].name, "31")
        XCTAssertEqual(cells[37].name, "1")
        
        XCTAssertEqual(cells[36].type, .weekday)
        XCTAssertEqual(cells[37].type, .outsideMonth)
        
        for index in 38 ... 41 {
            XCTAssertEqual(cells[index].type, .outsideMonth)
        }
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
}
