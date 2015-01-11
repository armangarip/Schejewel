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
    let descript: String
    var workload: Int
    let deadline: NSDate
    let priority: Int
    let hasTime: Bool
    let realPriority: Float
    
    init(title: String, description: String, workload: Int, deadline: NSDate, priority: Int, hasTime: Bool){
        self.title = title
        self.descript = description
        self.workload = workload
        self.deadline = deadline
        self.priority = priority
        self.realPriority = 0
        self.hasTime = hasTime
        self.realPriority = self.calculateRealPriority()
    }
    
    func calculateRealPriority() -> Float {
        let timeDifference = self.deadline.timeIntervalSinceNow
        return Float(self.priority + 1) / Float(timeDifference)
    }   
    
}
