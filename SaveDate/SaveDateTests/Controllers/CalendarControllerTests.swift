//
//  CalendarControllerTests.swift
//  SaveDateTests
//
//  Created by Christian Correa on 1/18/18.
//  Copyright © 2018 Twelfth Station Software. All rights reserved.
//

import XCTest
import SaveDate
import UIKit

class CalendarControllerTests: XCTestCase {
    
    var controller: CalendarController!
    var date: Date!
    var delegate: MockCalendarDelegate!
    
    override func setUp() {
        super.setUp()
        
        let date = createDate(from: "07/01/2018")!
        let bundle = Bundle(for: CalendarController.self)
        let storyboard = UIStoryboard(name: "SaveDate", bundle: bundle)
        
        controller = storyboard.instantiateInitialViewController() as! CalendarController
        controller.date = date
        controller.delegate = MockCalendarDelegate()
        UIApplication.shared.keyWindow?.rootViewController = controller
        
        controller.preloadView()
    }
    
    func testCollectionViewSupplementaryElements() {
        // TODO: Figure out how to write test for supplementary views.
    }
}
