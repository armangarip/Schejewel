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

    var superView: UITableView!
    var prioritizer: Prioritizer!
    
    @IBOutlet weak var timeSwitch: UISwitch!
    @IBOutlet weak var workloadLabel: UILabel!
    @IBOutlet weak var workloadSlider: UISlider!
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var prioritySelection: UISegmentedControl!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        let event = Event(title: titleLabel.text, description: descriptionLabel.text, workload: Int(workloadSlider.value), deadline: datePicker.date, priority: prioritySelection.selectedSegmentIndex, hasTime: timeSwitch.on)
        prioritizer.addEvent(event)
        dismissViewControllerAnimated(true , completion: nil)
    }
    
    @IBAction func datePickerDateChanged() {
        checkProperness()
    }
    
    @IBAction func titleChanged(sender: AnyObject) {
        checkProperness()
    }
    
    @IBAction func workloadSliderUsed(sender: UISlider) {
        let workload = Int(workloadSlider.value)
        checkProperness()
        workloadLabel.text = String(workload) + " Hours"
    }
    
    func checkProperness() {
        if Int(workloadSlider.value) == 0 || Float(datePicker.date.timeIntervalSinceNow) < 0.0 || titleLabel.text == "" {
            doneButton.enabled = false
        } else {
            doneButton.enabled = true
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workloadLabel.text = "5 Hours"
        prioritySelection.selectedSegmentIndex = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}