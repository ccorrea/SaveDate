//
//  SpaceTests.swift
//  SaveDateTests
//
//  Created by Christian Correa on 10/10/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import XCTest
@testable import SaveDate

class SpaceTests: XCTestCase {
    
    func testType() {
        let space = Space()
        
        XCTAssertEqual(CellType.space, space.type)
    }
    
}
