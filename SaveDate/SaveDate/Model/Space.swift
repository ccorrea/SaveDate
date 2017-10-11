//
//  Space.swift
//  SaveDate
//
//  Created by Christian Correa on 10/10/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

struct Space: Cell {
    var name: String
    var type: CellType
    
    init() {
        self.name = ""
        self.type = .space
    }
}
