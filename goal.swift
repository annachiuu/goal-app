//
//  goal.swift
//  goal-app
//
//  Created by anna :)  on 9/4/16.
//  Copyright © 2016 Anna Chiu. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase
import UIKit


class Goal {
    
    private var _title: String!
    private var _description: String!
    private var _goalKey: String!
    private var _goalRef: FIRDatabaseReference!
//    private var _imgUrl: String?
    
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    var goalKey: String {
        return _goalKey
    }
    
    var goalRef: FIRDatabaseReference {
        return _goalRef
    }
    
//    var imageUrl: String? {
//        return _imgUrl
//    }
    
//    init() {
//        self._title = "EXAMPLE TITLE"
//        self._description = "Example description of what habit the user is trying to instill"
//    }
    
    init(title: String, description: String) {
        self._title = title
        self._description = description
//        self._imgUrl = imgUrl
    }
    
    init(goalKey: String, dictionary: Dictionary<String, AnyObject>) {
        self._goalKey = goalKey
        if let title_FIR = dictionary["title"] as?  String {
            self._title = title_FIR
        }
        
        if let desc_FIR = dictionary["description"] as? String {
            self._description = desc_FIR
        }
        
        self._goalRef = DataService.ds.REF_GOAL.child(self._goalKey) //turned it from a string into a pathway for reference!
        
    }
    
}