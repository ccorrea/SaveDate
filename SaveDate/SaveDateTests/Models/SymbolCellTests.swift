//
//  SymbolCellTests.swift
//  SaveDateTests
//
//  Created by Christian Correa on 10/10/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import XCTest
@testable import SaveDate

class SymbolCellTests: XCTestCase {
    
    func testType() {
        let symbolCell = SymbolCell(name: "Sunday")
        
        XCTAssertEqual(CellType.symbol, symbolCell.type)
    }
    
}
