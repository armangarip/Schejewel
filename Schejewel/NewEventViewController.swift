//
//  NewEventViewController.swift
//  Schejewel
//
//  Created by studentx on 23/12/14.
//  Copyright (c) 2014 studentx. All rights reserved.
//

import Foundation
import UIKit

class NewEventViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workloadLabel.text = "5 Hours"
    }
    
    @IBOutlet weak var timeSwitch: UISwitch!
    @IBOutlet weak var workloadLabel: UILabel!
    @IBOutlet weak var workloadSlider: UISlider!
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var prioritySelection: UISegmentedControl!
    
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        let event = Event(title: titleLabel.text, description: descriptionLabel.text, workload: Int(workloadSlider.value), deadline: datePicker.date, priority: prioritySelection.selectedSegmentIndex)
        println("Event titled \(event.title) created.")
    }
    
    @IBAction func workloadSliderUsed(sender: UISlider) {
        let workload = Int(workloadSlider.value)
        workloadLabel.text = String(workload) + " Hours"
    }

    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true , completion: nil)
    }
    
    @IBAction func timeSwitched(sender: UISwitch) {
        if timeSwitch.on {
            datePicker.datePickerMode = UIDatePickerMode.DateAndTime
            datePicker.minuteInterval = 10
        } else {
            datePicker.datePickerMode = UIDatePickerMode.Date
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}