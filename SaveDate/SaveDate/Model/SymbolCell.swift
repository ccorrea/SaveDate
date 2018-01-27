//
//  Header.swift
//  SaveDate
//
//  Created by Christian Correa on 10/4/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

struct SymbolCell: Cell {
    let name: String
    let type: CellType
    
    init(name: String) {
        self.name = name
        self.type = .symbol
    }
}
