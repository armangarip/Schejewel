//
//  ViewController.swift
//  Schejewel
//
//  Created by studentx on 17/12/14.
//  Copyright (c) 2014 studentx. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currentIndexPath : Int!
    let prioritizer = Prioritizer()
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prioritizer.events.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentIndexPath = indexPath.item
        self.performSegueWithIdentifier("detailSegue", sender: tableView)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        let label = cell.textLabel
        let item = prioritizer.events[indexPath.item]
        label?.text = item.title
        var colorQuantifier : CGFloat
        if indexPath.item > 8 {
            colorQuantifier = 8.0
        } else {
            colorQuantifier = CGFloat(indexPath.item)
        }
        cell.backgroundColor = UIColor(red: 0.8 - colorQuantifier * 0.1, green: 0.4, blue: 0.4, alpha: 1.0)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        addButton.tintColor = UIColor.blackColor()
        self.tableView.reloadData()
        self.navigationController?.setNavigationBarHidden(true , animated: false)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }

    @IBAction func refresh() {
        self.performSegueWithIdentifier("formSegue", sender: self)
        self.refreshControl?.endRefreshing()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let segueID = segue.identifier {
            if segueID == "formSegue" {
                let destinationVC = segue.destinationViewController as NewEventViewController
                destinationVC.prioritizer = self.prioritizer
            } else if segueID == "detailSegue" {
                let item = self.prioritizer.events[currentIndexPath] as Event
                let destinationVC2 = segue.destinationViewController as DetailsViewController
                destinationVC2.event = item
                destinationVC2.prioritizer = self.prioritizer
            } else {
                NSLog("another segue is not implemented yet.")
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

