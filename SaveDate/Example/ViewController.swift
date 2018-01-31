//
//  ViewController.swift
//  Example
//
//  Created by Christian Correa on 1/18/18.
//  Copyright © 2018 Twelfth Station Software. All rights reserved.
//

import UIKit
import SaveDate

class ViewController: UIViewController, CalendarDelegate {
    // MARK: - Outlets
    @IBOutlet var dateLabel: UILabel!
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - CalendarDelegate
    func didSelectDate(date: Date) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dateLabel.text = dateFormatter.string(from: date)
    }
    
    
    // MARK: - ViewController
    @IBAction func showCalendar() {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat =  "MM/dd/yyyy"
        
        let date = dateFormatter.date(from: "01/01/2018")!
        let bundle = Bundle(for: CalendarController.self)
        let storyboard = UIStoryboard(name: "SaveDate", bundle: bundle)
        let calendarController = storyboard.instantiateInitialViewController()! as! CalendarController
        
        calendarController.date = date
        calendarController.delegate = self
        
        self.present(calendarController, animated: true, completion: nil)
    }
}
