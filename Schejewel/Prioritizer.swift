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
        self.sortEvents()
    }
    
    func removeEvent(event: Event) {
        for (index, curEvent) in enumerate(events) {
            if curEvent.title == event.title {
                events.removeAtIndex(index)
                break
            }
        }
    }
    
    func sortEvents(){
        for event in events {
            event.calculateRealPriority()
        }
        self.events.sort {
            event1, event2 in
            return event1.realPriority > event2.realPriority
        }
    }
}
