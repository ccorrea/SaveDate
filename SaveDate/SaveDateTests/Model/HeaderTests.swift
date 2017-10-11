//
//  HeaderTests.swift
//  SaveDateTests
//
//  Created by Christian Correa on 10/10/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import XCTest
@testable import SaveDate

class HeaderTests: XCTestCase {
    
    func testType() {
        let header = Header(name: "Sunday")
        
        XCTAssertEqual(CellType.header, header.type)
    }
    
}
