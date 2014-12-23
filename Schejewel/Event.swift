//
//  Event.swift
//  Schejewel
//
//  Created by studentx on 23/12/14.
//  Copyright (c) 2014 studentx. All rights reserved.
//

import Foundation

class Event {
    let title: String
    let description: String
    var workload: Int
    let deadline: NSDate
    let priority: Int
    
    init(title: String, description: String, workload: Int, deadline: NSDate, priority: Int){
        self.title = title
        self.description = description
        self.workload = workload
        self.deadline = deadline
        self.priority = priority
    }
    
    
}
