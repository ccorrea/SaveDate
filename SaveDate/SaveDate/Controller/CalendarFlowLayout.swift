//
//  CalendarFlowLayout.swift
//  SaveDate
//
//  Created by Christian Correa on 1/26/18.
//  Copyright © 2018 Twelfth Station Software. All rights reserved.
//

import UIKit

class CalendarFlowLayout: UICollectionViewFlowLayout {
    let cellsPerRow: Int = 7
    
    override var itemSize: CGSize {
        get {
            guard let collectionView = collectionView else {
                return super.itemSize
            }
            
            let margins = sectionInset.left + sectionInset.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let exactLength = ((collectionView.bounds.size.width - margins) / CGFloat(cellsPerRow))
            let roundedLength = exactLength.rounded(.down)
            
            return CGSize(width: roundedLength, height: roundedLength)
        }
        set {
            super.itemSize = newValue
        }
    }
    
    init(minimumInteritemSpacing: CGFloat, minimumLineSpacing: CGFloat, sectionInset: UIEdgeInsets) {
        super.init()
        
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        let shouldInvalidateContext = (newBounds != collectionView?.bounds)
        
        context.invalidateFlowLayoutDelegateMetrics = shouldInvalidateContext
        
        return context
    }
}
