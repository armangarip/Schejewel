//
//  DetailsViewController.swift
//  Schejewel
//
//  Created by studentx on 24/12/14.
//  Copyright (c) 2014 studentx. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController : UIViewController {
    
    var event : Event!
    var prioritizer : Prioritizer!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var workloadSlider: UISlider!
    @IBOutlet weak var workloadLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    @IBAction func swiped(sender: AnyObject) {
        dismissViewControllerAnimated(true , completion: nil)
    }
    
    func reloadData(){
        self.workloadSlider.minimumValue = 0.0
        self.workloadSlider.maximumValue = Float(event.workload)
        workloadSlider.value = 0
        workloadLabel.text = "\(event.workload) hours of work remaining"
        checkWorkload()
    }
    
    func checkWorkload() {
        if event.workload == 0 {
            let alert = UIAlertController(title: "Congratulaions!", message: "You have completed your task.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in self.deleteEvent()}))
            self.presentViewController(alert, animated: true, completion: nil)
       }
    }
    
    func deleteEvent() {
        prioritizer.removeEvent(self.event)
        dismissViewControllerAnimated(true , completion: nil)
    }
    
    @IBAction func workloadSliderValueChanged() {
        workloadLabel.text = "\(event.workload - Int(workloadSlider.value)) hours of work remaining"
    }
    
    @IBAction func applyButtonClicked() {
        event.workload -= Int(workloadSlider.value)
        prioritizer.sortEvents()
        reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.topItem?.title = event.title
        let formatter = NSDateFormatter()
        let eventTimeStyle = event.hasTime ? NSDateFormatterStyle.ShortStyle : NSDateFormatterStyle.NoStyle
        let dateString = formatter.stringFromDate(event.deadline)
        descriptionLabel.text = "\(event.descript) \n \n  You have to complete this task by:"
        timeLabel.text = NSDateFormatter.localizedStringFromDate(event.deadline, dateStyle: .ShortStyle, timeStyle: eventTimeStyle)
        reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}