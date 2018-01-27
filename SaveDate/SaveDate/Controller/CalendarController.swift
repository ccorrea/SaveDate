//
//  CalendarController.swift
//  SaveDate
//
//  Created by Christian Correa on 1/18/18.
//  Copyright © 2018 Twelfth Station Software. All rights reserved.
//

import Foundation

public class CalendarController: UICollectionViewController {
    // MARK: - Constants
    let footerViewIdentifier = "CalendarFooterView"
    let headerViewIdentifier = "CalendarHeaderView"
    
    
    // MARK: - Properties
    var calendar: Calendar!
    
    
    // MARK: - UIViewController
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.collectionViewLayout = CalendarFlowLayout()
        
        let bundle = Bundle(for: CalendarController.self)
        
        for cellType in CellType.cases {
            let viewCellIdentifier = cellType.rawValue
            let viewCellNib = UINib(nibName: viewCellIdentifier, bundle: bundle)
            
            collectionView?.register(viewCellNib, forCellWithReuseIdentifier: viewCellIdentifier)
        }
        
        let footerViewNib = UINib(nibName: footerViewIdentifier, bundle: bundle)
        let headerViewNib = UINib(nibName: headerViewIdentifier, bundle: bundle)
        
        collectionView?.register(footerViewNib, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerViewIdentifier)
        collectionView?.register(headerViewNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerViewIdentifier)
    }
    
    
    // MARK: - UICollectionViewDataSource
    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let calendarCell = calendar.cells[indexPath.row]
        let reuseIdentifier = calendarCell.type.rawValue
        let dequeuedCell = self.collectionView!.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let calendarViewCell = dequeuedCell as! CalendarViewCell
        
        calendarViewCell.label.text = calendarCell.name
        
        return calendarViewCell
    }
    
    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.calendar.cells.count
    }
    
    override public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let dequeuedView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerViewIdentifier, for: indexPath)
            let headerView = dequeuedView as! CalendarHeaderView
            
            headerView.label.text = calendar.monthName
            
            return headerView
        default:
            let dequeuedView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerViewIdentifier, for: indexPath)
            let footerView = dequeuedView as! CalendarFooterView
            
            return footerView
        }
    }
    
    override public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    // MARK: - CalendarController
    public static func present(caller: UIViewController, date: Date) {
        let bundle = Bundle(for: CalendarController.self)
        let storyboard = UIStoryboard(name: "SaveDate", bundle: bundle)
        let viewController = storyboard.instantiateInitialViewController()! as! CalendarController
        
        viewController.calendar = Calendar(date: date)
        
        caller.present(viewController, animated: true, completion: nil)
    }
}
