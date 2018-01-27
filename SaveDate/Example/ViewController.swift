//
//  ViewController.swift
//  Example
//
//  Created by Christian Correa on 1/18/18.
//  Copyright © 2018 Twelfth Station Software. All rights reserved.
//

import UIKit
import SaveDate

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showCalendar() {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat =  "MM/dd/yyyy"
        
        let date = dateFormatter.date(from: "01/01/2018")!
        
        CalendarController.present(caller: self, date: date)
    }
}
