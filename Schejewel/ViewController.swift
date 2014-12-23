//
//  ViewController.swift
//  Schejewel
//
//  Created by studentx on 17/12/14.
//  Copyright (c) 2014 studentx. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let prioritizer = Prioritizer()

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as UITableViewCell
        
        let label = cell.viewWithTag(3) as UILabel
        label.text = prioritizer.events[indexPath.item].title
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

