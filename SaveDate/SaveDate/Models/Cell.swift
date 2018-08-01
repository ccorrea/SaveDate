//
//  Cell.swift
//  SaveDate
//
//  Created by Christian Correa on 10/4/17.
//  Copyright © 2017 Twelfth Station Software. All rights reserved.
//

import Foundation

protocol Cell {
    var name: String { get }
    var type: CellType { get }
}
