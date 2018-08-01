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
    
    
    // MARK: - Properties (Public)
    public var delegate: CalendarDelegate?
    public var date: Date {
        get {
            return calendar.date
        }
        set(newDate) {
            calendar = Calendar(date: newDate)
        }
    }
    
    
    // MARK: - Properties (Internal)
    var calendar: Calendar!
    var selectedDate: Date!
    var selectedViewCell: CalendarViewCell!
    
    
    // MARK: - UIViewController
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.allowsSelection = true
        collectionView?.collectionViewLayout = CalendarFlowLayout()
        
        let bundle = Bundle(for: CalendarController.self)
        let viewsNamedSelected = bundle.loadNibNamed("Selected", owner: self, options: nil)!
        
        self.selectedDate = self.calendar.date
        self.selectedViewCell = viewsNamedSelected.first as! CalendarViewCell
        
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
            
            footerView.cancelButton.addTarget(self, action: #selector(cancelSelection), for: UIControlEvents.touchUpInside)
            footerView.setDateButton.addTarget(self, action: #selector(selectDate), for: UIControlEvents.touchUpInside)
            
            return footerView
        }
    }
    
    override public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    // MARK: - UICollectionViewDelegate
    override public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let genericCell = collectionView.cellForItem(at: indexPath)
        let calendarViewCell = genericCell as! CalendarViewCell
        
        calendarViewCell.resetLabelColor()
    }
    
    override public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let genericCell = collectionView.cellForItem(at: indexPath)
        let calendarViewCell = genericCell as! CalendarViewCell
        let backgroundColor = selectedViewCell.label.backgroundColor!
        let textColor = selectedViewCell.label.textColor!
        
        calendarViewCell.setLabelColor(backgroundColor: backgroundColor, textColor: textColor)
        
        let modelCell = calendar.cells[indexPath.row]
        let dayCell = modelCell as! DayCell
        
        self.selectedDate = dayCell.date
    }
    
    override public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let calendarCell = calendar.cells[indexPath.row]
        let isWeekdaySymbol = (calendarCell.type == .symbol) || (calendarCell.type == .dimmed)
        let shouldSelectItem = !isWeekdaySymbol
        
        return shouldSelectItem
    }
    
    
    // MARK: - CalendarController
    @IBAction public func cancelSelection() {
        guard let theDelegate = self.delegate else {
            return
        }
        
        theDelegate.didCancelSelectionFromCalendar()
    }
    
    @IBAction public func selectDate() {
        guard let theDelegate = self.delegate else {
            return
        }
        
        theDelegate.didSelectDateFromCalendar(date: self.selectedDate)
    }
}
