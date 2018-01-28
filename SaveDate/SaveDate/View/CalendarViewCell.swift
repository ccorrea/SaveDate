//
//  CalendarViewCell.swift
//  SaveDate
//
//  Created by Christian Correa on 1/18/18.
//  Copyright © 2018 Twelfth Station Software. All rights reserved.
//

import UIKit

public class CalendarViewCell: UICollectionViewCell {
    // MARK: - Properties (Public)
    @IBOutlet public var label: UILabel!
    
    
    // MARK: - Properties (Private)
    private var savedBackgroundColor: UIColor?
    private var savedTextColor: UIColor?
    
    
    // MARK: - UIView
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - CalendarViewCell
    public func resetLabelColor() {
        label.backgroundColor = savedBackgroundColor
        label.textColor = savedTextColor
        
        savedBackgroundColor = nil
        savedTextColor = nil
    }
    
    public func setLabelColor(backgroundColor: UIColor, textColor: UIColor) {
        savedBackgroundColor = label.backgroundColor
        savedTextColor = label.textColor
        
        label.backgroundColor = backgroundColor
        label.textColor = textColor
    }
}
