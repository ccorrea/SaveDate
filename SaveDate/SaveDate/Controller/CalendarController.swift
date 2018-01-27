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
    let reuseIdentifierSuffix = "Cell"
    
    
    // MARK: - Properties (Private)
    var calendar: Calendar!
    
    
    // MARK: - UIViewController
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let edgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        let calendarFlowLayout = CalendarFlowLayout(minimumInteritemSpacing: 10.0, minimumLineSpacing: 10.0, sectionInset: edgeInsets)
        
        collectionView?.collectionViewLayout = calendarFlowLayout
        
        for cellType in CellType.cases {
            let bundle = Bundle(for: CalendarController.self)
            let reuseIdentifier = cellType.rawValue + reuseIdentifierSuffix
            let nib = UINib(nibName: reuseIdentifier, bundle: bundle)
            
            collectionView?.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        }
    }
    
    
    // MARK: - UICollectionViewDataSource
    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let calendarCell = calendar.cells[indexPath.row]
        let reuseIdentifier = calendarCell.type.rawValue + reuseIdentifierSuffix
        let cell = self.collectionView!.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let saveDateCell = cell as! SaveDateCell
        
        saveDateCell.label.text = calendarCell.name
        
        return saveDateCell
    }
    
    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.calendar.cells.count
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
