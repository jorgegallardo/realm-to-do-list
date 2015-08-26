//
//  TodoItem.swift
//  ToDo Advanced
//
//  Created by Jorge Gallardo on 8/25/15.
//  Copyright © 2015 Jorge Gallardo. All rights reserved.
//

import Foundation
import Realm

class TodoItem: RLMObject {
    dynamic var name = ""
    dynamic var note = ""
    dynamic var completed = false
    
//    init(name: String, note: String) {
//        self.name = name
//        self.note = note
//    }
    
    
}