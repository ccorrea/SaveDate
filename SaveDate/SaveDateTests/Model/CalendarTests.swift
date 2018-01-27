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
    
    func testCellsBeginsWithWeekdaySymbols() {
        var calendar = createCalendar(forDate: "01/15/2017")
        let cells = calendar.cells
        let sun = cells[0]
        let mon = cells[1]
        let tue = cells[2]
        let wed = cells[3]
        let thu = cells[4]
        let fri = cells[5]
        let sat = cells[6]
        
        XCTAssertEqual("S", sun.name)
        XCTAssertEqual("M", mon.name)
        XCTAssertEqual("T", tue.name)
        XCTAssertEqual("W", wed.name)
        XCTAssertEqual("T", thu.name)
        XCTAssertEqual("F", fri.name)
        XCTAssertEqual("S", sat.name)
    }
    
    func testCellsForFebruaryOfNonLeapYear() {
        var february = createCalendar(forDate: "02/15/2017")
        let cells = february.cells
        
        XCTAssertEqual(49, cells.count)

        if cells.count < 49 {
            XCTFail("Not enough cells were returned")
            return
        }
        
        // Fifth week
        XCTAssertEqual(cells[37].name, "28")
        XCTAssertEqual(cells[38].name, "1")
        
        XCTAssertEqual(cells[37].type, .weekday)
        XCTAssertEqual(cells[38].type, .dimmed)
    }
    
    func testCellsForFebruaryOfLeapYear() {
        var february = createCalendar(forDate: "02/15/2020")
        let cells = february.cells
        
        XCTAssertEqual(49, cells.count)
        
        if cells.count < 49 {
            XCTFail("Not enough cells were returned")
            return
        }
        
        // Fifth week
        XCTAssertEqual(cells[41].name, "29")
        XCTAssertEqual(cells[41].type, .weekend)
        
        // Sixth week
        XCTAssertEqual(cells[42].name, "1")
        XCTAssertEqual(cells[42].type, .dimmed)
    }
    
    func testCellsForMonthWithLeadingSpaces() {
        var march = createCalendar(forDate: "03/15/2017")
        let cells = march.cells
        
        // First week
        XCTAssertEqual(cells[7].name, "26")
        XCTAssertEqual(cells[8].name, "27")
        XCTAssertEqual(cells[9].name, "28")
        XCTAssertEqual(cells[10].name, "1")
        
        XCTAssertEqual(cells[7].type, .dimmed)
        XCTAssertEqual(cells[8].type, .dimmed)
        XCTAssertEqual(cells[9].type, .dimmed)
        XCTAssertEqual(cells[10].type, .weekday)
    }
    
    func testCellsForMonthWithoutLeadingSpaces() {
        var january = createCalendar(forDate: "01/15/2017")
        let cells = january.cells
        
        // First week
        XCTAssertEqual(cells[7].name, "1")
        XCTAssertEqual(cells[7].type, .weekend)
    }
    
    func testCellsIncludesDaysOutsideMonthInFiveWeekMonth() {
        var june = createCalendar(forDate: "06/15/2017")
        let cells = june.cells
        
        if cells.count < 49 {
            XCTFail("Not enough cells were returned")
            return
        }
        
        // Fifth week
        XCTAssertEqual(cells[40].name, "30")
        XCTAssertEqual(cells[41].name, "1")
        
        XCTAssertEqual(cells[40].type, .weekday)
        XCTAssertEqual(cells[41].type, .dimmed)
        
        for index in 42 ... 48 {
            XCTAssertEqual(cells[index].type, .dimmed)
        }
    }
    
    func testCellsIncludesDaysOutsideMonthInSixWeekMonth() {
        var july = createCalendar(forDate: "07/15/2017")
        let cells = july.cells
        
        if cells.count < 49 {
            XCTFail("Not enough cells were returned")
            return
        }
        
        // Sixth week
        XCTAssertEqual(cells[43].name, "31")
        XCTAssertEqual(cells[44].name, "1")
        
        XCTAssertEqual(cells[43].type, .weekday)
        XCTAssertEqual(cells[44].type, .dimmed)
        
        for index in 45 ... 48 {
            XCTAssertEqual(cells[index].type, .dimmed)
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
            
            XCTAssertEqual(49, calendar.cells.count)
        }
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
