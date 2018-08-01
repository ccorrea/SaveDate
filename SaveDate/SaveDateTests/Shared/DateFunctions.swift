//
//  DateFunctions.swift
//  SaveDateTests
//
//  Created by Christian Correa on 3/5/17.
//  Copyright © 2017 Christian Correa. All rights reserved.
//

import Foundation

func createDate(from: String) -> Date? {
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = "MM/dd/yyyy"
    
    return dateFormatter.date(from: from)
}
