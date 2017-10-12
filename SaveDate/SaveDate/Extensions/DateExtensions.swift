//
//  DateExtensions.swift
//  SaveDate
//
//  Created by Christian Correa on 10/11/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

extension Date {
    var day: Int {
        return Foundation.Calendar.current.component(.day, from: self)
    }
    
    var month: Int {
        return Foundation.Calendar.current.component(.month, from: self)
    }
    
    var weekday: Int {
        return Foundation.Calendar.current.component(.weekday, from: self)
    }
    
    var year: Int {
        return Foundation.Calendar.current.component(.year, from: self)
    }
}
