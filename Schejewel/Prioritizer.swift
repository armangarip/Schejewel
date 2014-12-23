//
//  Prioritizer.swift
//  Schejewel
//
//  Created by studentx on 23/12/14.
//  Copyright (c) 2014 studentx. All rights reserved.
//

import Foundation

class Prioritizer {
    var events: [Event]
    
    init(){
        events = [Event]()
    }
    
    func addEvent(event: Event){
        self.events.append(event)
        println("Event titled \(event.title) added.")
    }
    
    func sortEvents(){
        self.events.sort {
            event1, event2 in
            return event1.priority < event2.priority
        }
    }
    
    func populatePrioritizer(){
    }
}
